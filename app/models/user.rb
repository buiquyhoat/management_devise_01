class User < ApplicationRecord
  attr_accessor :remember_token, :reset_token, :name, :default_parent_path

  belongs_to :department, optional: true

  has_many :return_devices, dependent: :destroy
  has_many :assignments, dependent: :destroy
  has_many :devises, through: :assignments
  has_many :requests, dependent: :destroy
  has_many :user_role, dependent: :destroy
  has_many :user_group, dependent: :destroy

  scope :of_department, ->department_id do
    where department_id: department_id if department_id.present?
  end

  validates :first_name, presence: true,
    length: {maximum: Settings.max_length_name}
  validates :last_name, presence: true,
    length: {maximum: Settings.max_length_name}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
    length: {maximum: Settings.max_length_email},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true,
    length: {minimum: Settings.min_length_password}
  mount_uploader :avatar, AvatarUploader

  before_save :downcase_email
  after_initialize :create_another

  scope :below_staff, ->parent_path, user_id do
    where "id in (select u.id from users as u left join user_groups as ug on ug.user_id = u.id
    left join groups as g on g.id = ug.group_id where g.parent_path LIKE ? and
    ug.is_default_group = true) or id = ?",
    convert_like(parent_path), user_id
  end

  class << self

    def convert_like param
      "#{param}%"
    end

    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create string, cost: cost
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update_attribute :remember_digest, User.digest(remember_token)
  end

  def forget
    update_attribute :remember_digest, nil
  end

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false unless digest
    BCrypt::Password.new(digest).is_password? token
  end

  def highest_permission entry, action
    user_group.each do |ug|
      return true if ug.group.highest_permission entry, action
    end
    false
  end

  def permission_default_group entry, action
    user_group.each do |ug|
      return true if (ug.group.highest_permission(entry, action) && ug.is_default_group)
    end
    false
  end

  def current_permission
    return Settings.action.approve if can_approve
    return Settings.action.waiting_done if can_waiting_done
    return Settings.action.done if can_done
    return Settings.action.create if can_make_request
  end

  def can_assign_to?
    can_approve || can_waiting_done
  end

  def can_manage_request
    can_approve || can_waiting_done || can_done
  end

  def can_make_request
    highest_permission Settings.entry.request, Settings.action.create
  end

  def permission_default_group entry, action
    user_group.each do |ug|
      return true if (ug.group.highest_permission(entry, action) && ug.is_default_group)
    end
    false
  end

  def can_manage_device
    highest_permission Settings.entry.device, Settings.action.create
  end

  def can_approve
    highest_permission Settings.entry.request, Settings.action.approve
  end

  def can_waiting_done
    highest_permission Settings.entry.request, Settings.action.waiting_done
  end

  def can_done
    highest_permission Settings.entry.request, Settings.action.done
  end

  def is_admin
    highest_permission Settings.entry.admin, Settings.action.create
  end

  def get_default_parent_path
    highest_group = nil
    user_group.each do |ug|
      if self.default_parent_path.nil? ||
        self.default_parent_path.length > ug.group.parent_path.length
        highest_group = ug.group
        self.default_parent_path = ug.group.parent_path
      end
    end
    if highest_group.present?
      self.default_parent_path += "/" + highest_group.id.to_s
    end

  end

  private

  def downcase_email
    self.email = email.downcase
  end

  def create_another
    get_default_parent_path
    self.name = "#{first_name} #{last_name}"
  end

  def avatar_size
    errors.add :avatar, t("user.max_image_size") if avatar.size > 5.megabytes
  end
end

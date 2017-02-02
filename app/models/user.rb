class User < ApplicationRecord
  attr_accessor :remember_token, :reset_token, :name

  belongs_to :department, optional: true

  has_many :return_devices, dependent: :destroy
  has_many :assignments, dependent: :destroy
  has_many :devises, through: :assignments
  has_many :requests, dependent: :destroy
  has_many :user_role, dependent: :destroy

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

  scope :manage_list_staffs, ->user do
    where "department_id= ? OR id in (select u.id from users as u left join
      user_roles as ur on ur.user_id = u.id where ur.role_id = ?)",
      user.department_id, Settings.user_role.manager
  end

  scope :normal_list_staffs, ->user do
    where "department_id = ? AND id in (select u.id from users as u left join
      user_roles as ur on ur.user_id = u.id where ur.role_id = ?)",
      user.department_id, Settings.user_role.manager
  end

  class << self
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

  def is_admin?
    user_role.any?{|ur| ur.role_id == Settings.user_role.admin}
  end

  def is_back_officer?
    department_id.present? && department_id === Settings.department.back_officer
  end

  def is_manager?
    user_role.any?{|ur| ur.role_id == Settings.user_role.manager}
  end

  def is_staff?
    is_manager? || user_role.any?{|ur| ur.role_id == Settings.user_role.staff}
  end

  private

  def downcase_email
    self.email = email.downcase
  end

  def create_another
    self.name = first_name + last_name
  end

  def avatar_size
    errors.add :avatar, t("user.max_image_size") if avatar.size > 5.megabytes
  end
end

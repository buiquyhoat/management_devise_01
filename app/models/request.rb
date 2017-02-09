class Request < ApplicationRecord
  attr_accessor :creater, :updater, :readonly, :assignee

  after_create_commit :create_hitory_for_create
  after_update_commit :create_hitory_for_update

  belongs_to :request_type
  belongs_to :request_status
  belongs_to :for_user, class_name: User.name
  has_many :request_details, dependent: :destroy, inverse_of: :request
  has_many :devices, through: :request_details

  delegate :name, to: :request_status, prefix: true, allow_nil: true

  validates :title, :description, presence: true

  accepts_nested_attributes_for :request_details,
    reject_if: proc{|attributes| attributes[:description].blank?}

  after_initialize :create_extend_data
  scope :order_by, ->{order created_at: :desc, updated_at: :desc}
  scope :find_by_actor, ->user_id do
    if user_id.present?
      where "id in (select r.id from requests as r
        where r.assignee_id = ? or r.created_by = ? or r.updated_by = ?
        or r.for_user_id = ?)", user_id, user_id, user_id, user_id
    end
  end

  class << self
    def convert_like param
      "#{param}%"
    end
  end

  scope :find_for_user, ->current_id do
    where for_user_id: current_id if current_id.present?
  end
  scope :request_of_below_staff, ->parent_path, current_id do
    where "for_user_id in (select u.id from users as u left join user_groups as
      ug on ug.user_id = u.id left join groups as g on g.id = ug.group_id where
      g.parent_path LIKE ?) OR id in (select r.id from requests as r where
      r.assignee_id = ?)", convert_like(parent_path), current_id
  end

  scope :request_can_access, ->parent_path, current_id do
    where "for_user_id in (select u.id from users as u left join user_groups as
      ug on ug.user_id = u.id left join groups as g on g.id = ug.group_id where
      g.parent_path LIKE ?) OR id in (select r.id from requests as r where
      r.assignee_id = ?) OR request_status_id != 1",
      convert_like(parent_path), current_id
  end

  scope :of_request_type, ->request_type_id do
    where request_type_id: request_type_id if request_type_id.present?
  end

  scope :of_request_status, ->request_status_id do
    where request_status_id: request_status_id if request_status_id.present?
  end

  def is_approved?
    request_status_id == Settings.request_status.approved
  end

  def is_need_approve?
    request_status_id == Settings.request_status.waiting_approve ||
    request_status_id == Settings.request_status.cancelled
  end

  def show_approve? user
    user.can_approve
  end

  def show_cancel?
    request_status_id != Settings.request_status.done
  end

  def show_send? user
    request_status_id != Settings.request_status.approved &&
    request_status_id != Settings.request_status.done && !show_approve(user)
  end
  def show_assignment user
    user.can_assignment && request_status_id == Settings.request_status.approved
  end

  def allow_change_status user
    user.can_approve || user.can_assignment
  end
  def allow_edit? user
    staff = User.below_staff(user.default_parent_path).find_by id: created_by
    user.id == created_by || user.id == updated_by || user.id == assignee_id ||
    user.can_assignment || (staff.present? && user.can_approve)
  end

  def owner? user
    return false if created_by.present? && created_by != user.id
    true
  end
  private

  def create_extend_data
    self.creater = User.find_by id: created_by
    self.updater = User.find_by id: updated_by
    self.assignee = User.find_by id: assignee_id if assignee_id.present?
  end

  def create_history action
    user_name = get_created_name created_by
    content = I18n.t("history.request",action: action, name: user_name)
    history_data = {"content": content, "status": request_status_name}
    create_hitory id, history_data.to_json, Settings.history_type.request
  end
end

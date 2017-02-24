class Request < ApplicationRecord
  attr_accessor :creater, :updater, :readonly, :assignee, :request_status_name

  belongs_to :request_type
  belongs_to :request_status
  belongs_to :for_user, class_name: User.name
  has_many :request_details, dependent: :destroy, inverse_of: :request
  has_many :devices, through: :request_details

  delegate :name, to: :request_status, prefix: true, allow_nil: true

  validates :title, :description, presence: true

  accepts_nested_attributes_for :request_details,
    reject_if: proc{|attributes| attributes[:description].blank?}

  after_create_commit :create_hitory_for_create
  after_update_commit :create_hitory_for_update
  after_initialize :create_extend_data
  after_save :create_notification

  scope :order_by_time, ->{order created_at: :desc, updated_at: :desc}
  scope :sort_by_status, ->{sort_by request_status_id}
  scope :of_actor, ->user_id do
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

  scope :of_for_user, ->user_id, parent_path, user do
    if user_id.present?
      where for_user_id: user_id
    else
      request_manage parent_path, user
    end
  end

  scope :with_status, ->request_status_id do
    where request_status_id: request_status_id if request_status_id.present?
  end

  scope :request_of_below_staff, ->parent_path, current_id do
    where "for_user_id in (select u.id from users as u left join user_groups as
      ug on ug.user_id = u.id left join groups as g on g.id = ug.group_id where
      g.parent_path LIKE ? and ug.is_default_group = true )", convert_like(parent_path)
  end

  scope :request_manage, ->parent_path, user do
    if user.present?
      case user.current_permission
      when Settings.action.approve
        where "for_user_id in (select u.id from users as u left join user_groups as
          ug on ug.user_id = u.id left join groups as g on g.id = ug.group_id where
          g.parent_path LIKE ? and ug.is_default_group = true) or for_user_id = ?", convert_like(parent_path), user.id
      when Settings.action.waiting_done
        where "request_status_id >= ? or (request_status_id = ? and updated_by = ?)",
          Settings.request_status.approved, Settings.request_status.cancelled, user.id
      when Settings.action.done
        where request_status_id: [Settings.request_status.waiting_done, Settings.request_status.done]
      end
    end
  end

  scope :request_not_self, -> user do
    where.not for_user_id: user.id
  end

  scope :request_manage_request_approve, ->parent_path, user do
    where "for_user_id in (select u.id from users as u left join user_groups as
      ug on ug.user_id = u.id left join groups as g on g.id = ug.group_id where
      g.parent_path LIKE ?)", convert_like(parent_path)
  end

  scope :request_manage_request_waiting_done, ->parent_path, user do
    where "request_status_id >= ? or (request_status_id = ? and updated_by = ?)",
      Settings.request_status.approved, Settings.request_status.cancelled, user.id
  end

  scope :request_manage_request_done, ->parent_path, user do
    where request_status_id: [Settings.request_status.waiting_done, Settings.request_status.done]
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

  def show_approve_request? user
    user.can_approve && request_status_id == Settings.request_status.waiting_approve
  end

  def show_cancel_request? user
    case request_status_id
    when Settings.request_status.waiting_approve
      user.can_make_request && created_by == user.id || user.can_approve
    when Settings.request_status.approved
      user.can_waiting_done || (user.can_approve && user.id == updated_by)
    else
      false
    end
  end

  def show_reupdate? user
    user.current_permission.present? && user.id == created_by &&
    request_status_id == Settings.request_status.cancelled &&
    (user.current_permission == Settings.action.create || user.current_permission == Settings.action.approve)
  end

  def show_revert_waiting? user
    user.current_permission == Settings.action.approve && user.id == updated_by &&
    user.id != created_by && request_status_id == Settings.request_status.approved
  end
  def show_approve_request? user
    user.can_approve && request_status_id == Settings.request_status.waiting_approve
  end

  def show_waiting_approve? user
    user.can_make_request && request_status_id == Settings.request_status.cancelled
  end
  def show_waiting_done? user
    user.can_waiting_done && request_status_id == Settings.request_status.approved
  end

  def show_assignment_request? user
    user.can_done && request_status_id == Settings.request_status.waiting_done
  end

  def allow_change_status? user
    id.present? && (user.can_approve || allow_edit?(user))
  end

  def allow_edit? user
    user_staff_edit_request?(user) || user_manager_edit_request?(user) ||
    user_manager_bo_edit_request?(user)
  end

  def user_staff_edit_request? user
    user.can_make_request && user.id == created_by &&
    request_status_id <= Settings.request_status.waiting_approve
  end

  def user_manager_edit_request? user
    staff = User.below_staff(user.default_parent_path, user.id).find_by id: created_by
    user.can_approve && (user.id == created_by || staff.present?) &&
    (request_status_id == Settings.request_status.waiting_approve ||
    (request_status_id == Settings.request_status.cancelled && created_by == user.id) ||
    (request_status_id == Settings.request_status.approved &&
    (for_user_id == user.id || updated_by == user.id)))
  end

  def user_manager_bo_edit_request? user
    user.can_waiting_done && request_status_id == Settings.request_status.approved
  end

  def owner? user
    return true if id.nil? || created_by.present? && created_by == user.id
    false
  end

  def status_reupdate user
    case user.current_permission
    when Settings.action.create
      Settings.request_status.waiting_approve
    when Settings.action.approve
      if request_status_id == Settings.request_status.approved
        Settings.request_status.waiting_approve
      else
        Settings.request_status.approved
      end
    end
  end

  def title_update user
    case user.current_permission
    when Settings.action.approve
      if request_status_id == Settings.request_status.approved
        I18n.t("request.action.re_back_waiting")
      else
        I18n.t("request.action.re_approve")
      end
    when Settings.action.create
      I18n.t("request.action.re_send")
    end
  end

  private

  def create_extend_data
    self.creater = User.find_by id: created_by
    self.updater = User.find_by id: updated_by
    self.assignee = User.find_by id: assignee_id if assignee_id.present?
    self.request_status_name = get_request_status_name request_status_id
  end

  def create_history action
    user_name = get_created_name created_by
    content = I18n.t("history.request",action: action, name: user_name)
    history_data = {"content": content, "status": request_status_name}
    create_hitory id, history_data.to_json, Settings.history_type.request
  end

  def create_notification
    if created_at == updated_at
      message = I18n.t("notification.message.request_message",
        request_title: title, action: I18n.t("notification.action.created"))
    else
      message = I18n.t("notification.message.request_message_update",
        request_title: title, action: I18n.t("notification.action.updated"), status: request_status.name)
    end
    create_notify updated_by, for_user_id,
      message, Rails.application.routes.url_helpers.requests_path
    if assignee_id.present?
      create_notify updated_by, assignee_id,
      message, Rails.application.routes.url_helpers.requests_path
    end
  end

  def get_request_status_name request_status_id
    case request_status_id
    when Settings.request_status.cancelled
      I18n.t("request_status.cancelled")
    when Settings.request_status.waiting_approve
      I18n.t("request_status.waiting_approve")
    when Settings.request_status.approved
      I18n.t("request_status.approved")
    when Settings.request_status.waiting_done
      I18n.t("request_status.waiting_done")
    when Settings.request_status.done
      I18n.t("request_status.done")
    end
  end
end

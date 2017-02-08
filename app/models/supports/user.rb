class Supports::User
  include ApplicationHelper
  def initialize user
    @user = user
  end
  def created_by user_id
    all_users
    created = @all_users.find_by id: user_id
    @created_by = created.name if created.present?
  end

  def device_categories
    @device_categories ||= DeviceCategory.all
  end

  def device_status_not_include_using
    @device_status ||= DeviceStatus.not_in_ids Settings.device_status.using
  end

  def device_status_all
    @device_status ||= DeviceStatus.all
  end

  def device_group_categories
    @device_group_categories ||= DeviceGroup.all
  end

  def device_can_assign
    @device_can_assign ||= Device.can_assign
  end

  def invoices
    @device_invoices ||= Invoice.all
  end

  def requests
    @requests ||= Request.all
  end

  def all_users
    @all_users ||= User.all
  end

  def derpartment_user department_id
    @derpartment_user ||= User.of_department department_id
  end

  def user_can_assignment
    @user_can_assignment ||= user_have_permission Settings.entry.assignment,
      Settings.action.create
  end

  def user_can_approve
    @user_can_approve ||= user_have_permission Settings.entry.request,
      Settings.action.approve
  end

  def request_statuses
    @request_statuses ||= RequestStatus.all
  end

  def request_status_approve
    @request_status_approve ||= RequestStatus.request_status_approve
  end

  def request_status_assigment
    @request_status_assigment ||= RequestStatus.request_status_assigment
  end

  def available_assign_staff
    @user.is_admin? || @user.is_manager? ? User.manage_list_staffs(@user) : User.normal_list_staffs(@user)
  end

  def staffs
    @staffs ||= available_assign_staff
  end

  def below_staffs
    if @user.highest_permission(Settings.entry.request, Settings.action.approve)
      @below_staffs ||= User.below_staff @user.default_parent_path
    else
      @below_staffs = [@user]
    end
  end

  def request_types
    @request_types ||= RequestType.all
  end

  def device_categories
    @device_categories ||= DeviceCategory.all
  end

  def request_statuses_search
    @request_statuses_search ||= RequestStatus.all
  end

  def request_types_search
    @request_types_search ||= RequestType.all
  end

  def device_categories_search
    @device_categories_search ||= DeviceCategory.all
  end
end

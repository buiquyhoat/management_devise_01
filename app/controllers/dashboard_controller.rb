class DashboardController < ApplicationController
  before_action :logged_in_user

  def index
    load_request_dashboard false
    load_device_dashboard false
  end

  def request_chart
    case params[:type]
    when Settings.chart_type.request
      load_request_dashboard true
    when Settings.chart_type.device
      load_device_dashboard true
    else
      json_response false, t("dashboard.not_supply")
    end
  end

  private

  def load_device_dashboard isRemote
    if @current_user.can_manage_device
      @device_categories = DeviceCategory.all
      @device_categories.each do |cat|
        cat.extend_dashboard_data
      end
      @device_categories = @device_categories.sort_by {|obj| -obj.device_total}
        .sort_by {|obj| -obj.using_percent}
        .sort_by {|obj| -obj.device_assignment}
        .first(Settings.top_dashboard)
      @device_chartobj = DeviceStatus.calculate_device_dashboard
      isRemote ? json_request_chart_response(true, @device_chartobj) : @device_chartobj
    end
  end

  def load_request_dashboard isRemote
    user_id = nil
    case @current_user.current_permission
    when Settings.action.done, Settings.action.waiting_done, Settings.action.approve
      @request = get_request_top unless isRemote
    else
      @requests = get_my_requests_top unless isRemote
      user_id = @current_user.id
    end
    @chartobj = RequestStatus.calculate_request_dashboard user_id, @current_user
    isRemote ? json_request_chart_response(true, @chartobj) : @chartobj
  end

  def get_my_requests_top
    Request.of_for_user(@current_user.id, @current_user.default_parent_path,
      @current_user).order_by_time
      .first(Settings.top_dashboard)
      .sort_by {|obj| obj.request_status_id}
  end

  def get_request_top
    @requests = Request.request_manage(@current_user.default_parent_path,
      @current_user)
      .request_not_self(@current_user)
      .order_by_time
      .first(Settings.top_dashboard)
      .sort_by {|obj| obj.request_status_id}
  end
end

class DashboardController < ApplicationController
  before_action :logged_in_user

  def index
    load__request_dashboard false
  end

  def request_chart
    load__request_dashboard true
  end

  private

  def load__request_dashboard isRemote
    init_request_chart
    user_id = nil
    case @current_user.current_permission
    when Settings.action.done, Settings.action.waiting_done, Settings.action.approve
      @request = get_request_top
    else
      @requests = get_my_requests_top unless isRemote
      user_id = @current_user.id
    end
    calculate_request_persent user_id
    get_request_chart_object isRemote
  end

  def get_my_requests_top
    Request.find_for_user(@current_user.id).order_by.first(5)
  end

  def get_request_top
    @requests = Request.request_manage(@current_user.default_parent_path, @current_user)
    .order_by.first(5)
  end

  def calculate_request_persent user_id
    total_requests = Request.find_for_user(user_id).count
    if total_requests != 0
      RequestStatus.all.each do |status|
        request_items = Request.find_by_status(status.id)
          .find_for_user(user_id).count        
        @chartobj[:data] << request_items
        @chartobj[:datapercent] << get_percent(request_items, total_requests)
        @chartobj[:request_status] << status.id
        @chartobj[:labels] << status.name
      end
    end
  end

  def get_request_chart_object isRemote
    @chartobj[:backgroundColor] = ['#BDC3C7', '#9B59B6', '#E74C3C', '#26B99A', '#3498DB']
    @chartobj[:hoverBackgroundColor] = ['#CFD4D8', '#B370CF', '#E95E4F', '#36CAAB', '#49A9EA']
    @chartobj[:colors] = ["aero", "purple",  "red", "green", "blue"]
    @chartobj[:have_data] = @chartobj[:datapercent].count != 0
    if isRemote
      json_request_chart_response true, @chartobj
    else
      @chartobj
    end
  end
  def init_request_chart
    @chartobj = {type:"doughnut", labels: [], data: [], datapercent:[], backgroundColor: [],
      hoverBackgroundColor: [], colors: [], have_data: false, request_status: []}
  end
  def get_percent part, total
    part * 100 / total
  end
end

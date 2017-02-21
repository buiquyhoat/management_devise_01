class RequestStatus < ApplicationRecord
  has_many :requests, dependent: :destroy

  scope :request_status_staff_waiting_approve, ->do
    where id: [Settings.request_status.waiting_approve,
      Settings.request_status.cancelled]
  end

  scope :request_status_manager_cancelled, ->do
    where id: [Settings.request_status.cancelled,
      Settings.request_status.approved]
  end

  scope :request_status_manager_waiting_approve, ->do
    where.not id: [Settings.request_status.waiting_done,
      Settings.request_status.done]
  end

  scope :request_status_bomanager_cancelled, ->do
    where.not id: [Settings.request_status.waiting_approve,
      Settings.request_status.done, Settings.request_status.approved]
  end

  scope :request_status_bomanager_waiting_done, ->do
    where id: [Settings.request_status.cancelled,
      Settings.request_status.waiting_done, Settings.request_status.approved]
  end

  class << self

    def calculate_request_dashboard user_id, current_user
      chartobj = init_request_chart
      total_requests = Request.of_for_user(user_id,
        current_user.default_parent_path, current_user).count
      if total_requests != 0
        RequestStatus.all.each do |status|
          request_items = status.requests.of_for_user(user_id,
            current_user.default_parent_path, current_user).count
          chartobj[:data] << request_items
          chartobj[:datapercent] << get_percent(request_items, total_requests)
          chartobj[:request_status] << status.id
          chartobj[:labels] << status.name
          chartobj[:backgroundColor] = Settings.dashboard.request.backgroundColor
          chartobj[:hoverBackgroundColor] = Settings.dashboard.request.hoverBackgroundColor
          chartobj[:colors] = Settings.dashboard.request.colors
          chartobj[:have_data] = @chartobj[:datapercent].count != 0
        end
      end
      chartobj
    end

    def get_percent part, total
      part * 100 / total
    end

    def init_request_chart
      @chartobj = {type: Settings.dashboard.request.type, labels: [], data: [],
        datapercent:[], backgroundColor: [], hoverBackgroundColor: [], colors: [],
        have_data: false, request_status: []}
    end
  end
end

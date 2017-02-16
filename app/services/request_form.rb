class RequestForm
  attr_reader :params

  def initialize params
    @params = params
  end

  def check_logic_request params, request
    @params = params
    @params[:request_id] = request.id
    check_logic
  end

  def check_logic
    request = Request.find_by id: @params[:request_id]
    return false if request.nil?
    allow_update request
  end

  def allow_update request
    new_status = @params[:request_status_id].to_i
    if new_status == request.request_status_id
      true
    else
      case request.request_status_id
      when Settings.request_status.waiting_approve
        new_status == Settings.request_status.cancelled ||
        new_status == Settings.request_status.approved
      when Settings.request_status.approved
        new_status == Settings.request_status.cancelled ||
        new_status == Settings.request_status.waiting_done ||
        new_status == Settings.request_status.waiting_approve
      when Settings.request_status.waiting_done
        new_status == Settings.request_status.cancelled ||
        new_status == Settings.request_status.done
      when Settings.request_status.cancelled
        new_status == Settings.request_status.waiting_approve ||
        new_status == Settings.request_status.approved
      else
        false
      end
    end
  end
end

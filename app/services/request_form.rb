class RequestForm
  attr_reader :params

  def initialize params
    @params = params
  end

  def check_logic
    request = Request.find_by id: @params[:request_id]
    return false if request.nil?
    allow_update request
  end

  def allow_update request
    new_status = @params[:request_status_id].to_i
    case request.request_status_id
    when Settings.request_status.waiting_approve
      new_status == Settings.request_status.cancelled ||
      new_status == Settings.request_status.approved
    when Settings.request_status.approved
      new_status == Settings.request_status.cancelled ||
      new_status == Settings.request_status.waiting_done
    when Settings.request_status.waiting_done
        new_status == Settings.request_status.done
    else
      false
    end
  end
end

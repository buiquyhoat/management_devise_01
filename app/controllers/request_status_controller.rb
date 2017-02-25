class RequestStatusController < ApplicationController

  def update
    request_form = RequestForm.new(request_params)
    if request_form.check_logic
      request = Request.find_by id: request_params[:request_id]
      request.request_status_id = request_params[:request_status_id]
      request.updated_by = current_user.id
      if request.save
        send_notifycation request
        json_response true, t("request.update_success")
      else
        json_response false, t("request.update_unsuccess")
      end
    else
      json_response false, t("request.update_conflict")
    end
  end

  private

  def send_notifycation request
    case request.request_status_id
    when Settings.request_status.waiting_approve
      users = user_can_approve
      users = users.select {|u| @current_user.default_parent_path.index(u.default_parent_path) == 0}
      request.send_notify_list users
    when Settings.request_status.approved
      request.send_notify_list user_can_waiting_done
    when Settings.request_status.waiting_done
      request.send_notify_list user_can_done_request
    end
  end

  def request_params
    params.permit :request_id, :request_status_id
  end
end

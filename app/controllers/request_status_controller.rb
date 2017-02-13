class RequestStatusController < ApplicationController

  def update
    request_form = RequestForm.new(request_params)
    if request_form.check_logic
      request = Request.find_by id: request_params[:request_id]
      request.request_status_id = request_params[:request_status_id]
      request.updated_by = current_user.id
      if request.save
        json_response true, t("request.update_success")
      else
        json_response false, t("request.update_unsuccess")
      end
    else
      json_response false, t("request.update_conflict")
    end
  end

  private

  def request_params
    params.permit :request_id, :request_status_id
  end
end

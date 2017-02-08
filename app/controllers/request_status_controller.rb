class RequestStatusController < ApplicationController

  def update
    request = Request.find_by id: request_params[:request_id]
    request.request_status_id = request_params[:request_status_id]
    if request.save
      json_response true, t("request.update_success")
    else
      json_response false, t("request.update_unsuccess")
    end
  end

  private

  def request_params
    params.permit :request_id, :request_status_id
  end
end

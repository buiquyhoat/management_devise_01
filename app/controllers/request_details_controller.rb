class RequestDetailsController < ApplicationController

  def destroy
    @request_detail = RequestDetail.find_by(id: params[:id])
    return json_response false, t("request_detail.not_exist") unless @request_detail
    if @request_detail.destroy
      json_response true, t("request_detail.delete_success")
    else
      json_response false, t("request_detail.cant_delete")
    end
  end

  private

  def json_response success, message
    respond_to do |format|
      format.json do
        render json: {
          sucess: success,
          message: message
        }
      end
    end
  end
end

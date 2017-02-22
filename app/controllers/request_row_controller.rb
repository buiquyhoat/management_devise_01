class RequestRowController < ApplicationController

  def index
    @request = Request.find_by id: params[:id]
    respond_to do |format|
      format.js
    end
  end

  private
  def request_params
    params.permit :id
  end
end

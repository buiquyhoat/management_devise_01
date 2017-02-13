class MyDevicesController < ApplicationController
  def index
    @devices = AssignmentDetail.by_user(current_user.id)
      .return_date_sort_asc
      .paginate page: params[:page]
  end
end

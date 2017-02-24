class UserProfilerController < ApplicationController
  before_action :logged_in_user
  before_action :init_user, only: :show

  def index

  end

  def show
    if @user.present?
      @device_usings = AssignmentDetail.by_device_using(@user.id)
      @device_returns = AssignmentDetail.by_user(@user.id)
        .by_device_return
    else
      respond_to do |format|
        format.js {"$('#dms-popup').modal('toggle');"}
      end
    end
  end

  private

  def init_user
    @user = User.find_by id: params[:id]
  end
end

class DeviceHistoryController < ApplicationController
  before_action :init_dropdown
  before_action :logged_in_user

  def index
    @search = AssignmentDetail.search(params[:q])
    @search.sorts = ["assignment_assignee_email","return_date asc", "assignments.created_at desc"]
    @using_histories = @search.result
      .paginate(page: params[:page], per_page: config_page_size)
  end

  private

  def init_dropdown
    @support = Supports::User.new current_user
  end
end

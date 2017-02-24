class AssignmentsController < ApplicationController
  before_action :init_data
  before_action :init_request, only: :new

  def new
    @asignment = Assignment.new
    if @request.present?
      @asignment.request_id = @request.id
      @asignment.assignee_id = @request.for_user_id
      @request.request_details.includes(:device_category).each do |detail|
        if detail.number.present? && detail.number > 0
          detail.number.times do |i|
            @asignment.assignment_details.build device_category_id: detail.device_category.id, device_category_group_id: detail.device_category.device_group.id
          end
        end
      end
    end
    respond_to do |format|
      format.js
    end
  end

  def create
    @assignment = Assignment.new assign_params
    set_created_by @assignment
    unless @assignment.check_duplicate?
      @assignment.save
    end
    respond_js
  end

  private

  def init_data
    @support = Supports::User.new current_user
  end

  def assign_params
    params.require(:assignment).permit :request_id, :assignee_id, :description,
      assignment_details_attributes: [:id, :device_id, :device_category_id,
      :device_category_group_id]
  end

  def init_request
    @request = Request.find_by id: params[:request_id]
  end

  def respond_js
    respond_to do |format|
      format.js
    end
  end
end

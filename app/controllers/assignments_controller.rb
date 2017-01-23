class AssignmentsController < ApplicationController
  before_action :init_data
  before_action :init_assignment, only: [:edit, :update, :show]
  before_action :init_request, only: :new

  def index
    get_assignments
    @assignments.includes(:request)
  end

  def new
    @asignment = Assignment.new request_id: @request.id
    @request.request_details.each do |detail|
      @asignment.assignment_details.build device_category_id: detail.device_category.id,
        device_category_group_id: detail.device_category.device_group.id
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

  def edit
    @assignment.assignment_details.includes(:device)
    respond_js
  end

  def update
    @assignment.update_attributes assign_params_edit
    set_updated_by @assignment
    respond_to do |format|
      format.js
        render "assignments/create"
    end
  end

  def show
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

  def assign_params_edit
    params.require(:assignment).permit :assignee_id, :description
  end

  def get_assignments
    @assignments = Assignment.of_assignee(params[:assignee_id])
      .of_created_by(params[:created_by])
      .default_sort
      .paginate page: params[:page]
  end

  def init_assignment
    @assignment = Assignment.find_by id: params[:id]
    unless @assignment
      flash[:danger] = t "assignment.message.assignee_not_exist"
      redirect_to assignments_path
    end
  end

  def init_request
    @request = Request.find_by id: params[:request_id]
    unless @request
      flash[:danger] = t "request_manager.not_exist"
      redirect_to requests_path
    end
  end

  def respond_js
    respond_to do |format|
      format.js
    end
  end
end

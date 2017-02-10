class RequestsController < ApplicationController
  before_action :init_request, only: [:edit, :update, :show]
  before_action :init_dropdown, except: [:destroy, :update, :create]
  before_action :logged_in_user

  def index
    get_requests
    get_my_requests
  end

  def new
    @request = Request.new
    respond_to do |format|
      format.js
    end
  end

  def create
    update_before_save
    respond_to do |format|
      update_create_request @request
      if @request.save
        flash[:success] = t "action_message.create_success"
      else
        flash[:danger] = t "action_message.create_fail"
      end
      format.js
      render "requests/research"
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    update_before_save
    request_form = RequestForm.new(request_params)
    if request_form.check_logic
      @request.update_attributes request_params
    end
    respond_to do |format|
      format.js
      if @request.errors.empty?
        flash.now[:success] = t "action_message.update_success"
      else
        flash[:danger] = t "action_message.update_fail"
      end
      render "requests/research"
    end
  end

  def show
    @request.readonly = true
    if @request.request_status_id == Settings.request_status.done
      @assignment = Assignment.find_by request_id: @request.id
    end
    unless params[:from_app].present?
      respond_to do |format|
        format.js
      end
    end
  end

  def add_request_detail
    respond_to do |format|
      format.js
    end
  end

  def destroy; end

  private

  def update_before_save
    @request = Request.new request_params unless @request
    @request.created_by = current_user.id unless @request.id
    @request.updated_by = current_user.id
  end

  def request_params
    params.require(:request).permit :title, :description, :request_type_id,
      :request_status_id, :for_user_id, :assignee_id,
      request_details_attributes: [:id, :description, :device_category_id,
        :number]
  end

  def request_status_params
    params.require(:request).permit :request_status_id, :id
  end

  def get_requests
    @requests = Request.request_manage(@current_user.default_parent_path, @current_user)
      .find_by_actor(params[:relative_id])
      .of_request_status(params[:request_status_id])
      .order_by.paginate page: params[:page]
  end

  def get_my_requests
    @my_requests = Request.find_for_user(@current_user.id).order_by
      .find_by_actor(params[:relative_id])
      .of_request_status(params[:request_status_id])
      .order_by.paginate page: params[:page]
  end

  def init_dropdown
    @support = Supports::User.new current_user
  end

  def init_request
    @request = Request.find_by id: params[:id]
    unless @request
      flash[:danger] = t "request_manager.not_exist"
      redirect_to requests_path
    end
  end

  def update_create_request request
    request.request_type_id = Settings.type.request
    if @current_user.highest_permission(Settings.entry.request, Settings.action.approve)
      request.request_status_id = Settings.request_status.approved
    else
      request.request_status_id = Settings.request_status.waiting_approve
    end
  end
end

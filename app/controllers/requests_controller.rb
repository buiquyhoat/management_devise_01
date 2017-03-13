class RequestsController < ApplicationController
  before_action :init_request, only: [:edit, :update, :show]
  before_action :init_support, expect: [:destroy, :show]
  before_action :logged_in_user, :init_extend_data

  def index
    load_request params[:manager_request]
    if params[:isAjax].present? or params[:page].present?
      respond_to do |format|
        format.js
      end
    end
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
        send_notifycation @request
        @manage_tag_selected = @current_user.id == @request.for_user_id ? false : true
        load_request params[:manager_request]
      else
        flash[:danger] = t "action_message.create_fail"
      end
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    update_before_save
    request_form = RequestForm.new request_params
    if request_form.check_logic_request request_params, @request
      @request.update_attributes request_params
      respond_to do |format|
        format.js
        if @request.errors.empty?
          flash.now[:success] = t "action_message.update_success"
          send_notifycation @request
          load_request params[:manager_request]
        else
          flash[:danger] = t "action_message.update_fail"
        end
      end
    else
      flash[:danger] = t "request.update_conflict"
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

  def send_notifycation request
    case request.request_status_id
    when Settings.request_status.waiting_approve
      users = user_can_approve
      users = users.select {|u| @current_user.default_parent_path.index(u.default_parent_path) == 0}
      request.send_notify_list users
    when Settings.request_status.approved
      request.send_notify_list user_can_waiting_done
    when Settings.request_status.waiting_done
      request.send_notify_list user_can_done_request
    end
  end

  def load_request manager_request
    get_requests manager_request
    get_my_requests manager_request
  end

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

  def get_requests manager_request
    page = manager_request == Settings.boolean_params.true ? params[:page] : 1
    @requests = Request.request_manage(@current_user.default_parent_path, @current_user)
      .request_not_self(@current_user).of_actor(params[:relative_id])
      .of_request_status(params[:request_status_id])
      .order_by_time.paginate page: page, per_page: config_page_size
  end

  def get_my_requests manager_request
    page = manager_request == Settings.boolean_params.false ? params[:page] : 1
    @my_requests = Request.of_for_user(@current_user.id, @current_user.default_parent_path, @current_user).order_by_time
      .of_actor(params[:relative_id])
      .of_request_status(params[:request_status_id]).order_by_time
      .paginate page: page, per_page: config_page_size
  end

  def init_support
    @support ||= Supports::User.new current_user
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
    if @current_user.can_approve
      request.request_status_id = Settings.request_status.approved
    else
      request.request_status_id = Settings.request_status.waiting_approve
    end
  end

  def init_extend_data
    @manage_tag_selected = @current_user.can_manage_request
  end
end

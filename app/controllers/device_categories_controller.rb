class DeviceCategoriesController < ApplicationController
  before_action :init_dropdown, except: [:create, :update]
  before_action :init_category, only: [:edit, :update]
  before_action :logged_in_user
  before_action :check_permision

  def index
    @search = DeviceCategory.search(params[:q])
    @search.sorts = ["name"]
    @list_categories_size = @search.result.size
    @list_categories = @search.result.page params[:page]
  end
  
  def new
    @device_category = DeviceCategory.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @device_category = DeviceCategory.new device_category_params
    set_created_by @device_category
    save_success = @device_category.save
    format_js
  end

  def edit
    format_js
  end

  def update
    set_updated_by @device_category
    @device_category.update_attributes device_category_params
    format_js
  end

  private

  def format_js
    respond_to do |format|
      format.js
    end
  end

  def device_category_params
    params.require(:device_category).permit :device_group_id, :name, :template_code
  end

  def init_dropdown
    @support = Supports::User.new current_user
    @manage_tag_selected = @current_user.can_manage_device
  end

  def init_category
    @device_category = DeviceCategory.find_by id: params[:id]
    unless @device_category
      flash[:danger] = t "device_categories.message_device_not_exist"
      redirect_to device_categories_path
    end
  end

  def check_permision
    unless current_user.is_admin
      redirect_to root_url
    end
  end
end

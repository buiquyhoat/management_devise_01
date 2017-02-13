class ReturnDevicesController < ApplicationController
  include ModelHelper

  before_action :init_dropdown
  before_action :get_list_device, only: :show
  def show
    respond_to do |format|
      format.js
    end
  end

  def index
    respond_to do |format|
      format.js
    end
  end

  def update
    if params[:assigment_detail_ids].present?
      @assignment_detail = AssignmentDetail.find(params[:assigment_detail_ids])
      update_assignment_details @assignment_detail
    end

    respond_to do |format|
      format.js
    end
  end

  private

  def init_dropdown
    @support = Supports::User.new current_user
  end

  def get_list_device
    if params[:staff_id].present?
      @list_device = AssignmentDetail.by_device_using params[:staff_id]
    end
  end

  def update_assignment_details asignment_details
    if asignment_details.any?
      asignment_details.each do |asignment_detail|
        asignment_detail.update_attribute :return_date, DateTime.now
      end
      staff_id = asignment_details.first.assignment_assignee_id
      create_notify current_user.id, staff_id,
        t("return_device.message.device_has_returned"), my_devices_path
    end
  end
end

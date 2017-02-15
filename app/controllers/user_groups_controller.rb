class UserGroupsController < ApplicationController
  before_action :init_new_default_group, :init_current_default_group

  def update
    if @new_default_group.present?
      if @current_default_group.id != @new_default_group.id
        @current_default_group.update_attribute :is_default_group, false
        @new_default_group.update_attribute :is_default_group, true
      end
    end
    respond_to do |format|
      format.js
    end
  end

  private

  def init_new_default_group
    @new_default_group = UserGroup.find_by id: params[:group_id]
  end

  def init_current_default_group
    @current_default_group = UserGroup.find_by is_default_group: true,
      user_id: current_user.id
  end
end

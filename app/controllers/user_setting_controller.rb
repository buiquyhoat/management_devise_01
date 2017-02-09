class UserSettingController < ApplicationController
  def index

  end

  def update
    update_user_setting = UserSetting.find_by id: user_setting.id
    setting_params = params["setting_params"]
    if update_user_setting.present?
      if setting_params.nil?
        disable_all_setting update_user_setting
      else
        update_new_settings update_user_setting, setting_params
      end
    end
    save_setting update_user_setting
  end

  private

  def update_new_settings current_setting, new_setting
    current_setting.optional_hash.each do |k, v|
      current_setting.optional_hash[k] = new_setting.index(k).present?
    end
  end

  def save_setting update_setting
    update_setting.set_option
    if update_setting.save
      redirect_to user_setting_index_path
    else
      flash[:danger] = t "action_message.update_fail"
    end
  end

  def disable_all_setting update_setting
    update_setting.optional_hash.each do |k, v|
      update_setting.optional_hash[k] = false
    end
  end
end

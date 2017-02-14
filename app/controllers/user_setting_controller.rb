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

  def update_new_settings current_setting, setting_params
    new_setting = extra_parameter setting_params
    current_setting.optional_hash.each do |k, v|
      if new_setting.has_key? k
        current_setting.optional_hash[k] = new_setting[k]
      else
        if type_boolean(v)
          current_setting.optional_hash[k] = false
        else
          current_setting.optional_hash[k] = ""
        end
      end
    end
  end

  def extra_parameter new_setting
    hash_setting = {}
    new_setting.each do |setting_value|
      value_split = setting_value.split(":")
      if value_split.count > 1
        hash_setting[value_split[0]]= value_split[1]
      else
        hash_setting[setting_value] = true
      end
    end
    hash_setting
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
      if type_boolean v
        update_setting.optional_hash[k] = false
      else
        update_setting.optional_hash[k] = ""
      end
    end
  end
end

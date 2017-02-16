module ApplicationHelper
  def full_title page_title
    base_title = t "dms_app_title"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def group_have_permission entry, action
    groups = []
    Group.all.each do |g|
      if g.highest_permission(entry, action)
        groups << g
      end
    end
  end

  def user_have_permission entry, action
    users = []
    User.all.each do |u|
      if u.highest_permission entry, action
        users << u
      end
    end
    users
  end

  def user_have_permission_default entry, action
    users = []
    User.all.each do |u|
      if u.permission_default_group entry, action
        users << u
      end
    end
    users
  end

  def get_setting_type setting
    setting_type =  Settings.user_setting.setting_type["#{setting}"]
    setting_type = Settings.user_setting.setting_type.default if setting_type.nil?
    setting_type
  end
end

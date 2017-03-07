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

  def user_can_approve
    if $user_can_approve.nil?
      users = []
      User.all.each do |u|
        if u.permission_default_group Settings.entry.request, Settings.action.approve
          users << u
        end
      end
      $user_can_approve = users
    end
    $user_can_approve
  end

  def user_can_done_request
    if $user_can_done.nil?
      users = []
      User.all.each do |u|
        if u.permission_default_group Settings.entry.request, Settings.action.done
          users << u
        end
      end
      $user_can_done = users
    end
    $user_can_done
  end

  def user_can_waiting_done
    if $user_can_waiting_done.nil?
      users = []
      User.all.each do |u|
        if u.permission_default_group Settings.entry.request, Settings.action.waiting_done
          users << u
        end
      end
      $user_can_waiting_done = users
    end
    $user_can_waiting_done
  end

  def user_have_permission_default entry, action, user
    users = []
    if entry == Settings.entry.request
      case action
      when Settings.action.approve
        users = user_can_approve
      when Settings.action.waiting_done
        users = user_can_waiting_done
      when Settings.action.done
        users = user_can_done_request
        users = users.select { |item| item.department_id == user.department_id} if user.present?
      end
    else
      User.all.each do |u|
        if u.permission_default_group entry, action
          users << u
        end
      end
    end
    users
  end

  def render_text_box setting_name, setting_value
    "<input id=\"#{setting_name}\"
      value=\"#{setting_value}\"
      #{get_setting_type(setting_name)}
      class=\"form-control taR user-setting\">"
  end

  def get_setting_type setting
    setting_type =  Settings.user_setting.setting_type["#{setting}"]
    setting_type = Settings.user_setting.setting_type.default if setting_type.nil?
    setting_type
  end

end

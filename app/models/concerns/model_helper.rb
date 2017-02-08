module ModelHelper
  def create_notify sender_id, reciver_id, body, link
    Notification.create body: body, link: link,
      reciver_id: reciver_id, sender_id: sender_id
  end

  def create_hitory object_id, history_data, type
    DmsHistory.create dms_object_id: object_id,
      dms_history_data: history_data,
      dms_object_type: type
  end

  def get_created_name user_id
    user = User.find_by id: user_id

    user_name = user.present? ? user.name : ""
  end

  def create_hitory_for_create
    create_history Settings.action.created
  end

  def create_hitory_for_update
    create_history Settings.action.updated
  end
end

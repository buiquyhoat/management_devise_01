class Notification < ApplicationRecord
  after_create_commit :raise_notification

  scope :default_sort, ->{order created_at: :desc}

  scope :un_read, ->user_id do
    where "checked = 0 AND reciver_id = ?", user_id
  end

  scope :by_current_user, ->user_id do
    where reciver_id: user_id
  end

  private

  def raise_notification
    NotificationBroadcastJob.perform_later(reciver_id, Notification.un_read(reciver_id).count, self)
  end
end

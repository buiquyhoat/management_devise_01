class Notification < ApplicationRecord
  after_create_commit :raise_notification

  scope :default_sort, ->{order created_at: :desc}

  scope :un_read, ->user_id do
    where "checked = false AND reciver_id = ?", user_id
  end

  scope :by_current_user, ->user_id do
    where reciver_id: user_id
  end

  scope :created_from_date, ->(from_date) do
    where "DATE_FORMAT(created_at,'%Y/%m/%d') >= DATE_FORMAT(?,'%Y/%m/%d')",
     from_date if from_date.present?
  end

  scope :created_to_date, ->(to_date) do
    where "DATE_FORMAT(created_at,'%Y/%m/%d') <= DATE_FORMAT(?,'%Y/%m/%d')",
     to_date if to_date.present?
  end

  scope :sender_by, ->user_id do
    where sender_id: user_id if user_id.present?
  end

  private

  def raise_notification
    NotificationBroadcastJob.perform_later(reciver_id, Notification.un_read(reciver_id).count, self)
  end
end

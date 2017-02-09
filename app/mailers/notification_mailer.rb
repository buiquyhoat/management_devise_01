class NotificationMailer < ApplicationMailer

  def notification_mail notification_id
    @notification = Notification.find_by id: notification_id
    if @notification.present?
      receiver = User.find_by id: @notification.reciver_id
      if receiver.present?
        mail to: reciver.email , subject: reciver.body
      end
    end
  end
end

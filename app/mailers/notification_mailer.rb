class NotificationMailer < ApplicationMailer

  def notification_mail notification_id
    @notification = Notification.find_by id: notification_id
    if @notification?
      reciver = User.find_by id: @notification.reciver_id
      if reciver?
         mail to: reciver.email , subject: reciver.body
      end
    end
  end
end

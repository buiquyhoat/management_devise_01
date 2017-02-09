class NotificationMailer < ApplicationMailer

  def notification_mail notification_id
    @notification = Notification.find_by id: notification_id
    if @notification.present?
      current_user_setting = UserSetting.find_by user_id: notification.reciver_id
      if current_user_setting.nil? ||
        current_user_setting.optional_hash[Settings.user_setting.send_mail_notification]
        reciver = User.find_by id: @notification.reciver_id
        if reciver?
           mail to: reciver.email , subject: reciver.body
        end
      end
    end
  end
end

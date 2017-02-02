class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notification_channel_#{params[:user_id]}"
  end
end

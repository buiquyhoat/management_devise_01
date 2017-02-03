class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform reciver_id, counter, notification
    ActionCable.server.broadcast "notification_channel_#{reciver_id}",
      counter: render_counter(counter), notification: render_notification(notification)
  end

  private

  def render_counter counter
    ApplicationController.renderer.render(partial: "notifications/counter",
      locals: {counter: counter})
  end

  def render_notification notification
    ApplicationController.renderer.render(partial: "notifications/notification",
      locals: {notification: notification})
  end
end

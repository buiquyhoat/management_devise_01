class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def create_notify sender_id, reciver_id, body, link
    Notification.create body: body, link: link,
      reciver_id: reciver_id, sender_id: sender_id
  end
end

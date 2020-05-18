class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event

  after_create_commit :broadcast_message

  def broadcast_message
    ActionCable.server.broadcast "comment_channel-#{self.event.user_id}", message: [self, self.user]
  end
end

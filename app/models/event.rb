class Event < ApplicationRecord
  belongs_to :user
  has_many :comments
  after_create_commit :broadcast_message

  def broadcast_message
    ActionCable.server.broadcast 'activity_channel', message: self
  end
end

# ActionCable.server.broadcast(
#       'activity_channel',
#       ApplicationController.renderer.render(
#         partial: 'events/event',
#         locals: { event: self }
#       )
#     )

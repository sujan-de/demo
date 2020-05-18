class ActivityChannel < ApplicationCable::Channel
  def subscribed
    stream_from "activity_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # def speak(data)
  #   # message = Message.create! content: data['message']
  #   binding.pry
  #   ActionCable.server.broadcast(
  #     'activity_channel',
  #     message: render_message(data)
  #   )
  # end

  # private

  # def render_message(message)
  #   ApplicationController.renderer.render(
  #     partial: 'events/event',
  #     locals: { event:  data}
  #   )
  # end
end

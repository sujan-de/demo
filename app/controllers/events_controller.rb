class EventsController < ApplicationController
  def index
    @events = Event.all.reverse
  end

  def show
    @event = Event.find_by(id: params[:id])
    # @comments = @event.comments
    @comment = Comment.new(user_id: current_user.id, event_id: @event.id)
  end

  def create
    @event = Event.create(events_params)
    redirect_to @event
  end

  private

  def events_params
    params.require(:event).permit(:message, :user_id)
  end
end

class UsersController < ApplicationController
  before_action :correct_user, only: [:show]
  def show
    @user = User.find_by(id: params[:id])
    @event = Event.new(user_id: current_user.id)
  end

  def events_preview
    @user = current_user
    @events = @user.events
  end

  private

  def correct_user
    user = User.find_by(id: params[:id])
    redirect_to(user_path(current_user)) if current_user != user
  end
end

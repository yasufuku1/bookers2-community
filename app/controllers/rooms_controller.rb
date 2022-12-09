class RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    @room = Room.create
    Entry.create(user_id: current_user.id, room_id: @room.id)
    Entry.create(user_id: params[:entry][:user_id], room_id: @room.id)
    redirect_to room_path(@room.id)
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      @chat = Chat.new
      @messages = @room.chats
      @entries = @room.entries
      @another_entry = @entries.where.not(user_id: current_user.id).first
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  # def join_room_params
  #   params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id)
  # end


end

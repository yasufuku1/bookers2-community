class RoomsController < ApplicationController
  def show
    @user = User.find(params[:id])
    rooms = current_user.entries.pluck(:room_id)
    user_rooms = Entry.find_by(user_id: @user.id, room_id: rooms)

    unless user_rooms.nil?
      @room = user_rooms.room
    else
      @room = Room.new
      @room.save
      Entr.create(user_id: current_user.id, room_id: @room.id)
      Entr.create(user_id: @user.id, room_id: @room.id)
    end
    @chats = @room.chats
    @chat = Chat.new(room_id: @room.id)
  end

end

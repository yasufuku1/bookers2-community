class ChatsController < ApplicationController
 before_action :authenticate_user!, only: [:create]

  def create
    @chat = Chat.new(message_params)
    @chat.user_id = current_user.id
    if @chat.save
      redirect_to room_path(@chat.room_id)
    else
      render :validater
    end
  end

  private
  def message_params
    params.require(:chat).permit(:room_id,:message)
  end
end

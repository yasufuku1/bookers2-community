class ChatsController < ApplicationController
 before_action :authenticate_user!, only: [:create]

  def create
    @chat = Chat.new(message_params)
    @chat.user_id = current_user.id
    render :validater unless @chat.save
  end

  private
  def message_params
    params.require(:chat).permit(:room_id,:message)
  end
end

class MessagesController < ApplicationController
    before_action :authenticate_user!, only: [:create]

    def create
        if Entry.where(:user_id => current_user.id, :room_id => params[:message][:room_id]).present?
          @message = Message.create(params.require(:message).permit(:user_id, :content, :room_id).merge(:user_id => current_user.id))
          redirect_to "/rooms/#{@message.room_id}"
        else
          redirect_back(fallback_location: root_path)
        end
    end

    def destroy
      @room = Room.find(params[:id])
      message = current_user.messages.find(params[:id])
      message.destroy!
      redirect_to room_path(@room), notice: '削除しました'
    end
end
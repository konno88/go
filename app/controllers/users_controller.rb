class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        #自分が参加しているメッセージルーム情報を取得する
        @currentUserEntry = Entry.where(user_id: current_user.id)
        #洗濯したユーザのメッセージルーム情報を取得する
        @userEntry = Entry.where(user_id: @user.id)
    
        #current_userと選択したユーザ間に共通のメッセージルームが存在すればフラグを立てる
        unless @user.id == current_user.id
          @currentUserEntry.each do |cu|
            @userEntry.each do |u|
              if cu.room_id == u.room_id then
                @isRoom = true
                @roomId = cu.room_id
              end
            end
          end
          #無ければ作る
          unless @isRoom
              @room = Room.new
              @entry = Entry.new
          end
        end
    end
end
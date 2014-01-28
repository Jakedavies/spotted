class MessagesController < ApplicationController
  def create
    @subject = 'fuck subjects'
    @to = User.find(params[:messages][:user_id])
    @body = params[:messages][:body]
    current_user.send_message(@to,@body,@subject )
    redirect_to profile_index_path
  end
end
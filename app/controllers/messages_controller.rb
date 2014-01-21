class MessagesController < ApplicationController
  def create
    @subject = 'fuck subjects'
    @to = User.find(params[:messages][:to])
    @body = params[:messages][:body]
    current_user.send_message(@to,@subject,@body )
    redirect_to profile_index_path
  end
end
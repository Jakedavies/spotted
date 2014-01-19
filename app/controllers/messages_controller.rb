class MessagesController < ApplicationController
  def create
    @subject = params[:messages][:subject]
    @body = params[:messages][:body]
    current_user.send_message(current_user,@subject,@body )
    redirect_to profile_index_path
  end
end
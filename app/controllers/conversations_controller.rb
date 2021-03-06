class ConversationsController < ApplicationController
  helper_method :mailbox, :conversation
  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end
  def show
    id = params[:id]
    @convo = Conversation.find(id)
  end
end

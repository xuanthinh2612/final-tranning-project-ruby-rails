class MessagesController < ApplicationController
  before_action :require_user
  skip_before_action :verify_authenticity_token

  def create
    # add  message for current user
    message = current_user.messages.build(message_params)
    if message.save
      # de gui du lieu qua socket
      ActionCable.server.broadcast 'chatroom_channel',
                                   mod_message: message_render([message]), message: message
    else

      flash[:danger] = 'message can not be empty'
      redirect_to chatroom_index_path
    end
  end

  def destroy
    Message.find(params[:id]).destroy
    flash[:notice] = 'Message was successfully deleted'
    redirect_to chatroom_index_path


  end

  def message_params
    params.require(:message).permit(:body, :attachment)
  end

  private

  def message_render(message)
    # render(partial: 'message', message: message)
    render_to_string(partial: 'message', locals: { messages: message })
  end
end

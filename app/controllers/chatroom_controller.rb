class ChatroomController < ApplicationController

  def index
    @message = Message.new
    @messages = Message.all.custom_display
  end

end

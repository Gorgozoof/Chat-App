class MessagesController < ApplicationController
  before_action :set_channel
  before_action :require_login, only: [:create]


  def index
    @messages = @channel.messages.includes(:user).order(created_at: :asc)
    @message = @channel.messages.build
    @users = User.all
  end

  def create
    @message = @channel.messages.build(message_params)
    @message.user = current_user  # 👈 Associate message with the logged-in user
  
    if @message.save
      redirect_to channel_messages_path(@channel), notice: "Message sent."
    else
      @messages = @channel.messages.includes(:user).order(created_at: :asc)
      render :index, status: :unprocessable_entity
    end
  end
  

  private

  def set_channel
    @channel = Channel.find(params[:channel_id])
  end

  def require_login
    unless current_user
      redirect_to login_path, alert: "You need to log in to send messages."
    end
  end
  

  def message_params
    params.require(:message).permit(:content)
  end
end

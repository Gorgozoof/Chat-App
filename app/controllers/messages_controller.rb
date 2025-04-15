class MessagesController < ApplicationController
  before_action :set_channel

  def index
    @messages = @channel.messages.includes(:user).order(created_at: :asc)
    @message = @channel.messages.build
    @users = User.all
  end

  def create
    @message = @channel.messages.build(message_params)
    if @message.save
      redirect_to channel_messages_path(@channel), notice: "Message sent."
    else
      @messages = @channel.messages.includes(:user).order(created_at: :asc)
      @users = User.all
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_channel
    @channel = Channel.find(params[:channel_id])
  end

  def message_params
    params.require(:message).permit(:content, :user_id)
  end
end

class ChannelsController < ApplicationController
    def index
      @channels = Channel.all
    end
  
    def show
      @channel = Channel.find(params[:id])
      @messages = @channel.messages.includes(:user).order(created_at: :asc)
      @users = User.all  # For the message form if needed
    end

    def new
      @channel = Channel.new
    end
  
    def create
      @channel = Channel.new(channel_params)
      if @channel.save
        redirect_to channel_messages_path(@channel), notice: "Channel created!"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def channel_params
      params.require(:channel).permit(:name)
    end

  end
  
class ChannelsController < ApplicationController
    def index
      @channels = Channel.all
    end
  
    def show
      @channel = Channel.find(params[:id])
      # Optionally, load messages if you want a dedicated channel page:
      @messages = @channel.messages.includes(:user).order(created_at: :asc)
      @users = User.all  # For the message form if needed
    end
  end
  
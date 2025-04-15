class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Redirect to the channel messages page; here we assume channel 1 by default.
      redirect_to channel_messages_path(1), notice: "User created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email)
    end
end

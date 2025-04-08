class UsersController < ApplicationController
    def create
      # Log the incoming parameters
      Rails.logger.debug "Received params: #{params.inspect}"
  
      @user = User.new(user_params)
  
      if @user.save
        render json: @user, status: :created
      else
        # Log the errors for debugging
        Rails.logger.error "User creation failed: #{@user.errors.full_messages}"
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end
    
    def index
        @users = User.all
        render json: @users
      end
  
    private
  
    def user_params
      # Ensure the user key is present and only allow permitted fields
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
  
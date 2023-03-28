class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    skip_before_action :authorized_user, only: [:create]

    def create        
        if params[:password] == params[:password_confirmation]
            user = User.create!(user_params)
            session[:user_id] = user.id
            render json: user, status: :created
        else
          render json: {errors: ["Password do not match"]}, status: :unprocessable_entity
        end
    end


    def show        
        render json: current_user, status: :ok
    end


    private

    def user_params
      params.permit(:username, :password, :password_confirmation, :image_url, :bio)
    end


    def record_not_found user
        render json: {error: "#{user.model} - please log in"}, status: :unauthorized 
    end

end

class Api::V1::UsersController < ApplicationController
    
    def create
        user = User.create(user_params)
        
        if user.valid?
            render json: user, only: [:first_name, :last_name, :username], status: :created
        else
            render json: {error: 'failed to create user'}, status: :not_acceptable
        end

    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :password)
    end

end

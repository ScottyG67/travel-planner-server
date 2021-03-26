class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def profile
        render json: @user, only: [:first_name, :last_name, :username], status: :accepted
    end
    
    def create
        @user = User.create(user_params)
        
        if @user.valid?
            @token = encode_token(user_id: @user.id)
            # render json: user, only: [:first_name, :last_name, :username], status: :created
            render json: { user: @user.to_json(only: [:first_name, :last_name, :username]), jwt: @token}, status: :created
        else
            render json: {error: 'failed to create user'}, status: :not_acceptable
        end

    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :password)
    end

end

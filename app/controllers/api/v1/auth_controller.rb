class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        @user = User.find_by(username: user_login_params[:username])
        if @user && @user.authenticate(user_login_params[:password])
            #.authenticate from BCrypt
            token = encode_token({ user_id: @user.id })
            render json: { user: @user.to_json(only: [:first_name, :last_name, :username]), jwt: token }, status: :accepted
        else
            render json: {message: "Invalid username or password"}, status: :unauthorized
        end   
    end

    private

    def user_login_params
        params.require(:user).permit(:username, :password)
    end

end
class ApplicationController < ActionController::API

    before_action :authorized
    
    def encode_token(payload)
        JWT.encode(payload, ENV['AUTH_SECRET_KEY'])
    end

    def auth_header
        #looking for 'Authorization': 'Bearer <token>' in headers: {...}
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            ## ['Bearer', '<token>']

            begin
                JWT.decode(token, ENV['AUTH_SECRET_KEY'], true, algorithm: 'HS256')[0]
                ##JWT.decode => [payload]
            rescue JWT::DecodeError
                nil
            end

        end

    end

    def current_user
        if decoded_token
            user_id = decoded_token[0]['user']
            @user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        !!current_user
    end

end

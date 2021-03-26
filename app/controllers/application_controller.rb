class ApplicationController < ActionController::API
    def encode_token(payload)
        JWT.encode(payload, AUTH_SECRET_KEY)
    end
end

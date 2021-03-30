class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def profile
        render json: @user, only: [:id, :first_name, :last_name, :username], status: :accepted
    end
    
    def create
        @user = User.create(user_params)
        
        if @user.valid?
            @token = encode_token(user_id: @user.id)
            # render json: user, only: [:first_name, :last_name, :username], status: :created
            render json: { user: @user.to_json(only: [:first_name, :last_name, :username, :id]), jwt: @token}, status: :created
        else
            render json: {error: 'failed to create user'}, status: :not_acceptable
        end

    end

    # def save_flight
        
    #     save_flight = Flight.new
    #     save_flight.source = params['flight']["source"]
    #     save_flight.instantTicketingRequired = params['flight']["instantTicketingRequired"]
    #     save_flight.nonHomogeneous = params['flight']["nonHomogeneous"]
    #     save_flight.oneWay = params['flight']["oneWay"]
    #     save_flight.lastTicketingDate = params['flight']["lastTicketingDate"]
    #     save_flight.itineraries = params['flight']["itineraries"]
    #     save_flight.price = params['flight']["price"]
    #     save_flight.pricingOptions = params['flight']["pricingOptions"]
    #     save_flight.validatingAirlineCodes = params['flight']["validatingAirlineCodes"]
    #     save_flight.travelerPricings = params['flight']["travelerPricings"]

    #     trip = Trip.find_by(id: params['trip'])
    #     save_flight.trip = trip

    #     if save_flight.save
    #         render json: save_flight
    #     else
    #         render json: {error: 'failed to save'}
    #     end
    
    # end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :password)
    end

end

class Api::V1::TripsController < ApplicationController

    def index
        
        trips = User.find_by(id: params["user_id"]).trips
        render json: trips

    end

    def show
        byebug

    end

    def create
        new_trip = Trip.new
        new_trip.name = params["name"]
        new_trip.description = params["description"]
        new_trip.user_id = params["user_id"]
        new_trip.image = params["image"]

        if new_trip.save
            render json: new_trip
        else
            render json: {error: 'failed to save'}
        end

    end

    def edit
        byebug

    end

    def delete
        byebug
    end


end
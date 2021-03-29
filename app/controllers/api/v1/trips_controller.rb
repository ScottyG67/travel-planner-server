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

    def update
        
        trip = Trip.find_by(id: params['trip']['id'])
        trip.name = params['trip']['name']
        trip.description = params['trip']['description']
        trip.image = params['trip']['image']
        
        if trip.save
            render json: trip
        else
            render json: {error: 'failed to save'}
        end

    end

    def destroy

        trip = Trip.find_by(id: params['id'])
        trip.destroy
        render json: trip

    end


end
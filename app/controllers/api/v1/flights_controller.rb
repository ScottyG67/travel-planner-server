class Api::V1::FlightsController < ApplicationController

    def index
    end

    def show
    end

    def destroy
        byebug

    end


    def create
        save_flight = Flight.new(flight_params)
        # save_flight.source = params['flight']["source"]
        # save_flight.instantTicketingRequired = params['flight']["instantTicketingRequired"]
        # save_flight.nonHomogeneous = params['flight']["nonHomogeneous"]
        # save_flight.oneWay = params['flight']["oneWay"]
        # save_flight.lastTicketingDate = params['flight']["lastTicketingDate"]
        # save_flight.itineraries = params['flight']["itineraries"]
        # save_flight.price = params['flight']["price"]
        # save_flight.pricingOptions = params['flight']["pricingOptions"]
        # save_flight.validatingAirlineCodes = params['flight']["validatingAirlineCodes"]
        # save_flight.travelerPricings = params['flight']["travelerPricings"]

        trip = Trip.find_by(id: params['trip'])
        save_flight.trip = trip

        if save_flight.save
            render json: save_flight
        else
            render json: {error: 'failed to save'}
        end
    
    end

    def trip_flights
        trip = Trip.find_by(id: params["id"])
        render json: trip.flights

    end

    private 

    def flight_params
        params.require('flight').permit('source','instantTicketingRequired','nonHomogeneous','oneWay','lastTicketingDate','itineraries','price','pricingOptions','validatingAirlineCodes','travelerPricings')
    end

end

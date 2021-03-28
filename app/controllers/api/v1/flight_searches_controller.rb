class Api::V1::FlightSearchesController < ApplicationController

    def index
    ## Flight API

    body = {
        currencyCode: "USD", 
        originLocationCode: 'AUS', 
        destinationLocationCode: 'SFO', 
        departureDate: '2021-05-01', 
        returnDate:'2021-05-10', 
        adults: 1,
        max: 10
    }


    amadeus = Amadeus::Client.new(client_id: 'MHCEX9RKb0ATGhbHiGchYp67ROsIKbgl', client_secret: 'pAAiFfnhgWByhoAm')
    response = amadeus.shopping.flight_offers_search.get(body)

    render json: response.result

    end

    def search
        

        body = {
            currencyCode: "USD", 
            originLocationCode: 'AUS', 
            destinationLocationCode: 'SFO', 
            departureDate: '2021-05-01', 
            returnDate:'2021-05-10', 
            adults: 1,
            max: 10
        }
    
    
        amadeus = Amadeus::Client.new(client_id: 'MHCEX9RKb0ATGhbHiGchYp67ROsIKbgl', client_secret: 'pAAiFfnhgWByhoAm')
        response = amadeus.shopping.flight_offers_search.get(body)
    
        render json: response.result

    end



    private

    # def convert_response(response)
        
    #     converted_response_map = {quotes: response["Quotes"].map do |quote| 
    #         {
    #             quote_id: quote["QuoteId"],
    #             price: quote["MinPrice"],
    #             direct: quote["Direct"],
    #             outbound_leg: {
    #                 carrier: [response["Carriers"].find{|carrier| carrier["CarrierId"]=quote["OutboundLeg"]["CarrierIds"][0]}], #add search to match carrier id 
    #                 departure_location:response["Places"].find{|place| place["PlaceId"]=quote["OutboundLeg"]["OriginId"]},
    #                 arrival_location:response["Places"].find{|place| place["PlaceId"]=quote["OutboundLeg"]["DestinationId"]},
    #                 departure_date:quote["OutboundLeg"]["DepartureDate"]
    #             }
    #         }
    #     end  
    #     }     

    #     puts converted_response_map
        
    #     render json: converted_response_map

        
    # end
end

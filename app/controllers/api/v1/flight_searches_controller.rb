class Api::V1::FlightSearchesController < ApplicationController

    def index
    ## Flight API
    require 'uri'
    require 'net/http'
    require 'openssl'

    # base_url= "test.api.amadeus.com/v2"
    # search_url="/shopping/flight-offers?originLocationCode=AUS&destinationLocationCode=SFO&departureDate=2021-05-01&returnDate=2021-05-10&adults=1&travelClass=FIRST&nonStop=false&max=250"
    # access_token ="9YZlkBYTIfCHsX33Tgy8GZNg7P8r"


    


    url = URI("https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/browsequotes/v1.0/US/USD/en-US/AUS-sky/SFO-sky/2021-05-01?")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-key"] = '84407036c2mshe4c9f3c07528242p1bdc87jsna2c05a96dbc1'
    request["x-rapidapi-host"] = 'skyscanner-skyscanner-flight-search-v1.p.rapidapi.com'

    response = http.request(request)
    puts JSON.parse(response.read_body)
    convert_response(JSON.parse(response.read_body))
        
    # render json: response.read_body
    
    end



    private

    def convert_response(response)
        
        converted_response_map = {quotes: response["Quotes"].map do |quote| 
            {
                quote_id: quote["QuoteId"],
                price: quote["MinPrice"],
                direct: quote["Direct"],
                outbound_leg: {
                    carrier: [response["Carriers"].find{|carrier| carrier["CarrierId"]=quote["OutboundLeg"]["CarrierIds"][0]}], #add search to match carrier id 
                    departure_location:response["Places"].find{|place| place["PlaceId"]=quote["OutboundLeg"]["OriginId"]},
                    arrival_location:response["Places"].find{|place| place["PlaceId"]=quote["OutboundLeg"]["DestinationId"]},
                    departure_date:quote["OutboundLeg"]["DepartureDate"]
                }
            }
        end  
        }     

        puts converted_response_map
        
        render json: converted_response_map

        
    end
end

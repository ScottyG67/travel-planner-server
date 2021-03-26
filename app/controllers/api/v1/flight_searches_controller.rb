class Api::V1::FlightSearchesController < ApplicationController

    def index
    ## Flight API
    require 'uri'
    require 'net/http'
    require 'openssl'

    url = URI("https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/browsequotes/v1.0/US/USD/en-US/SFO-sky/JFK-sky/2021-09-01?inboundpartialdate=2021-12-01")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-key"] = '84407036c2mshe4c9f3c07528242p1bdc87jsna2c05a96dbc1'
    request["x-rapidapi-host"] = 'skyscanner-skyscanner-flight-search-v1.p.rapidapi.com'

    response = http.request(request)
    
    render json: response.read_body
    
    end



    private

    def convert_response(response)
        
    end
end

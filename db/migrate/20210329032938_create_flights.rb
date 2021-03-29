class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.string :type
      t.string :source
      t.boolean :instantTicketingRequired
      t.boolean :nonHomogeneous
      t.boolean :oneWay
      t.string :lastTicketingDate
      t.integer :numberOfBookableSeats
      t.json :itineraries
      t.json :price
      t.json :pricingOptions
      t.json :validatingAirlineCodes
      t.json :travelerPricings

      t.timestamps
    end
  end
end

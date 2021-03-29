class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.string :name
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end

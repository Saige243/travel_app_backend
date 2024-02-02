class CreateItineraryItems < ActiveRecord::Migration[7.1]
  def change
    create_table :itinerary_items do |t|
      t.string :title
      t.text :description
      t.date :date
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end

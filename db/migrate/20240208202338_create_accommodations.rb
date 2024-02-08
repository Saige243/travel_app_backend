class CreateAccommodations < ActiveRecord::Migration[7.1]
  def change
    create_table :accommodations do |t|
      t.string :name
      t.text :address
      t.date :check_in_date
      t.date :check_out_date
      t.string :contact_number
      t.integer :trip_id
      t.text :notes

      t.timestamps
    end
  end
end

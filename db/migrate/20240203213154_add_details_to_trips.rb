class AddDetailsToTrips < ActiveRecord::Migration[7.1]
  def change
    add_column :trips, :location, :string
    add_column :trips, :start_date, :date
    add_column :trips, :end_date, :date
  end
end

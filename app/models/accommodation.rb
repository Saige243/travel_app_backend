class Accommodation < ApplicationRecord
  belongs_to :trip
  validates :name, :address, :check_in_date, :check_out_date, :contact_number, :notes, presence: true
end

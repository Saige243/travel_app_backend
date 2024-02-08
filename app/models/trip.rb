class Trip < ApplicationRecord
  belongs_to :user
  has_many :packing_list_items, dependent: :destroy
  has_many :accommodations
end

class Trip < ApplicationRecord
  belongs_to :user
  has_many :packing_list_items, dependent: :destroy

end

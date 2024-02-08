class AddPackedToPackingListItems < ActiveRecord::Migration[7.1]
  def change
    add_column :packing_list_items, :packed, :boolean
  end
end

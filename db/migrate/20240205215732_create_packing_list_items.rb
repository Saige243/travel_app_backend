class CreatePackingListItems < ActiveRecord::Migration[7.1]
  def change
    create_table :packing_list_items do |t|
      t.string :category
      t.text :description
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end

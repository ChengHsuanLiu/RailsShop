class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
      t.integer :variant_id
      t.integer :order_id
      t.decimal :price
      t.integer :quantity
      t.string :product_name
      t.string :variant_name
      t.string :unit_name

      t.timestamps
    end
    add_index :line_items, :variant_id
    add_index :line_items, :order_id
  end
end

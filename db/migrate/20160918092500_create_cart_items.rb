class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|
      t.integer :user_id
      t.integer :quantity
      t.integer :variant_id
      t.decimal :price
      t.string :unit_name
      t.integer :shop_id

      t.timestamps
    end
    add_index :cart_items, :user_id
    add_index :cart_items, :variant_id
  end
end

class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|
      t.integer :user_id
      t.string :quantity
      t.integer :varient_id
      t.decimal :price
      t.string :unit_name

      t.timestamps
    end
    add_index :cart_items, :user_id
    add_index :cart_items, :varient_id
  end
end

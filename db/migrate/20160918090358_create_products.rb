class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :category_id
      t.boolean :public
      t.integer :shop_id
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :products, :category_id
    add_index :products, :shop_id
  end
end

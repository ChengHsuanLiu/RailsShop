class CreateVarients < ActiveRecord::Migration[5.0]
  def change
    create_table :varients do |t|
      t.string :name
      t.integer :stock
      t.string :unit_name
      t.decimal :price
      t.integer :product_id
      t.datetime :deleted_at
      t.boolean :public

      t.timestamps
    end
    add_index :varients, :product_id
  end
end

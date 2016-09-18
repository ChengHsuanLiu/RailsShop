class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :shop_id
      t.decimal :total
      t.decimal :fee
      t.decimal :payment_total
      t.string :state
      t.string :payment_type
      t.datetime :paid_at
      t.datetime :deadline
      t.string :bill_name
      t.string :bill_address
      t.string :bill_phone
      t.string :shipping_name
      t.string :shipping_address
      t.string :shipping_phone
      t.string :company_name
      t.string :company_registration_number
      t.string :order_no

      t.timestamps
    end
    add_index :orders, :user_id
    add_index :orders, :shop_id
  end
end

class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.decimal :total
      t.decimal :payment_total
      t.decimal :fee
      t.string :payment_type
      t.integer :user_id
      t.string :state
      t.datetime :paid_at
      t.datetime :deadline
      t.string :bill_name
      t.string :bill_address
      t.string :bill_phone
      t.string :bill_no

      t.timestamps
    end
    add_index :bills, :user_id
  end
end

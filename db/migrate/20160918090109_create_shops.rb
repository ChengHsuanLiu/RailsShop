class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.string :fb_link
      t.string :bank_name
      t.string :bank_account
      t.string :bank_branch_name

      t.timestamps
    end
  end
end

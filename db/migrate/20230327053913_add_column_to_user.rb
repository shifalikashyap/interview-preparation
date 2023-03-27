class AddColumnToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :razorpay_customer_id, :string
  end
end

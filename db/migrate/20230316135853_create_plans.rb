class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.string :name
      t.float :price
      t.string :plan_type
      t.timestamps
    end
  end
end

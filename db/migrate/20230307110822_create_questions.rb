class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :keyword
      t.boolean :is_premium
      t.timestamps
    end
  end
end

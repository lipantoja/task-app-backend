class CreateTodos < ActiveRecord::Migration[7.1]
  def change
    create_table :todos do |t|
      t.string :user_id
      t.string :category_id
      t.string :title
      t.string :description
      t.string :deadline
      t.string :completed

      t.timestamps
    end
  end
end

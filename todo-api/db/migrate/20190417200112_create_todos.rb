class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string  :title,  null: false
      t.text    :description
      t.boolean :urgent, null: false, default: false
      t.date    :deadline
      t.string  :owner
      t.timestamps
    end
  end
end

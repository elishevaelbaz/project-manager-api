class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.date :due_date
      t.integer :category_id
      t.integer :created_by

      t.timestamps
    end
  end
end

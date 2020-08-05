class CreateMentions < ActiveRecord::Migration[6.0]
  def change
    create_table :mentions do |t|
      t.integer :user_id
      t.integer :task_id

      t.timestamps
    end
  end
end

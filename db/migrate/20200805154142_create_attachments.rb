class CreateAttachments < ActiveRecord::Migration[6.0]
  def change
    create_table :attachments do |t|
      t.integer :task_id
      t.string :image
      t.string :video

      t.timestamps
    end
  end
end

class CreateUserBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :memberships do |t|
      t.integer :user_id
      t.integer :board_id

      t.timestamps
    end
  end
end

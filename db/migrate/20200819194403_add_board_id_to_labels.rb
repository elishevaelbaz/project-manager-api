class AddBoardIdToLabels < ActiveRecord::Migration[6.0]
  def change
    add_column :labels, :board_id, :integer
  end
end

class RemoveColumnFromFight < ActiveRecord::Migration[5.2]
  def change
    remove_column :fights, :winner, :integer
  end
end

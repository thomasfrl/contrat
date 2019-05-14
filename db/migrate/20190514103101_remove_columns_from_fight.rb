class RemoveColumnsFromFight < ActiveRecord::Migration[5.2]
  def change
    remove_column :fights, :fighter1_weapon_id, :integer
    remove_column :fights, :fighter2_weapon_id, :integer
  end
end

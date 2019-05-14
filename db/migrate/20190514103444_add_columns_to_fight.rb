class AddColumnsToFight < ActiveRecord::Migration[5.2]
  def change
    add_column :fights, :weapons_fighter1_ids, :integer, array: true, default: []
    add_column :fights, :weapons_fighter2_ids, :integer, array: true, default: []
  end
end

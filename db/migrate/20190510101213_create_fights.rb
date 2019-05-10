class CreateFights < ActiveRecord::Migration[5.2]
  def change
    create_table :fights do |t|
      t.references :fighter_1, index: true
      t.references :fighter_2, index: true
      t.references :fighter1_weapon, index: true
      t.references :fighter2_weapon, index: true
      t.integer :winner, :default => nil
      t.timestamps
    end
  end
end

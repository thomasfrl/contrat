class CreateFighters < ActiveRecord::Migration[5.2]
  def change
    create_table :fighters do |t|
      t.string :name
      t.integer :life
      t.integer :attack
      t.integer :xp

      t.timestamps
    end
  end
end

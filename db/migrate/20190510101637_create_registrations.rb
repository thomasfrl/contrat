class CreateRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :registrations do |t|
      t.references :weapon, foreign_key: true
      t.references :fight, foreign_key: true
      t.references :fighter, foreign_key: true

      t.timestamps
    end
  end
end

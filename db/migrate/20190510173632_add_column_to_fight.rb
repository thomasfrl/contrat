class AddColumnToFight < ActiveRecord::Migration[5.2]
  def change
    add_column :fights, :win, :integer
  end
end

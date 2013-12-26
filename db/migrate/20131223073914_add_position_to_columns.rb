class AddPositionToColumns < ActiveRecord::Migration
  def change
  		add_column :columns, :position, :integer, default: 0
  		add_index :columns, :position
  end
end

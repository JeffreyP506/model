class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :columns, :type, :dtype
  end
end

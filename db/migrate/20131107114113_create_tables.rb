class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :name
      t.string :cname
      t.string :file
      t.string :ptk

      t.timestamps
    end
  end
end

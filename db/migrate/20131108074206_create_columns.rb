class CreateColumns < ActiveRecord::Migration
  def change
    create_table :columns do |t|
      t.string :name
      t.string :cname
      t.string :type
      t.boolean :null_ind
      t.string :pk
      t.text :note
      t.references :table, index: true

      t.timestamps
    end

    add_index :columns, :name
  end
end

class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :table, index: true
      t.belongs_to :working_change, index: true

      t.timestamps
    end
  end
end

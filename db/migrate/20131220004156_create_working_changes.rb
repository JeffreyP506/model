class CreateWorkingChanges < ActiveRecord::Migration
  def change
    create_table :working_changes do |t|

      t.timestamps
    end
  end
end

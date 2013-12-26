class WorkingChange < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_table(table_id)
    current_table = line_items.find_by(table_id: table_id)
    current_table = line_items.build(table_id: table_id) unless current_table
  end

  def csv
    csv = []
    line_items.each do |line_item|
      csv << line_item.table.my_to_csv
    end 
    csv.join("\n")
  end
end

class Column < ActiveRecord::Base
  belongs_to :table, inverse_of: :columns
  validates_presence_of :table

  def self.search(search)
    if search
      where('name LIKE ? or cname LIKE ?', "%#{search}%", "%#{search}%")
    else
      self
    end
  end
end

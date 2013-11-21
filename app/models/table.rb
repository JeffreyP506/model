class Table < ActiveRecord::Base
  has_many :columns, dependent: :destroy
  validates :name, presence: true
  validates :cname, presence: true
  validates :file, presence: true
  validates :ptk, presence: true

  def self.search(search)
    if search
      @q = "%" + "#{search}" + "%"
      where('tables.name LIKE ? or tables.cname LIKE ? or columns.name LIKE ? or columns.cname LIKE ?', @q, @q, @q, @q)
    else
      self
    end
  end
end

class Table < ActiveRecord::Base
  has_many :columns, dependent: :destroy
  validates :name, presence: true, length: { minimum: 5 }
  validates :cname, presence: true, length: { minimum: 5 }
  validates :file, presence: true, length: { minimum: 5 }
  validates :ptk, presence: true, length: { minimum: 5 }
end

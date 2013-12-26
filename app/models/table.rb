class Table < ActiveRecord::Base
  has_many :columns, dependent: :destroy, inverse_of: :table, order: 'position'
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  accepts_nested_attributes_for :columns, allow_destroy: true

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

  def self.my_to_csv
    "\uFEFF#{my_csv}"
  end
  def self.my_csv(options = {})
    CSV.generate(options) do |csv|
      all.each do |table|
        csv << ['物理模型名称', table.name]
        csv << ['逻辑模型名称', table.cname]
        csv << ['归属分类', '经分环境\\']
        csv << ['分表命名规则', '不分表/按月分表/按日分表']
        csv << ['分区字段', table.ptk]
        csv << ['是否共享', 'FALSE']
        csv << ['字段中文名','字段名称','类型','长度','精度','主键','可空','默认值','注释']
        table.columns.each do |c|
          c_a = []
          c_a.append(c.cname)
          c_a.append(c.name)
          c_a.append(c.dtype)
          c_a.append('') #长度
          c_a.append('') #精度
          c_a.append(c.pk == '1' ? 'TRUE' : '')
          c_a.append(c.pk == '0' ? 'TRUE' : '')
          c_a.append('') #默认值
          c_a.append(c.note) #注释
          csv << c_a
        end
      end
    end
  end

  private
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
end

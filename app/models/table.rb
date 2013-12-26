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

  def sql()
    result = []
    result << "CREATE TABLE #{name} ("
    pk = []
    columns = []

    comments = ["COMMENT ON TABLE #{name} IS \'#{cname}\';"]

    self.columns.each do |c|
      column = ""
      column += c.name.to_s + ' ' + c.dtype.to_s

      pk << c.name if c.pk
      columns << "  #{c.name} #{c.dtype}#{' NOT NULL' if c.pk}"
      comments << "COMMENT ON COLUMN #{name}.#{c.name} IS \'#{c.cname}\';"
    end

    result << columns.join(",\n")
    result << ") PARTITIONING KEY (#{ptk});"
    result << "ALTER TABLE #{name} ADD PRIMARY KEY (#{pk.join(',')});"
    result << comments << ""

    result.join("\n")
  end

  def my_to_csv
    "\uFEFF#{my_csv}"
  end

  def my_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ['物理模型名称', name]
      csv << ['逻辑模型名称', cname]
      csv << ['归属分类', '经分环境\\']
      csv << ['分表命名规则', '不分表/按月分表/按日分表']
      csv << ['分区字段', ptk]
      csv << ['是否共享', 'FALSE']
      csv << ['字段中文名','字段名称','类型','长度','精度','主键','可空','默认值','注释']
      self.columns.each do |c|
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

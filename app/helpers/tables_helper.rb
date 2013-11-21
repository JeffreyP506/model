module TablesHelper
  def link_to_sql(text, tname, tcname)
    link_to text, "http://172.20.38.77/excel2wiki/createtabsql2.php?model=#{tname}&model_nam=#{tcname}"
  end
end

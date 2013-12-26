# -*- coding: utf-8 -*-
require 'spec_helper'

describe Table do
  before { @table = Table.new(name: "TW_USR_MO", cname: "EDS_用户资料月表",
                              file: "物理模型.ER1", ptk: "USR_NBR") }

  subject { @table }

  it { should respond_to(:name) }
  it { should respond_to(:cname) }
  it { should respond_to(:file) }
  it { should respond_to(:ptk) }
#  it { should respond_to(:search) }

  it { should be_valid }
end

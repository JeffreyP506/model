class LineItem < ActiveRecord::Base
  belongs_to :table
  belongs_to :working_change
end

class AccessCounter < ActiveRecord::Base
  attr_accessible :counter, :page_name
end

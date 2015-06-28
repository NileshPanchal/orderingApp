class Product < ActiveRecord::Base
  has_many :orders
  has_many :customer, :through => :orders
end

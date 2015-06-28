class Customer < ActiveRecord::Base
  has_many :orders
  has_many :products, :through => :orders
  accepts_nested_attributes_for :products, :reject_if => :all_blank, :allow_destroy => true
end

class Client < ActiveRecord::Base
  
  has_one :address
  has_many :orders
  has_and_belongs_to_many :roles
  
  attr_accessible :name


end

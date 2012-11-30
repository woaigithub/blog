class Category < ActiveRecord::Base
  attr_accessible :title

  validates :title, :presence => true, :uniqueness => true, :length => { :maximum => 20 }

  has_many :posts
end

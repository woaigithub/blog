class Tag < ActiveRecord::Base
  attr_accessible :title

  validates :title, :presence => true, :length => {:maximum => 20}

  has_and_belongs_to_many :posts
end

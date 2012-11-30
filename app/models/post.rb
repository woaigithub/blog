class Post < ActiveRecord::Base
  attr_accessible :title, :slug, :content, :summary

  
  validates :title, :presence => true, :length => { :in => 3..30 }
  validates :slug, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :content, :presence => true, :length => {:maximum => 10000}
  validates :summary ,:presence => true, :length => { :maximum => 200 }

  belongs_to :user
  belongs_to :category
  has_many :comments
  has_and_belongs_to_many :tags

#  def to_param
#    "#{id} #{slug}".parameterize
#  end
end

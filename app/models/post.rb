class Post < ActiveRecord::Base
  attr_accessible :content, :slug, :title, :summary

  validates :summary ,:presence => true, :length => { :maximum => 200 }
  validates :title, :presence => true, :length => { :in => 3..30 }
  validates :slug, :presence => true, :uniqueness => true, :length => { :in => 3..20 }

  belongs_to :user
  belongs_to :category
  has_many :comments

#  def to_param
#    "#{id} #{slug}".parameterize
#  end
end

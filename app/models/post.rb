class Post < ActiveRecord::Base
  attr_accessible :content, :slug, :title

  belongs_to :category
  has_many :comments

#  def to_param
#    "#{id} #{slug}".parameterize
#  end
end

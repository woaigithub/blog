class Post < ActiveRecord::Base
  attr_accessible :content, :slug, :title

  belongs_to :category

  def to_param
    "#{id} #{slug}".parameterize
  end
end

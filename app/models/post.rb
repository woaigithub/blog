class Post < ActiveRecord::Base
  attr_accessible :content, :slug, :title

  belongs_to :category
end

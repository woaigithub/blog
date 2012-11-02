class Comment < ActiveRecord::Base
  attr_accessible :content, :title, :commenter, :email, :url

  belongs_to :post

  validates :content, :presence => true,
                      :length => { :in => 10..200 }
end

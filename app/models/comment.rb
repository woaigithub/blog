class Comment < ActiveRecord::Base
  attr_accessible :content, :title, :commenter, :email, :url

  belongs_to :post

#  validates :content, :presence => true
#                      :length => { :maximun => 249 }
end

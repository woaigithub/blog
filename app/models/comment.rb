class Comment < ActiveRecord::Base
  attr_accessible :commenter, :commenter_email, :commenter_url, :content

  validates :content, :presence => true,
                      :length => { :maximum => 200 }

  belongs_to :post
end

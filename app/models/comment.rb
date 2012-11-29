class Comment < ActiveRecord::Base
  attr_accessible :commenter, :commenter_email, :commenter_url, :content

  belongs_to :post
end

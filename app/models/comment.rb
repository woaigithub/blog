class Comment < ActiveRecord::Base
  attr_accessible :commenter, :commenter_email, :commenter_url, :content

  validates :commenter, :presence => true, :length => { :maximum => 25 }
  validates :commenter_email, :presence => true, :length => {:maximum => 50},
                              :format => {:with => /^\w+@\w+\.\w+$/}
  validates :commenter_url, :presence => true, :length => {:maximum => 100}

  validates :content, :presence => true,
                      :length => { :maximum => 200 }

  belongs_to :post
end

class Post < ActiveRecord::Base
  attr_accessible :content, :title, :url, :tags_attributes, :published, :category_id

  has_many :comments, :dependent => :destroy
  has_many :tags, :dependent => :destroy

  belongs_to :category

#  validates :title, :presence => true,

#                    :length => { :minimum => 5, :maximum => 100 }
#  validates :url,   :presence => true

#  validates :content, :presence => true

  accepts_nested_attributes_for :tags, :allow_destroy => true,
         :reject_if => proc { |attrs| attrs.all? { |k,v| v.blank? } }
#  validates :title, :presnece => true
#  validates :url, :presence => true,
#                  :length => { :minimum => 5 }


  scope :published, where(:published => true)
end


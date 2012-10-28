class Role < ActiveRecord::Base
  has_and_belongs_to_many :clients
  # attr_accessible :title, :body
end

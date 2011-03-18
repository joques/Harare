class Comment
  include Mongoid::Document
  field :comment, :type => String
  field :commentator, :type => String
  field :date_created, :type => DateTime
  
  embedded_in :post, :inverse_of => :comments
  
  validates :comment, :presence => true
  validates :commentator, :presence => true
  
  attr_accessible :comment, :commentator, :date_created
end

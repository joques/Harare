class Comment
  include Mongoid::Document
  field :guid
  field :comment, :type => String
  field :commentator, :type => String
  field :date_created, :type => DateTime
  
  key :guid
    
  embedded_in :post, :inverse_of => :comments
  
  validates :comment, :presence => true
  validates :commentator, :presence => true
  
  attr_accessible :comment, :commentator, :date_created
end

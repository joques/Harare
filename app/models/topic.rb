class Topic
  include Mongoid::Document

  field :guid
  field :description, :type => String
  field :keywords, :type => Array
  
  key :guid
  
  embeds_many :posts
  embedded_in :discipline, :inverse_of => :topics
  
  validates :description, :presence => true
  validates :keywords, :presence => true
  attr_accessible :guid, :description, :keywords, :posts
end

class Topic
  include Mongoid::Document

  field :description, :type => String
  field :keywords, :type => Array
  
  embeds_many :posts
  embedded_in :discipline, :inverse_of => :topics
  
  validates :description, :presence => true
  validates :keywords, :presence => true
  attr_accessible :description, :keywords, :posts
end

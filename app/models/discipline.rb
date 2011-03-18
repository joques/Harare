class Discipline
  include Mongoid::Document
  
  field :guid
  field :name, :type => String
  embeds_many :topics
  
  key :guid
  
  validates :name, :presence => true
  
  attr_accessible :name, :topics
end

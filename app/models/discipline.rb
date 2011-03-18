class Discipline
  include Mongoid::Document
  
  field :name, :type => String
  embeds_many :topics
  
  validates :name, :presence => true
  
  attr_accessible :name, :topics
end

class Discipline
  include Mongoid::Document
  
  field :name, :type => String
  embeds_many :topics
  
  validates :name, :presence => true
  
  attr_accessible :name, :topics
  
  
  def as_json(options = {})
    ret = {
      :guid => '/disciplines/#{self.id}',
      :id => self.id,
      :name => self.name,
      :topics => self.topics
    }
  end
end

class Topic
  include Mongoid::Document

  field :description, :type => String
  field :keywords, :type => Array
  
  embeds_many :posts
  embedded_in :discipline, :inverse_of => :topics
  
  validates :description, :presence => true
  # validates :keywords, :presence => true
  attr_accessible :description, :keywords, :posts
  
  def as_json(options = {})
    ret = {
      :guid => self.id,
      :id => self.id,
      :description => self.description,
      :keywords => self.keywords,
      :posts => self.posts
    }
  end
end

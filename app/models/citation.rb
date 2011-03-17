class Citation
  include Mongoid::Document
  field :resource_title, :type => String
  field :resource_type, :type => String
  field :date_of_publication, :type => DateTime
  embeds_many :authors
  
  embedded_in :post, :inverse_of => :citations
  
  validates :resource_title, :presence => true
  validates :resource_type, :inclusion => {:in => %w(wiki conference journal blog)}
  
  attr_accessible :resource_title, :resource_type, :date_of_publication, :authors
end

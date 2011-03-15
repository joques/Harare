class Post
  include Mongoid::Document
  field :title, :type => String
  field :article, :type => String
  field :creator, :type => String
  field :date_created, :type => DateTime
  embeds_many :post_refs
  embeds_many :comments
  embedded_in :topic, :inverse_of => :posts
  
  validates :title, :presence => true,
                    :length => {:maximum => 100}
  validates :article, :presence => true
  
  attr_accessible :title, :article, :creator, :date_created, :comments, :post_refs
end

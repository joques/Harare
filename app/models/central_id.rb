class CentralId
  include Mongoid::Document
  field :discipline_id, :type => Integer
  field :topic_id, :type => Integer
  field :post_id, :type => Integer
  field :comment_id, :type => Integer
  field :reference_id, :type => Integer
  field :author_id, :type => Integer
  
  validates :discipline_id, :numericality => true
  validates :topic_id, :numericality => true
  validates :post_id, :numericality => true
  validates :comment_id, :numericality => true
  validates :reference_id, :numericality => true
  validates :author_id, :numericality => true
  
  attr_accessible :discipline_id, :topic_id, :post_id, :comment_id, :reference_id, :author_id
end

class Counter
  include Mongoid::Document
  field :discipline_counter, :type => Integer
  field :topic_counter, :type => Integer
  field :post_counter, :type => Integer
  field :comment_counter, :type => Integer
  field :citation_counter, :type => Integer
  field :author_counter, :type => Integer
  
  validates :discipline_counter, :numericality => true
  validates :topic_counter, :numericality => true
  validates :post_counter, :numericality => true
  validates :comment_counter, :numericality => true
  validates :citation_counter, :numericality => true
  validates :author_counter, :numericality => true
  
  attr_accessible :discipline_counter, :topic_counter, :post_counter, :comment_counter, :citation_counter, :author_counter
end

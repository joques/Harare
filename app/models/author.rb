class Author
  include Mongoid::Document
  field :first_name, :type => String
  field :last_name, :type => String
  field :email, :type => String

  embedded_in :reference, :inverse_of => :authors
  
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true
  
  attr_accessible :first_name, :last_name, :email
end

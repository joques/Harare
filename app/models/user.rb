class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  field :name
  
  validates :name, :presence => true,
                   :uniqueness => true
  validates :email, :uniqueness => true,
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  validates :password, :uniqueness => true
  validates :password_confirmation, :uniqueness => true
  
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

end

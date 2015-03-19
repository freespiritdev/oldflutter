class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  has_many :friendships
  has_many :friends, :through => :friendships
  
  has_secure_password
  has_many :flits, dependent: :destroy
end

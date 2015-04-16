class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  has_many :friendships
  has_many :friends, :through => :friendships
  
  has_secure_password
  validates :password, length: { minimum: 5 }
  has_many :flits, dependent: :destroy

  def add_friend(friend)
    friendship = friendships.build(:friend_id => friend.id)
    if !friendship.save
      logger.debug "User '#{friend.email}' is already a friend."
    end
  end
end

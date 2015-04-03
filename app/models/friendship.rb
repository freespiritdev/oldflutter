class Friendship < ActiveRecord::Base
  
  belongs_to :friend, :class_name = "User"
  belongs_to :user
  validates_uniqueness_of :friend_id, :scope => :user_id
  validates_presence_of :user_id, :friend_id
end

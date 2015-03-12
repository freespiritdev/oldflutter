class Flit < ActiveRecord::Base
  validates :user_id, :message
  belongs_to :user


end

class Flit < ActiveRecord::Base
  validate :user_id, :message
  belongs_to :user
end

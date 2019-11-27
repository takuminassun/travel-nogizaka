class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :member
  validates_uniqueness_of :member_id, :user_id
end

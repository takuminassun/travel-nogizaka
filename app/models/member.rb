class Member < ApplicationRecord
  # has_many :user_members
  # has_many :user, through: :user_members
  has_many :member_comments
  has_many :comments, through: :member_comments
  
end

class Member < ApplicationRecord
  has_many :member_comments
  has_many :comments, through: :member_comments
  
  has_many :favorites
  has_many :favorited_users, through: :favorites, source: :user
end

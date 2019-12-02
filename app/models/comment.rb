class Comment < ApplicationRecord
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_many :member_comments, dependent: :destroy
  has_many :member, through: :member_comments

  accepts_nested_attributes_for :member_comments
end

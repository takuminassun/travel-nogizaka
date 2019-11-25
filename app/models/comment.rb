class Comment < ApplicationRecord
  has_many :user_commnents
  has_many :user, through: :user_comments
  has_many :member_comments
  has_many :member, through: :member_comments
  accepts_nested_attributes_for :member_comments
end

class Comment < ApplicationRecord
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_many :member_comments, dependent: :destroy
  has_many :member, through: :member_comments

  accepts_nested_attributes_for :member_comments, allow_destroy: true
  mount_uploader :image, ImageUploader

  validates :member_ids, presence: true
  validates :member_ids, length: {maximum: 5}
  validates :place, presence: true
  validates :image, presence: true
  validates :text, presence: true

  def self.search(search)
    return Comment.all unless search
    Comment.where('place LIKE(?)', "%#{search}%")
  end
end

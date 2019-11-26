class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_members
  has_many :members, through: :user_members

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_comments, through: :likes, source: :comment

  def already_liked?(comment)
    self.likes.exists?(comment_id: comment.id)
  end
end

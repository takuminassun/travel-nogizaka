class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :favorites
  has_many :favorited_member, through: :favorites, source: :member

  has_many :comments, dependent: :destroy
  
  has_many :likes, dependent: :destroy
  has_many :liked_comments, through: :likes, source: :comment

  def already_liked?(comment)
    self.likes.exists?(comment_id: comment.id)
  end

  def already_favorited?(member)
    self.favorites.exists?(member_id: member.id)
  end

end

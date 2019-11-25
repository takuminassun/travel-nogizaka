class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :use_members
  has_many :members, through: :user_members
  has_many :user_comments
  has_many :comments, through: :user_comments
end

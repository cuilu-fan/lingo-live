class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :calls
  has_many :reviews
  has_many :messages, through: :friends
  has_many :user_flashcards
  has_many :translations, through: :user_flashcards
  has_many :categories, through: :user_flashcards
  has_many :friends

  def add_friend(friend)
    Friend.create(user_1: self, user_2: friend, requested_by: friend)
  end

  def friends
    Friend.where(user_1: self).or(Friend.where(user_2: self))
  end
end

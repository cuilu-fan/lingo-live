class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :calls
  has_many :reviews
  has_many :friends
  has_many :messages, through: :friends
  has_many :user_flashcards
  has_many :flashcards, through: :user_flashcards
  has_many :categories, through: :user_flashcards
end

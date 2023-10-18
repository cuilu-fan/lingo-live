class UserFlashcard < ApplicationRecord
  belongs_to :user
  belongs_to :translation
  belongs_to :category
end

class Call < ApplicationRecord
  belongs_to :user
  validates :duration, presence: true, numericality: { only_integer: true }

end

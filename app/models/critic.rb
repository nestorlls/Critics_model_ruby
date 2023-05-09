class Critic < ApplicationRecord
  belongs_to :game
  belongs_to :user

  # Validates
  validates :title, :body, presence: true
end

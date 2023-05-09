class Game < ApplicationRecord
  validates :name, :genre, :price, :release_date, presence: true
  validates :genre,
            inclusion: { in: ["Simulator", "Adventure", "Strategy", "Role-playing (RPG)", "Shooter",
                              "Fighting", "Sport"] }
  validates :price, numericality: { greater_than: 0 }
end

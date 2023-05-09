class User < ApplicationRecord
  validates :username, :email, presence: true, uniqueness: true
  validates :username, length: { minimum: 6,
    too_short: "%{count} characters is the minimum allowed" }
  validates :email, format: { with: /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/g }
  validates :birth_date, comparison: { less_than: Time.zone.today, message: "can't be in the future"}
  validates :birth_date, comparison: { greater_than: 120.years.ago, message: "can't be more than 120 years ago"}
end

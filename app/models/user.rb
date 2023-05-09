class User < ApplicationRecord
  has_many :critics

  validates :username, :email, presence: true, uniqueness: true
  validates :username, length: { minimum: 6,
                                 too_short: "%<count>s characters is the minimum allowed" }
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }

  # Using custom method validations
  validate :too_old, :not_born

  def too_old
    return unless !birth_date.nil? && birth_date < 120.years.ago

    errors.add(:birth_date, "can't be more than 120 years ago")
  end

  def not_born
    return unless !birth_date.nil? && birth_date > Time.zone.today

    errors.add(:birth_date, "can't be in the future")
  end
end

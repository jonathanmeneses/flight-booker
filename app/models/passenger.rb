class Passenger < ApplicationRecord
  belongs_to :booking
  validates :name, presence: true
  validates :email, presence: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: 'must be a valid email address' }
  validate :name_cannot_be_blank

  private

  def name_cannot_be_blank
    errors.add(:name, "can't be blank or contain only whitespace") if name.blank? || name.length < 2
  end
end

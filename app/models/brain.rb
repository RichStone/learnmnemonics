class Brain < ApplicationRecord
  has_many :major_systems, dependent: :destroy

  validates :email,
    format: { with: URI::MailTo::EMAIL_REGEXP },
    presence: true,
    uniqueness: true
end

class Peg < ApplicationRecord
  belongs_to :major_system, foreign_key: "mnemonic_system_id"

  has_one_attached :image

  validates :number, presence: false, numericality: { only_integer: true }
  validates :phrase, presence: false
end

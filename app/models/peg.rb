class Peg < ApplicationRecord
  belongs_to :major_system, foreign_key: "mnemonic_system_id"

  has_one_attached :image, dependent: :destroy

  validates :number, presence: false, numericality: { only_integer: true }
  validates :phrase, presence: false

  # TODO: This might break once pegs with numbering like `01`, `001`, etc. are
  # introduced.
  scope :ordered, -> { order('number::integer ASC') }
end

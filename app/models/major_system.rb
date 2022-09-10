class MajorSystem < ApplicationRecord
  belongs_to :brain, optional: true

  validates :origin, presence: true
  validates :language_iso, presence: true, length: {maximum: 2, minimum: 2}

  scope :for_public_view, -> { where(brain: nil) }
end

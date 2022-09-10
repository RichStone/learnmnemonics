class MajorSystem < MnemonicSystem
  belongs_to :brain, optional: true

  # TODO: origin should be an additional resource:
  # Origin.author, Origin.url, Origin.title, etc.
  validates :origin, presence: true
  validates :origin_url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])

  validates :language_iso, presence: true, length: {maximum: 2, minimum: 2}

  scope :original, -> { where(brain: nil) }
end

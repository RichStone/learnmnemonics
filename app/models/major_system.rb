class MajorSystem < MnemonicSystem
  DEFAULT_LANGUAGE_ISO = "en"

  belongs_to :brain, optional: true
  has_many :pegs, foreign_key: "mnemonic_system_id", dependent: :destroy

  # TODO: origin should be an additional resource:
  # Origin.author, Origin.url, Origin.title, etc.
  validates :origin, presence: true
  validates :origin_url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])

  validates :language_iso, presence: true, length: {maximum: 2, minimum: 2}

  scope :original, -> { where(brain: nil) }
  scope :english, -> { where(language_iso: "en") }
  scope :language, ->(language_iso) do
    where(language_iso: language_iso.presence || DEFAULT_LANGUAGE_ISO)
  end
end

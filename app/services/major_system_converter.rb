# Converts a major system from an original one to a brain-specific one,
# duplicating everything.
class MajorSystemConverter
  CONVERSIONS_LIMIT = 2

  class ConversionLimitReachedError < StandardError
  end

  def initialize(original, brain)
    @original = original
    @brain = brain
  end

  def convert
    if conversion_limit_reached?
      raise(ConversionLimitReachedError,
        "Your memocortex is full, contact the support if you need more brain space")
    end

    MajorSystem.create!(
      origin: original.origin,
      origin_url: original.origin_url,
      language_iso: original.language_iso,
      brain: brain
    )
  end

  private

  attr_reader :original, :brain

  def conversion_limit_reached?
    brain.major_systems.count >= CONVERSIONS_LIMIT
  end
end

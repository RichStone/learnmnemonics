# Converts a major system from an original one to a brain-specific one,
# duplicating everything.
class MajorSystemConverter
  CONVERSIONS_LIMIT = 2

  class ConversionLimitReachedError < StandardError
  end

  def self.convert(original, brain)
    if conversion_limit_reached?(brain)
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

  def self.conversion_limit_reached?(brain)
    brain.major_systems.count >= CONVERSIONS_LIMIT
  end
end

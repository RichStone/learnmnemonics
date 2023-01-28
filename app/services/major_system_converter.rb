# Converts a major system from an original one to a brain-specific one,
# duplicating everything.
class MajorSystemConverter
  def self.convert(original, brain)
    MajorSystem.create!(
      origin: original.origin,
      origin_url: original.origin_url,
      language_iso: original.language_iso,
      brain: brain
    )
  end
end

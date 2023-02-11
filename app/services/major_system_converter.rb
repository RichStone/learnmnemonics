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

    # TODO: This should be wrapped into a transaction, but it ends up in IOError.
    # Either get the image copying out of the transaction or use a Thread?
    #
    # ApplicationRecord.transaction do
    new_system = clone_system
    clone_pegs(new_system)

    new_system
    # end
  end

  private

  attr_reader :original, :brain

  def conversion_limit_reached?
    brain.major_systems.count >= CONVERSIONS_LIMIT
  end

  def clone_system
    new_system = MajorSystem.create!(
      origin: original.origin,
      origin_url: original.origin_url,
      language_iso: original.language_iso,
      brain: brain
    )
  end

  def clone_pegs(to_system)
    original.pegs.each do |old_peg|
      new_peg = Peg.create!(
        number: old_peg.number,
        phrase: old_peg.phrase,
        major_system: to_system
      )

      clone_image(old_peg, new_peg)
    end
  end

  def clone_image(from_peg, to_peg)
    return unless from_peg.image.attached?

    from_peg.image.blob.open do |tempfile|
      to_peg.image.attach(
        io: tempfile,
        filename: from_peg.image.blob.filename,
        content_type: from_peg.image.blob.content_type
      )
    end
  end
end

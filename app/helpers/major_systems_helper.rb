module MajorSystemsHelper
  # TODO: Pass original systems loaded right to the view to avoid additional queries here.
  def public_major_systems_select(selected_language:)
    MajorSystem
      .original
      .where(language_iso: selected_language)
      .pluck(:origin, :id)
      .to_h { |origin, id| [origin, id] }
  end

  # TODO: Pass original systems loaded right to the view to avoid additional queries here.
  def public_major_system_languages_select
    MajorSystem
      .original
      .pluck(:language_iso)
      .uniq
      .to_h do |iso|
      [::ISO_639.find(iso).english_name, iso]
    end
  end
end

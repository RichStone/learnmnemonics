# Create seed records alongside the database: bin/rails db:setup
# Run the script anytime: bin/rails db:seed
# To avoid duplication of records: bin/rails db:seed:replant

# English Wikipedia Major System.
en_wiki_system = MajorSystem.create(
  origin: "Wikipedia",
  origin_url: "https://en.wikipedia.org/wiki/Mnemonic_major_system",
  language_iso: "en",
  brain: nil # An original system.
)
%w[
    hose hat hen home arrow whale shoe cow hoof pie
    daisy tattoo tuna dome diary tail dish dog dove tuba
    nose net onion enemy winery nail nacho neck knife honeybee
  ]
  .each_with_index do |phrase, i|

  peg = Peg.create(
    number: i,
    phrase: phrase,
    mnemonic_system_id: en_wiki_system.id
  )

  # Attach image.
  base_path = "app/assets/images/seeds/"
  default_path = base_path + "bob.png"
  # Image names must be stored lower case, concatenated by dashes & as .png.
  filename = "#{phrase.downcase.gsub(" ", "-")}.png"
  candidate = base_path + filename

  path = File.file?(candidate) ? candidate : default_path
  peg.image.attach(io: File.open(path), filename: File.basename(path))
end

# German "Warum fällt das Schaf vom Baum" Major System.
de_stenger_system = MajorSystem.create(
  origin: "Warum Fällt Das Schaf vom Baum - Christian Stenger",
  origin_url: "https://www.amazon.de/-/en/Christiane-Stenger/dp/3453685113",
  language_iso: "en",
  brain: nil # An original system.
)
%w[
    Sau Tee Noah Mai Reh Lee Schuhe Kuh Fee Po
    Tüte Tonne Team Teer Tal Tasche Theke Taufe Taube
    Nase Note Nonne Nemo Narr Nil Nische Nike Neffe Neubau
  ]
  .each_with_index do |phrase, i|

  peg = Peg.create(
    number: i,
    phrase: phrase,
    mnemonic_system_id: de_stenger_system.id
  )

  # Attach image.
  base_path = "app/assets/images/seeds/"
  default_path = base_path + "bob.png"
  # Image names must be stored lower case, concatenated by dashes & as .png.
  filename = "#{phrase.downcase.gsub(" ", "-")}.png"
  candidate = base_path + filename

  path = File.file?(candidate) ? candidate : default_path
  peg.image.attach(io: File.open(path), filename: File.basename(path))
end

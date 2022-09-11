# Create seed records alongside the database: bin/rails db:setup
# Run the script anytime: bin/rails db:seed
# To avoid duplication of records: bin/rails db:seed:replant

# To create a new original set:
#
# 1. Create the system (with `brain: nil`).
# 2. Create the pegs array.
# 3. Add .png images to `app/assets/images/seeds` with exactly the same name as
# the words in pegs array (sometimes you might add a duplicate image for which
# the picture already exist in a different language).
# 4. Run `bin/rails db:seed:replant`.
# 5. In production, images might get orphaned on S3 (?).

# English Wikipedia Major System.
en_wiki_system = MajorSystem.create(
  origin: "Wikipedia",
  origin_url: "https://en.wikipedia.org/wiki/Mnemonic_major_system",
  language_iso: "en",
  brain: nil # An original system.
)
en_wiki_pegs =
  %w[hose hat hen home arrow whale shoe cow hoof pie
     daisy tattoo tuna dome diary tail dish dog dove tuba
     nose net onion enemy winery nail nacho neck knife honeybee]

# German "Warum fällt das Schaf vom Baum" Major System.
de_stenger_system = MajorSystem.create(
  origin: "Warum Fällt Das Schaf vom Baum - Christian Stenger",
  origin_url: "https://www.amazon.de/-/en/Christiane-Stenger/dp/3453685113",
  language_iso: "de",
  brain: nil # An original system.
)
de_stenger_pegs =
  %w[Sau Tee Noah Mai Reh Lee Schuhe Kuh Fee Po
     Tüte Tonne Team Teer Tal Tasche Theke Taufe Taube
     Nase Note Nonne Nemo Narr Nil Nische Nike Neffe Neubau]

# English Tony Buzan Major System.
en_buzan_gman_system = MajorSystem.create(
  origin: "Tony Buzan's pegs - gman70",
  origin_url: "https://app.memrise.com/course/43442/major-system-for-00-to-99/1/",
  language_iso: "en",
  brain: nil # An original system.
)
en_buzan_gman_pegs =
  %w[saw day Noah Ma row law jaw key fee bay
     dice dad dane dam deer duel dash deck daffy dab
     NASA net nan name Nero nail Nosh neck Navy nap]

def self.create_pegs(pegs, system)
  pegs.each_with_index do |phrase, i|
    peg = Peg.create(
      number: i,
      phrase: phrase,
      mnemonic_system_id: system.id
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
end

self.create_pegs(en_wiki_pegs, en_wiki_system)
self.create_pegs(de_stenger_pegs, de_stenger_system)
self.create_pegs(en_buzan_gman_pegs, en_buzan_gman_system)

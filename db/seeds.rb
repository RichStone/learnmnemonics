# Create seed records alongside the database: bin/rails db:setup
# Run the script anytime: bin/rails db:seed
# To avoid duplication of records: bin/rails db:seed:replant

# To create a new original set:
#
# 1. Create the system (with `brain: nil`).
# 2. Create the pegs array.
# 3. Add .PNG images to `app/assets/images/seeds` with exactly the same name as
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
  %w[
    hose hat hen home arrow whale shoe cow hoof pie
    daisy tattoo tuna dome diary tail dish dog dove tuba
    nose net onion enemy winery nail nacho neck knife honeybee
    mouse meadow moon mummy emery mole match mug movie map
    rice road urine rum aurora railway roach rag roof rope
    louse lady lion lime lorry lily leech leg lava lip
    cheese cheetah chin gem shrew chilli cha-cha chick chef jeep
    goose cat coin game crow clay cage cake cave cube
    vase video fan ovum fairy fool veggie fig fife vibe
    boss bead pony puma berry bell pouch bike beef pipe
  ]

# German "Warum fällt das Schaf vom Baum" Major System.
de_stenger_system = MajorSystem.create(
  origin: "Warum Fällt Das Schaf vom Baum - Christiane Stenger",
  origin_url: "https://www.amazon.de/-/en/Christiane-Stenger/dp/3453685113",
  language_iso: "de",
  brain: nil # An original system.
)
de_stenger_pegs =
  %w[
    Sau Tee Noah Mai Reh Lee Schuh Kuh Fee Po
    Tasse Tüte Tonne Team Teer Tal Tasche Theke Taufe Taube
    Nase Note Nonne Nemo Narr Nil Nische Nike Neffe Neubau
    Moos Matte Mann Mama Meer Mehl Masche Mac Mafia Mappe
    Rose Ratte Ruine Rum Rohr Rolle Rauch Rock Reif Raupe
    Lasso Latte Linie Lehm Leier Lila Loch Lack Lava Lupe
    Schuss Schutt Scheune Schaum Schere Schal Schach Scheck Schaf Schippe
    Kasse Kette Kanne Kamm Karre Keule Koch Kacke Kaffee Kappe
    Fass Fett Fahne WM Fähre Falle Fisch Waage Waffe Wabe
    Bus Bett Bahn Baum Bier Ball Buch Backe Bifi Papa
  ]

# English Tony Buzan Major System.
en_buzan_gman_system = MajorSystem.create(
  origin: "Tony Buzan's pegs - gman70",
  origin_url: "https://app.memrise.com/course/43442/major-system-for-00-to-99/1/",
  language_iso: "en",
  brain: nil # An original system.
)
en_buzan_gman_pegs =
  %w[
    saw day Noah Ma row law jaw key fee bay
    dice dad dane dam deer duel dash deck daffy dab
    NASA net nan name Nero nail Nosh neck Navy nap
    Maze Mat Man Ma'am Mare Mail Mash Mac Mafia Map
    Race Rat Rain Ram Rear Rail Rash Rack Ref Rap
    Lace Lad Lane Lamb Lair Lilo Lash Lake Lava Lab
    Chase Chat Chain Jam Chair Jail Judge Check Shave Chap
    Case Cat Can Cameo Car Call Cash Cake Cave Cab
    Face  Fat Fan Fame Fair Fall Fish Fag Five Fab
    Base Bat Bin Bomb Bar Ball Bash Back Beef Babe
  ]

rich = Brain.create(email: "richard.had@hotmail.de", password: "password5")

# English Wikipedia Major System for Rich.
# TODO: Later this should be created via the conversion method.
richs_en_wiki_system = MajorSystem.create(
  origin: "Wikipedia",
  origin_url: "https://en.wikipedia.org/wiki/Mnemonic_major_system",
  language_iso: "en",
  brain: rich
)

def self.create_pegs(pegs, system)
  pegs.each_with_index do |phrase, i|
    peg = Peg.create(
      number: i,
      phrase: phrase,
      mnemonic_system_id: system.id
    )

    # Attach image.
    base_path = "app/assets/images/seeds/"
    default_path = base_path + "placeholder.PNG"
    # Image names must be stored lower case, concatenated by dashes & as .PNG.
    filename = "#{phrase.downcase.gsub(" ", "-")}.PNG"
    candidate = base_path + filename

    path = File.file?(candidate) ? candidate : default_path
    peg.image.attach(io: File.open(path), filename: File.basename(path))
  end
end

self.create_pegs(en_wiki_pegs, en_wiki_system)
self.create_pegs(de_stenger_pegs, de_stenger_system)
self.create_pegs(en_buzan_gman_pegs, en_buzan_gman_system)
self.create_pegs(en_wiki_pegs, richs_en_wiki_system)

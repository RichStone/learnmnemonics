# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Default Major System Pegs.
%w[
    hose hat hen home arrow whale shoe cow hoof pie
    daisy tattoo tuna dome diary tail dish dog dove tuba
    nose net onion enemy winery nail nacho neck knife honeybee
  ].each_with_index do |phrase, i|

  peg = MajorSystemPeg.create(
    number: i,
    phrase: phrase
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

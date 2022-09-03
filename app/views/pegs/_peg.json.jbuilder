json.extract! peg, :id, :image, :number, :phrase, :created_at, :updated_at
json.url peg_url(peg, format: :json)
json.image url_for(peg.image)

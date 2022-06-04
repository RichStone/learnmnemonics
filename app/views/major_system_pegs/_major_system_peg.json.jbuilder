json.extract! major_system_peg, :id, :image, :number, :phrase, :created_at, :updated_at
json.url major_system_peg_url(major_system_peg, format: :json)
json.image url_for(major_system_peg.image)

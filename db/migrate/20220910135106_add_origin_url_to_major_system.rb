class AddOriginUrlToMajorSystem < ActiveRecord::Migration[7.0]
  def change
    add_column :major_systems, :origin_url, :string
  end
end

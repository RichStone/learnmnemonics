class CreateMajorSystems < ActiveRecord::Migration[7.0]
  def change
    create_table :major_systems do |t|
      t.string :origin, null: false
      t.string :language_iso, null: false, limit: 2
      t.references :brain, null: true, foreign_key: true

      t.timestamps
    end
  end
end

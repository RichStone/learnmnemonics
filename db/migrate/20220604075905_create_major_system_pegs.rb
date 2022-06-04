class CreateMajorSystemPegs < ActiveRecord::Migration[7.0]
  def change
    create_table :major_system_pegs do |t|
      t.string :number, limit: 10
      t.string :phrase, limit: 100

      t.timestamps
    end
  end
end

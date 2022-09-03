class RenameMajorSystemPegToPeg < ActiveRecord::Migration[7.0]
  def change
    rename_table :major_system_pegs, :pegs
  end
end

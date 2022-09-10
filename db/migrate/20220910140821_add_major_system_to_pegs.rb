class AddMajorSystemToPegs < ActiveRecord::Migration[7.0]
  def change
    add_reference :pegs, :mnemonic_system, null: true, foreign_key: true
  end
end

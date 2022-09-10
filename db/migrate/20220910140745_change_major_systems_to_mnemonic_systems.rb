class ChangeMajorSystemsToMnemonicSystems < ActiveRecord::Migration[7.0]
  def change
    rename_table :major_systems, :mnemonic_systems
  end
end

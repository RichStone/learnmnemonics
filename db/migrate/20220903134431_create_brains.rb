class CreateBrains < ActiveRecord::Migration[7.0]
  def change
    create_table :brains do |t|
      t.string :email, null: false, index: true

      t.timestamps
    end
  end
end

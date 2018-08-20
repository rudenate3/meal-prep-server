class CreateQuantities < ActiveRecord::Migration[5.2]
  def change
    create_table :quantities do |t|
      t.string :title, null: false
      t.string :description, null: false

      t.timestamps
    end
  end
end

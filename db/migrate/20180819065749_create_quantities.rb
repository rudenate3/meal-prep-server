class CreateQuantities < ActiveRecord::Migration[5.2]
  def change
    create_table :quantities do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end

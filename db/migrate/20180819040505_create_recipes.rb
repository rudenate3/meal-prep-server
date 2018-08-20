class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.references :user, foreign_key: true
      t.string :description, null: false
      t.integer :favorited, null: false, default: 0

      t.timestamps
    end
  end
end

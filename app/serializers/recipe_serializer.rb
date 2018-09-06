class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :ingredients
  has_one :author
  has_many :tags
  has_many :comments

  def ingredients
    self.object.ingredients.map{|ingredient|
      {
        id: ingredient.id,
        title: ingredient.title, 
        quantityType: Quantity.find(ingredient.quantity_id).title, 
        quantity: self.object.recipe_ingredients.find_by(ingredient: ingredient.id).quantity
      }
    }
  end
end

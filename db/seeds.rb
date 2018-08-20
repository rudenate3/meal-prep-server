# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([
  {
    email: 'admin@test.com',
    password: 'admintest',
    admin: true
  },
  {
    email: 'user1@test.com',
    password: 'usertest'
  },
  {
    email: 'user2@test.com',
    password: 'usertest'
  }
])

Tag.create([
  {
    title: 'Keto',
    description: 'Ketogenic diet'
  },
  {
    title: 'Low Carb',
    description: 'Low Carb diet'
  },
  {
    title: 'Slow Cooker',
    description: 'Uses a Slow Cooker'
  },
  {
    title: 'Instant Pot',
    description: 'Uses an Instant Pot'
  },
  {
    title: 'Vegetarian',
    description: 'Vegetarian diet'
  }
])

Quantity.create([
  {
    title: 'Ounce',
    description: 'An Ounce'
  },
  {
    title: 'Teaspoon',
    description: 'A Teaspoon'
  },
  {
    title: 'Tablespoon',
    description: 'A Tablespoon'
  },
  {
    title: 'Cup',
    description: 'A Cup'
  },
  {
    title: 'Half-Cup',
    description: 'A Half Cup'
  }
])

Ingredient.create([
  {
    title: 'Marinara Sauce',
    description: 'Marinara Sauce',
    quantity_id: 1
  },
  {
    title: 'Pasta',
    description: 'Dried Pasta',
    quantity_id: 4
  },
  {
    title: 'Parmesean',
    description: 'Parmesean Cheese',
    quantity_id: 3
  },
  {
    title: 'Italian Seasoning',
    description: 'Italian Seasoning',
    quantity_id: 2
  },
  {
    title: 'Scrambled Hamburger',
    description: 'Scrambled Hamburger',
    quantity_id: 5
  }
])

Recipe.create([
  {
    title: 'Ultimate Pasta',
    user_id: 1,
    description: 'Everything',
    favorited: 0
  },
  {
    title: 'Vegetarian Pasta',
    user_id: 2,
    description: 'Vegetarian Pasta',
    favorited: 0
  },
  {
    title: 'Parmesean Pasta',
    user_id: 3,
    description: 'Parmesean Pasta',
    favorited: 0
  }
])

recipe1 = Recipe.find(1)
recipe2 = Recipe.find(2)
recipe3 = Recipe.find(3)

recipe1.tags << Tag.find(1)
recipe1.tags << Tag.find(2)

recipe2.tags << Tag.find(1)
recipe2.tags << Tag.find(5)

recipe3.tags << Tag.find(1)
recipe3.tags << Tag.find(2)
recipe3.tags << Tag.find(5)

recipe1.ingredients  << Ingredient.find(1)
recipe1.ingredients  << Ingredient.find(2)
recipe1.ingredients  << Ingredient.find(3)
recipe1.ingredients  << Ingredient.find(4)
recipe1.ingredients  << Ingredient.find(5)

recipe2.ingredients  << Ingredient.find(1)
recipe2.ingredients  << Ingredient.find(2)
recipe2.ingredients  << Ingredient.find(3)
recipe2.ingredients  << Ingredient.find(4)

recipe3.ingredients  << Ingredient.find(2)
recipe3.ingredients  << Ingredient.find(3)

recipe1.save
recipe2.save
recipe3.save

userAdmin = User.find(1)

userAdmin.favorites << Recipe.find(1)
userAdmin.favorites << Recipe.find(2)
userAdmin.favorites << Recipe.find(3)

userAdmin.save
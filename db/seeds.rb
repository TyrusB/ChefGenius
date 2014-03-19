# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


[ "Spaghetti Bolognese",
  "Coq au Vin",
  "Chicken and Dumplings" ].each do |name|
    r = Recipe.new(:name => name)
    r.save
end

[ "Chicken", "Beef", "Cream" ].each do |name|
  i = Ingredient.new(:name => name)
  i.save
end

# recipe_id, ingedient_id, amount, amount_type

[ [1, 2, 2, "pounds"],
  [1, 3, 1, "cup"],
  [2, 1, 1, "bird"],
  [3, 1, 1, "pounds"] ].each do |recipe_id, ingredient_id, amount, amount_type|
    rn = RecipeNeed.new(
      :recipe_id => recipe_id,
      :ingredient_id => ingredient_id,
      :amount => amount,
      :amount_type => amount_type
    )
    rn.save
end
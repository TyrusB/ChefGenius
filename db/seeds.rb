# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


[
  [ "Spaghetti Bolognese", "30 minutes", "2 hours", "This is a really good recipe!"],
  [ "Coq au Vin", "30 minutes", "1.5 hours", "Braising this dish really makes it taste delicious!"],
  [ "Braised Brussels SProuts", "10 minutes", "20 minutes", "Cream is delicious"],
  [ "Grilled Vegetables", "20 minutes", "10 minutes", "Prep your grill ahead of time and get ready for some delicious food. I recommend cooking over a really hot fire."],
  [ "Test Recipe 5", "15 minutes", "2 hours 10 minutes", "TLo-fi non duis aliquip. Photo booth slow-carb organic ethnic ad disrupt. Freegan American Apparel aesthetic accusamus dolor, Tonx banh mi chambray. Literally photo booth Godard, reprehenderit pork belly banjo High Life umami Tonx gluten-free nulla 90's slow-carb master cleanse. Butcher plaid gluten-free, hashtag dolore keffiyeh four loko leggings lo-fi chia est stumptown YOLO nulla. 8-bit esse officia Blue Bottle. Stumptown farm-to-table hoodie tattooed, bespoke literally jean shorts tofu.!"]
].each do |name, prep_time, cook_time, notes|
    r = Recipe.new(:name => name, :prep_time => prep_time, :cook_time => cook_time, :notes => notes)
    r.save
end

[ "chicken", "beef", "cream", "milk", "brussels sprouts", "zucchini", "pineapple", "butter", "onion", "carrot" ].each do |name|
  i = Ingredient.new(:name => name)
  i.save
end

# recipe_id, ingedient_id, amount, amount_type

[ [2, 2, 2, "pounds"],
  [2, 3, 1.5, "cups"],
  [2, 4, 5, "pounds"],
  [2, 7, 3, "tsps"],
  [2, 1, 1.7, "tbs"],
  [2, 6, 1.7, "tbs"],

  [1, 2, 2, "pounds"],
  [1, 3, 1.5, "cups"],
  [1, 4, 5, "pounds"],
  [1, 7, 3, "tsps"],
  [1, 1, 1.7, "tbs"],
  [1, 6, 1.7, "tbs"],

  [3, 2, 2, "pounds"],
  [3, 3, 1.5, "cups"],
  [3, 4, 5, "pounds"],
  [3, 7, 3, "tsps"],
  [3, 1, 1.7, "tbs"],
  [3, 6, 1.7, "tbs"],

  [4, 2, 2, "pounds"],
  [4, 3, 1.5, "cups"],
  [4, 4, 5, "pounds"],
  [4, 7, 3, "tsps"],
  [4, 1, 1.7, "tbs"],
  [4, 6, 1.7, "tbs"],


  [5, 2, 2, "pounds"],
  [5, 3, 1.5, "cups"],
  [5, 4, 5, "pounds"],
  [5, 7, 3, "tsps"],
  [5, 1, 1.7, "tbs"],
  [5, 6, 1.7, "tbs"],

].each do |recipe_id, ingredient_id, amount, amount_type|
    rn = RecipeNeed.new(
      :recipe_id => recipe_id,
      :ingredient_id => ingredient_id,
      :amount => amount,
      :amount_type => amount_type
    )
    rn.save
end

# description, recipe_id

[ ["Dice onions and cut up your garlic. Chop carrots and celery", 1],
  ["Season your chicken with salt and pepper. Dredge with flour and then brown in oil", 1],
  ["Remove the chicken from the pot, and add your carrots, celery, onions, and garlic. Cook for about 10 minutes, until the veggies are soft.", 1],
  ["Deglaze with the brandy. Once that's done, add your wine and chicken stock to the pot and heat to a simmer.", 1],
  ["Add your chicken back to the pot. Cook until the chicken is fork tender, or reaches an internal temperature of 165 degrees", 1],
  ["While chicken is cooking, saute mushrooms and pearl onions in 1 cup of reserved sauce", 1],
  ["Once chicken is done, remove from pot. Increase heat and boil the sauce until it becomes thick, about the consistency of a vinagrette", 1],
  ["Add the mushrooms and pearl onions to the sauce. Pour over the chicken and serve", 1],

  ["Dice onions and cut up your garlic. Chop carrots and celery", 2],
  ["Season your chicken with salt and pepper. Dredge with flour and then brown in oil", 2],
  ["Remove the chicken from the pot, and add your carrots, celery, onions, and garlic. Cook for about 10 minutes, until the veggies are soft.", 2],
  ["Deglaze with the brandy. Once that's done, add your wine and chicken stock to the pot and heat to a simmer.", 2],
  ["Add your chicken back to the pot. Cook until the chicken is fork tender, or reaches an internal temperature of 165 degrees", 2],
  ["While chicken is cooking, saute mushrooms and pearl onions in 1 cup of reserved sauce", 2],
  ["Once chicken is done, remove from pot. Increase heat and boil the sauce until it becomes thick, about the consistency of a vinagrette", 2],
  ["Add the mushrooms and pearl onions to the sauce. Pour over the chicken and serve", 2],

  ["Dice onions and cut up your garlic. Chop carrots and celery", 3],
  ["Season your chicken with salt and pepper. Dredge with flour and then brown in oil", 3],
  ["Remove the chicken from the pot, and add your carrots, celery, onions, and garlic. Cook for about 10 minutes, until the veggies are soft.", 3],
  ["Deglaze with the brandy. Once that's done, add your wine and chicken stock to the pot and heat to a simmer.", 3],
  ["Add your chicken back to the pot. Cook until the chicken is fork tender, or reaches an internal temperature of 165 degrees", 3],
  ["While chicken is cooking, saute mushrooms and pearl onions in 1 cup of reserved sauce", 3],
  ["Once chicken is done, remove from pot. Increase heat and boil the sauce until it becomes thick, about the consistency of a vinagrette", 3],
  ["Add the mushrooms and pearl onions to the sauce. Pour over the chicken and serve", 3],

  ["Dice onions and cut up your garlic. Chop carrots and celery", 4],
  ["Season your chicken with salt and pepper. Dredge with flour and then brown in oil", 4],
  ["Remove the chicken from the pot, and add your carrots, celery, onions, and garlic. Cook for about 10 minutes, until the veggies are soft.", 4],
  ["Deglaze with the brandy. Once that's done, add your wine and chicken stock to the pot and heat to a simmer.", 4],
  ["Add your chicken back to the pot. Cook until the chicken is fork tender, or reaches an internal temperature of 165 degrees", 4],
  ["While chicken is cooking, saute mushrooms and pearl onions in 1 cup of reserved sauce", 4],
  ["Once chicken is done, remove from pot. Increase heat and boil the sauce until it becomes thick, about the consistency of a vinagrette", 4],
  ["Add the mushrooms and pearl onions to the sauce. Pour over the chicken and serve", 4],

  ["Dice onions and cut up your garlic. Chop carrots and celery", 5],
  ["Season your chicken with salt and pepper. Dredge with flour and then brown in oil", 5],
  ["Remove the chicken from the pot, and add your carrots, celery, onions, and garlic. Cook for about 10 minutes, until the veggies are soft.", 5],
  ["Deglaze with the brandy. Once that's done, add your wine and chicken stock to the pot and heat to a simmer.", 5],
  ["Add your chicken back to the pot. Cook until the chicken is fork tender, or reaches an internal temperature of 165 degrees", 5],
  ["While chicken is cooking, saute mushrooms and pearl onions in 1 cup of reserved sauce", 5],
  ["Once chicken is done, remove from pot. Increase heat and boil the sauce until it becomes thick, about the consistency of a vinagrette", 5],
  ["Add the mushrooms and pearl onions to the sauce. Pour over the chicken and serve", 5],


].each do |description, recipe_id|
  s = Step.new(
    :description => description,
    :recipe_id => recipe_id
    )
  s.save
end
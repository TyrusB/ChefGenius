guest = User.create!(email: "guest@chef-genius.com", password: "password")
ty = User.create!(email: "ty@chef-genius.com", password: "password")
ty2 = User.create!(email: "brooks85.ty@gmail.com", password: "password")

# Recipe 1
spag_bol = Recipe.new(
  name: "Spaghetti Bolognese",
  category: "Main Course",
  title_photo: File.open("app/assets/images/coq_au_vin.jpg"),

  note: Note.new(description: "Blah blah blah"),

  info: Info.new(cook_time: "2 hours", prep_time: "2 hours"),

  author_id: guest.id
)

spag_bol.ingredients.build(
  [
    { description: "One whole chicken, 5lbs"   },
    { description: "1.5 cups milk"             },
    { description: "1 whole onion, chopped"    },
    { description: "4 small or 2 large carrots"},
    { description: "4 Tbsps of butter"         },
    { description: "8oz of Mushrooms"          },
    { description: "8oz pearl onions"          },
    { description: "6oz of brandy"             },
    { description: "1 cup chicken stock"       },
    { description: "1 cup of wine"             }
  ]
)

spag_bol.steps.build(
  [
    { description: "Dice onions and cut up your garlic. Chop carrots and celery" },
    { description: "Season your chicken with salt and pepper. Dredge with flour and then brown in oil" },
    { description: "Remove the chicken from the pot, and add your carrots, celery, onions, and garlic. Cook for about 10 minutes, until the veggies are soft." },
    { description: "Deglaze with the brandy. Once that's done, add your wine and chicken stock to the pot and heat to a simmer." },
    { description: "Add your chicken back to the pot. Cook until the chicken is fork tender, or reaches an internal temperature of 165 degrees" },
    { description: "While chicken is cooking, saute mushrooms and pearl onions in 1 cup of reserved sauce" },
    { description: "Once chicken is done, remove from pot. Increase heat and boil the sauce until it becomes thick, about the consistency of a vinagrette" },
    { description: "Add the mushrooms and pearl onions to the sauce. Pour over the chicken and serve" }
  ]
)

spag_bol.save

# Recipe 2
coq = Recipe.new(
  name: "Coq Au Vin",
  category: "Main Course",
  author_id: ty.id,
  title_photo: File.open("app/assets/images/coq_au_vin.jpg"),

  note: Note.new(description: "Blah blah blah"),

  info: Info.new(cook_time: "2 hours", prep_time: "2 hours")
)

coq.ingredients.build(
  [
    { description: "One whole chicken, 5lbs"   },
    { description: "1.5 cups milk"             },
    { description: "1 whole onion, chopped"    },
    { description: "4 small or 2 large carrots"},
    { description: "4 Tbsps of butter"         },
    { description: "8oz of Mushrooms"          },
    { description: "8oz pearl onions"          },
    { description: "6oz of brandy"             },
    { description: "1 cup chicken stock"       },
    { description: "1 cup of wine"             }
  ]
)

coq.steps.build(
  [
    { description: "Dice onions and cut up your garlic. Chop carrots and celery" },
    { description: "Season your chicken with salt and pepper. Dredge with flour and then brown in oil" },
    { description: "Remove the chicken from the pot, and add your carrots, celery, onions, and garlic. Cook for about 10 minutes, until the veggies are soft." },
    { description: "Deglaze with the brandy. Once that's done, add your wine and chicken stock to the pot and heat to a simmer." },
    { description: "Add your chicken back to the pot. Cook until the chicken is fork tender, or reaches an internal temperature of 165 degrees" },
    { description: "While chicken is cooking, saute mushrooms and pearl onions in 1 cup of reserved sauce" },
    { description: "Once chicken is done, remove from pot. Increase heat and boil the sauce until it becomes thick, about the consistency of a vinagrette" },
    { description: "Add the mushrooms and pearl onions to the sauce. Pour over the chicken and serve" }
  ]
)

coq.save

# Recipe 3
pizza = Recipe.new(
  name: "Pesto Pizza",
  category: "Main Course",
  author_id: ty2.id,
  title_photo: File.open("app/assets/images/coq_au_vin.jpg"),

  note: Note.new(description: "Blah blah blah"),

  info: Info.new(cook_time: "2 hours", prep_time: "2 hours")
)

pizza.ingredients.build(
  [
    { description: "One whole chicken, 5lbs"   },
    { description: "1.5 cups milk"             },
    { description: "1 whole onion, chopped"    },
    { description: "4 small or 2 large carrots"},
    { description: "4 Tbsps of butter"         },
    { description: "8oz of Mushrooms"          },
    { description: "8oz pearl onions"          },
    { description: "6oz of brandy"             },
    { description: "1 cup chicken stock"       },
    { description: "1 cup of wine"             }
  ]
)

pizza.steps.build(
  [
    { description: "Dice onions and cut up your garlic. Chop carrots and celery" },
    { description: "Season your chicken with salt and pepper. Dredge with flour and then brown in oil" },
    { description: "Remove the chicken from the pot, and add your carrots, celery, onions, and garlic. Cook for about 10 minutes, until the veggies are soft." },
    { description: "Deglaze with the brandy. Once that's done, add your wine and chicken stock to the pot and heat to a simmer." },
    { description: "Add your chicken back to the pot. Cook until the chicken is fork tender, or reaches an internal temperature of 165 degrees" },
    { description: "While chicken is cooking, saute mushrooms and pearl onions in 1 cup of reserved sauce" },
    { description: "Once chicken is done, remove from pot. Increase heat and boil the sauce until it becomes thick, about the consistency of a vinagrette" },
    { description: "Add the mushrooms and pearl onions to the sauce. Pour over the chicken and serve" }
  ]
)

pizza.save

# Recipe 4
sprouts = Recipe.new(
  name: "Braised Brussels Sprouts",
  category: "Appetizer",
  author_id: guest.id,
  title_photo: File.open("app/assets/images/coq_au_vin.jpg"),

  note: Note.new(description: "Blah blah blah"),

  info: Info.new(cook_time: "2 hours", prep_time: "2 hours")
)

sprouts.ingredients.build(
  [
    { description: "One whole chicken, 5lbs"   },
    { description: "1.5 cups milk"             },
    { description: "1 whole onion, chopped"    },
    { description: "4 small or 2 large carrots"},
    { description: "4 Tbsps of butter"         },
    { description: "8oz of Mushrooms"          },
    { description: "8oz pearl onions"          },
    { description: "6oz of brandy"             },
    { description: "1 cup chicken stock"       },
    { description: "1 cup of wine"             }
  ]
)

sprouts.steps.build(
  [
    { description: "Dice onions and cut up your garlic. Chop carrots and celery" },
    { description: "Season your chicken with salt and pepper. Dredge with flour and then brown in oil" },
    { description: "Remove the chicken from the pot, and add your carrots, celery, onions, and garlic. Cook for about 10 minutes, until the veggies are soft." },
    { description: "Deglaze with the brandy. Once that's done, add your wine and chicken stock to the pot and heat to a simmer." },
    { description: "Add your chicken back to the pot. Cook until the chicken is fork tender, or reaches an internal temperature of 165 degrees" },
    { description: "While chicken is cooking, saute mushrooms and pearl onions in 1 cup of reserved sauce" },
    { description: "Once chicken is done, remove from pot. Increase heat and boil the sauce until it becomes thick, about the consistency of a vinagrette" },
    { description: "Add the mushrooms and pearl onions to the sauce. Pour over the chicken and serve" }
  ]
)

sprouts.save

# Recipe 5
asparagus = Recipe.new(
  name: "Grilled Asparagus",
  category: "Appetizer",
  author_id: guest.id,
  title_photo: File.open("app/assets/images/coq_au_vin.jpg"),

  note: Note.new(description: "Blah blah blah"),

  info: Info.new(cook_time: "2 hours", prep_time: "2 hours")
)

asparagus.ingredients.build(
  [
    { description: "One whole chicken, 5lbs"   },
    { description: "1.5 cups milk"             },
    { description: "1 whole onion, chopped"    },
    { description: "4 small or 2 large carrots"},
    { description: "4 Tbsps of butter"         },
    { description: "8oz of Mushrooms"          },
    { description: "8oz pearl onions"          },
    { description: "6oz of brandy"             },
    { description: "1 cup chicken stock"       },
    { description: "1 cup of wine"             }
  ]
)

asparagus.steps.build(
  [
    { description: "Dice onions and cut up your garlic. Chop carrots and celery" },
    { description: "Season your chicken with salt and pepper. Dredge with flour and then brown in oil" },
    { description: "Remove the chicken from the pot, and add your carrots, celery, onions, and garlic. Cook for about 10 minutes, until the veggies are soft." },
    { description: "Deglaze with the brandy. Once that's done, add your wine and chicken stock to the pot and heat to a simmer." },
    { description: "Add your chicken back to the pot. Cook until the chicken is fork tender, or reaches an internal temperature of 165 degrees" },
    { description: "While chicken is cooking, saute mushrooms and pearl onions in 1 cup of reserved sauce" },
    { description: "Once chicken is done, remove from pot. Increase heat and boil the sauce until it becomes thick, about the consistency of a vinagrette" },
    { description: "Add the mushrooms and pearl onions to the sauce. Pour over the chicken and serve" }
  ]
)

asparagus.save

# Recipe 6
icecream = Recipe.new(
  name: "Truffle Salt Ice Cream",
  category: "Dessert",
  author_id: ty.id,
  title_photo: File.open("app/assets/images/coq_au_vin.jpg"),

  note: Note.new(description: "Blah blah blah"),

  info: Info.new(cook_time: "2 hours", prep_time: "2 hours")
)

icecream.ingredients.build(
  [
    { description: "One whole chicken, 5lbs"   },
    { description: "1.5 cups milk"             },
    { description: "1 whole onion, chopped"    },
    { description: "4 small or 2 large carrots"},
    { description: "4 Tbsps of butter"         },
    { description: "8oz of Mushrooms"          },
    { description: "8oz pearl onions"          },
    { description: "6oz of brandy"             },
    { description: "1 cup chicken stock"       },
    { description: "1 cup of wine"             }
  ]
)

icecream.steps.build(
  [
    { description: "Dice onions and cut up your garlic. Chop carrots and celery" },
    { description: "Season your chicken with salt and pepper. Dredge with flour and then brown in oil" },
    { description: "Remove the chicken from the pot, and add your carrots, celery, onions, and garlic. Cook for about 10 minutes, until the veggies are soft." },
    { description: "Deglaze with the brandy. Once that's done, add your wine and chicken stock to the pot and heat to a simmer." },
    { description: "Add your chicken back to the pot. Cook until the chicken is fork tender, or reaches an internal temperature of 165 degrees" },
    { description: "While chicken is cooking, saute mushrooms and pearl onions in 1 cup of reserved sauce" },
    { description: "Once chicken is done, remove from pot. Increase heat and boil the sauce until it becomes thick, about the consistency of a vinagrette" },
    { description: "Add the mushrooms and pearl onions to the sauce. Pour over the chicken and serve" }
  ]
)

icecream.save
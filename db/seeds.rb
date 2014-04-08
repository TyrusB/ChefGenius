guest = User.create!(email: "guest@chef-genius.com", password: "password")
ty = User.create!(email: "ty@chef-genius.com", password: "password")
ty2 = User.create!(email: "brooks85.ty@gmail.com", password: "password")

# Recipe 1
spag_bol = Recipe.new(
  name: "Spaghetti Bolognese",
  category: "Main Course",
  title_photo: File.open("app/assets/images/coq_au_vin.jpg"),

  note: Note.new(description: "Bushwick next level Shoreditch, ethical normcore sartorial Vice Tonx meh keytar twee ethnic stumptown Odd Future gastropub. McSweeney's Neutra letterpress, organic 8-bit small batch Shoreditch. Tote bag vegan messenger bag American Apparel, craft beer synth Etsy viral. DIY YOLO chillwave selfies Marfa butcher. Occupy disrupt selvage ethnic squid sartorial. Mixtape ennui art party, mumblecore Thundercats gluten-free gastropub locavore post-ironic Schlitz gentrify. American Apparel gastropub yr, ennui McSweeney's hashtag farm-to-table polaroid asymmetrical hoodie Vice."),

  info: Info.new(cook_time: "1.5 - 4 hours", prep_time: "30 minutes"),

  author_id: guest.id
)

spag_bol.ingredients.build(
  [
    { description: "2 pounds ground beef"   },
    { description: "1 pound pancetta"    },
    { description: "4 small or 2 large carrots, chopped"},
    { description: "2 large stalks of celery, chopped"         },
    { description: "1 medium yellow onion, chopped"          },
    { description: "1 cup white wine"          },
    { description: "2 cups of milk"          },
    { description: "1 cup of beef broth"             },
    { description: "2 tbsps of tomato paste (optional)"       },
  ]
)

spag_bol.steps.build(
  [
    { description: "Brown your pancetta in a large pot over medium heat" },
    { description: "Add chopped onions, celery, and carrots to pot with pancetta. Cook until tender, approx 10 minutes" },
    { description: "Increase heat to medium-high and add ground beef to pot 1/3 at a time. Let cook for approximately 15 minutes, turning down heat to medium for the last 5 minutes. Stir only occaisionally, to prevent burning" },
    { description: "Stir pot and deglaze with wine, scraping up the dark caramel colored bits stuck to the bottom of the pan" },
    { description: "Add mik and beef broth to pot. Stir and reduce to a simmer." },
    { description: "Cover pot halfway and cook from 1.5 - 4 hours (the longer the better). The sauce is done once the consistency is thick, like oatmeal." }
  ]
)

spag_bol.save

# Recipe 2
coq = Recipe.new(
  name: "Coq Au Vin",
  category: "Main Course",
  author_id: ty.id,
  title_photo: File.open("app/assets/images/coq_au_vin.jpg"),

  note: Note.new(description: "Bushwick next level Shoreditch, ethical normcore sartorial Vice Tonx meh keytar twee ethnic stumptown Odd Future gastropub. McSweeney's Neutra letterpress, organic 8-bit small batch Shoreditch. Tote bag vegan messenger bag American Apparel, craft beer synth Etsy viral. DIY YOLO chillwave selfies Marfa butcher. Occupy disrupt selvage ethnic squid sartorial. Mixtape ennui art party, mumblecore Thundercats gluten-free gastropub locavore post-ironic Schlitz gentrify. American Apparel gastropub yr, ennui McSweeney's hashtag farm-to-table polaroid asymmetrical hoodie Vice."),

  info: Info.new(cook_time: "2 hours", prep_time: "1.5 hours")
)

coq.ingredients.build(
  [
    { description: "One whole chicken, 5lbs"   },
    { description: "One cup of flour"          },
    { description: "Salt and pepper"           },
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
  name: "Kale Pizza",
  category: "Main Course",
  author_id: ty2.id,
  title_photo: File.open("app/assets/images/coq_au_vin.jpg"),

  note: Note.new(description: "Yes, seriously, Kale Pizza! Sounds gross, but it's delicious. I ascribe this recipe's deliciousness to sufficient-cheese principal: add enough cheese to anything, and it's going to be good (similar to the sufficient-butter and sufficient-cream principals). The pizza is actually quite easy to make and a great way to introduce someone to kale."),

  info: Info.new(cook_time: "15 minutes", prep_time: "15 minutes")
)

pizza.ingredients.build(
  [
    { description: "1 tbsp olive oil"   },
    { description: "1 medium onion"                         },
    { description: "Premade pizza dough/crust"              },
    { description: "3 tbsps pizza sauce"                    },
    { description: "Kale, chopped (several big handfuls)"   },
    { description: "~6oz of fresh mozarella"              },

  ]
)

pizza.steps.build(
  [
    { description: "Preheat oven to 375 degrees" },
    { description: "Heat olive oil over medium heat in a frying pan. Add onions and cook until just beginning to soften, about 5 minutes" },
    { description: "Form dough into pizza crust, using fingers to push up dough at ends for crust" },
    { description: "Add pizza sauce to dough, start at center and swirl outwards with a large spoon" },
    { description: "Top pizza with kale. Don't be stingy -- it'll cook down a little bit." },
    { description: "Pour sauteed onion over the top of the kale" },
    { description: "Take block of fresh mozarella and grate or crumble. Add over top of kale/onions" },
    { description: "Put pizza in oven, cook about 10~15 minutes, until crust is golden brown." }
  ]
)

pizza.save

# Recipe 4
sprouts = Recipe.new(
  name: "Braised Brussels Sprouts",
  category: "Appetizer",
  author_id: guest.id,
  title_photo: File.open("app/assets/images/coq_au_vin.jpg"),

  note: Note.new(description: "Bushwick next level Shoreditch, ethical normcore sartorial Vice Tonx meh keytar twee ethnic stumptown Odd Future gastropub. McSweeney's Neutra letterpress, organic 8-bit small batch Shoreditch. Tote bag vegan messenger bag American Apparel, craft beer synth Etsy viral. DIY YOLO chillwave selfies Marfa butcher. Occupy disrupt selvage ethnic squid sartorial. Mixtape ennui art party, mumblecore Thundercats gluten-free gastropub locavore post-ironic Schlitz gentrify. American Apparel gastropub yr, ennui McSweeney's hashtag farm-to-table polaroid asymmetrical hoodie Vice."),

  info: Info.new(cook_time: "2 hours", prep_time: "2 hours")
)

sprouts.ingredients.build(
  [
    { description: "1 lb brussels sprouts, halved"   },
    { description: "1 cup of heavy cream"             },
    { description: "1 tbsp butter"    },
    { description: "Juice from 1/4 of lemon"},
    { description: "Salt and pepper, to taste"},
  ]
)

sprouts.steps.build(
  [
    { description: "Prepare brussels sprouts by peeling off the outer layers (if from a stalk) and cutting in half" },
    { description: "Heat oil in a pot over medium heat. Add halved sprouts and sautee until beginning to brown, about 7 minutes" },
    { description: "Add heavy cream to pot, bring to boil and then reduce to a simmer. Cover, and cook for about 30 minutes, until brussels sprouts are fork tender" },
    { description: "Give 1/4 lemon a good squeeze, adding juice to the pot. Stir, and season with salt and pepper." },
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

  note: Note.new(description: "Truffle salt is expensive (trust me, you'll get sticker shock buying it for the first time), but you use so little of it at a time that a small container can easily last a year and it makes everything DELICIOUS. Even ice cream, which is the idea behind this recipe. Inspired by Umami Burger."),

  info: Info.new(cook_time: "2 hours", prep_time: "2 hours")
)

icecream.ingredients.build(
  [
    { description: "Chocolate Ice Cream"   },
    { description: "Chocolate Syrup"             },
    { description: "One pinch of truffle salt"    },
  ]
)

icecream.steps.build(
  [
    { description: "Scoop out ice cream" },
    { description: "Take pinch of truffle salt and sprinkle over ice cream" },
    { description: "Add chocolate syrup. Yum!" }
  ]
)

icecream.save
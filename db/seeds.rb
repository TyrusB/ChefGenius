guest = User.create!(email: "guest@chef-genius.com", password: "password")
ty = User.create!(email: "ty@chef-genius.com", password: "zazupassword")
ty2 = User.create!(email: "zazu@chef-genius.com", password: "typassword")
ashley = User.create!(email: "ashley@chef-genius.com", password: "ashleypassword")

# Recipe 1
spag_bol = Recipe.new(
  name: "Spaghetti Bolognese",
  category: "Main Course",
  title_photo: File.open("public/images/spag_bol.jpg"),

  note: Note.new(description: "This is a delicious meat-based sauce for pasta based on a traditional italian recipe. To get the full flavor, it's best to let the sauce simmer for the full 4 hours. Use red wine if you've got time, otherwise go for white wine. There's no need to add any additional seasonings to this recipe -- salt and pepper are all you need in addition to the flavor of the meat."),

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
    { description: "Cover pot halfway and cook from 1.5 - 4 hours (the longer the better). The sauce is done once the consistency is thick, like oatmeal." },
    { description: "Scoop out the chopped carrots, onions, and celery, and run through a food processor to thicken the sauce. Optionally, you can just dice the ingredients very thin in the beginning instead." }
  ]
)

spag_bol.save

# Recipe 2
coq = Recipe.new(
  name: "Coq Au Vin",
  category: "Main Course",
  author_id: ty.id,
  title_photo: File.open("public/images/coq_au_vin.jpg"),

  note: Note.new(description: "This is a traditional French country dish that's a great way to impress anyone you're having over. It takes a long time, both to prepare and took cook, but if you're going for fancy, hearty, and tasty, Coq Au Vin can't be beat. Traditionally, this recipe calls for a an old rooster to be used, but any roasting chicken that's around 5 pounds or so should do."),

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
  title_photo: File.open("public/images/kale_pizza.jpg"),

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
  title_photo: File.open("public/images/braised_sprouts.jpg"),

  note: Note.new(description: "You probably never thought Brussels Sprouts could be this good. This is a great way of introducing children or other picky eaters to the joys of brussels sprouts. It uses a ton of cream and butter, so it's not exactly healthy, but it's a nice, delicious treat and a great way to occasionally eat your veggies."),

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
  title_photo: File.open("public/images/asparagus.jpg"),

  note: Note.new(description: "This is a nice simple side dish you can make when you're firing up the grill to cook steaks or burgers. Don't be afraid to get the asparagus nice and caramelized!"),

  info: Info.new(cook_time: "10 minutes", prep_time: "10 minutes")
)

asparagus.ingredients.build(
  [
    { description: "1 lb asparagus"   },
    { description: "olive oil"             },
    { description: "salt and pepper,to taste"    },
    { description: "juice of a lemon"}
  ]
)

asparagus.steps.build(
  [
    { description: "Trim the thickest portion of the asparagus with a potato peeler" },
    { description: "Place asparagus in a container. Cover with oil. Sprinkle with salt and pepper. Splash lemon juice on top." },
    { description: "Place asparagus onto the grill, allow to cook until soft and brown on all sides. Flip over halfway through cooking." }
  ]
)

asparagus.save

# Recipe 6
icecream = Recipe.new(
  name: "Truffle Salt Ice Cream",
  category: "Dessert",
  author_id: ty.id,
  title_photo: File.open("public/images/ice_cream.jpg"),

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


annotations_json =
[
  "{\"id\":1,\"content\":\"# My favorite wine to use\\r\\n\\r![http://2.bp.blogspot.com/-LtvdTm2DV4g/UlS8W5DmvBI/AAAAAAAAKbs/H5kiQhCi9PU/s400/2012-Grifone-Primitivo.jpg](http://2.bp.blogspot.com/-LtvdTm2DV4g/UlS8W5DmvBI/AAAAAAAAKbs/H5kiQhCi9PU/s400/2012-Grifone-Primitivo.jpg)\\r\\n\\r\\nIt's only $4 at Trader Joe's!\",\"annotatable_id\":1,\"annotatable_type\":\"Note\",\"created_at\":\"2014-04-13T01:04:59.206Z\",\"updated_at\":\"2014-04-13T01:04:59.206Z\",\"start_pos\":173,\"end_pos\":181,\"author_id\":2}",
  "{\"id\":2,\"content\":\"![small carrots](https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTMxy2WwESeKM4qdR3AtVTXB3utyn3UlmVQr0xNwy9q0svTYOpP)\\r\\n\\r\\nThese are what I'd call small carrots. Large ones are more along the lines of the really huge ones you'll find at farmers' markets sometimes.\",\"annotatable_id\":3,\"annotatable_type\":\"Ingredient\",\"created_at\":\"2014-04-13T01:10:37.119Z\",\"updated_at\":\"2014-04-13T01:10:37.119Z\",\"start_pos\":0,\"end_pos\":26,\"author_id\":2}",
  "{\"id\":3,\"content\":\"## Substitutes\\r\\n\\r\\nYou can substitute chicken or even vegetable broth if you'd like, but you'll get the most flavor out of beef broth (especially since it's a beef-based sauce).\",\"annotatable_id\":8,\"annotatable_type\":\"Ingredient\",\"created_at\":\"2014-04-13T01:11:54.490Z\",\"updated_at\":\"2014-04-13T01:11:54.490Z\",\"start_pos\":9,\"end_pos\":19,\"author_id\":2}",
  "{\"id\":4,\"content\":\"And if you ever visit Umami burger, make sure you try \\r\\n\\r\\n**One of these!** before you get the truffle ice cream! \\r\\n\\r![http://aht.seriouseats.com/images/2011/10/20111021-umami-burger.jpg](http://aht.seriouseats.com/images/2011/10/20111021-umami-burger.jpg)\",\"annotatable_id\":6,\"annotatable_type\":\"Note\",\"created_at\":\"2014-04-13T01:17:04.192Z\",\"updated_at\":\"2014-04-13T01:17:04.192Z\",\"start_pos\":281,\"end_pos\":293,\"author_id\":4}",
  "{\"id\":5,\"content\":\"## Fun Facts\\r\\n\\r\\n+ The combination of sauteed celery, onions, and carrots is called mirepoix in french cooking.\\r\\n+ There are many other combinations of veggies ('aromatics') sauteed as the first steps of a braise, stew, or sauce. Sofrito is an Italian example, and the 'holy trinity' of bell peppers, onions, and celery is a common cajun version.\",\"annotatable_id\":2,\"annotatable_type\":\"Step\",\"created_at\":\"2014-04-13T01:19:04.861Z\",\"updated_at\":\"2014-04-13T01:19:04.861Z\",\"start_pos\":8,\"end_pos\":43,\"author_id\":2}",
  "{\"id\":6,\"content\":\"## Note to new Chefs\\r\\n\\r\\nDon't be afraid if you get some brown buildup on the bottom of your pan. It's called 'fond' in french cooking, and is an important source of flavor for your sauce. \\r\\n\\r\\nYou don't want your beef to char or get tooburnt, but if your pan looks like the picture below you should be fine.\\r\\n\\r\\n### Ideal fond:\\r\\n\\r![http://b.vimeocdn.com/ts/340/314/340314699_640.jpg](http://b.vimeocdn.com/ts/340/314/340314699_640.jpg)\",\"annotatable_id\":3,\"annotatable_type\":\"Step\",\"created_at\":\"2014-04-13T01:23:59.468Z\",\"updated_at\":\"2014-04-13T01:23:59.468Z\",\"start_pos\":162,\"end_pos\":185,\"author_id\":2}",
  "{\"id\":7,\"content\":\"_The only ice cream worthy of the salt..._\\r\\n\\r![http://strausfamilycreamery.com/images/uploads/products/organic-chocolate-ice-cream.png](http://strausfamilycreamery.com/images/uploads/products/organic-chocolate-ice-cream.png)\",\"annotatable_id\":36,\"annotatable_type\":\"Ingredient\",\"created_at\":\"2014-04-13T01:24:58.868Z\",\"updated_at\":\"2014-04-13T01:24:58.868Z\",\"start_pos\":0,\"end_pos\":19,\"author_id\":4}",
  "{\"id\":9,\"content\":\"And not only that, tradition calls for the use of _rooster blood_ to thicken the sauce at the end. \\r\\n\\r\\nSounds gross, but many French chefs swear by it. \\r\\n\\r![http://www.netanimations.net/rooster_doing_crazy_dance.gif](http://www.netanimations.net/rooster_doing_crazy_dance.gif)\\r\\n\\r\\n\",\"annotatable_id\":2,\"annotatable_type\":\"Note\",\"created_at\":\"2014-04-13T01:31:28.525Z\",\"updated_at\":\"2014-04-13T01:31:28.525Z\",\"start_pos\":231,\"end_pos\":295,\"author_id\":2}",
  "{\"id\":10,\"content\":\"#Shake it like a salt shaker!#\\r\\n\\r![http://37.media.tumblr.com/9c9f9cac488e4e38211c99ece43739f0/tumblr_mw9nkj6dFm1r0shcco2_400.gif](http://37.media.tumblr.com/9c9f9cac488e4e38211c99ece43739f0/tumblr_mw9nkj6dFm1r0shcco2_400.gif)\",\"annotatable_id\":32,\"annotatable_type\":\"Step\",\"created_at\":\"2014-04-13T01:36:52.887Z\",\"updated_at\":\"2014-04-13T01:36:52.887Z\",\"start_pos\":0,\"end_pos\":40,\"author_id\":4}",
  "{\"id\":11,\"content\":\"\\r![http://www.gurl.com/wp-content/uploads/2013/03/tumblr_inline_mi1rx3HkS71qz4rgp.gif](http://www.gurl.com/wp-content/uploads/2013/03/tumblr_inline_mi1rx3HkS71qz4rgp.gif)\\r\\n\\r\\n##Just my average Friday night##\",\"annotatable_id\":33,\"annotatable_type\":\"Step\",\"created_at\":\"2014-04-13T01:39:12.097Z\",\"updated_at\":\"2014-04-13T01:39:12.097Z\",\"start_pos\":21,\"end_pos\":24,\"author_id\":4}",
  "{\"id\":12,\"content\":\"_I actually just cut off the bottom couple inches, where the ends are more coarse_ \\r\\n\\r\\n\\r![http://media.giphy.com/media/btBp3uTQci7uM/giphy.gif](http://media.giphy.com/media/btBp3uTQci7uM/giphy.gif)\\r\\n\\r\\nNot unlike this man. \",\"annotatable_id\":28,\"annotatable_type\":\"Step\",\"created_at\":\"2014-04-13T01:43:25.352Z\",\"updated_at\":\"2014-04-13T01:43:25.352Z\",\"start_pos\":0,\"end_pos\":4,\"author_id\":4}",
  "{\"id\":13,\"content\":\"Here's a pretty informative link about the difference between different types of chickens you can buy. \\r\\n\\r[http://www.thekitchn.com/broiler-fryer-and-roasters-wha-47323](http://www.thekitchn.com/broiler-fryer-and-roasters-wha-47323)\\r\\n\\r\\nI usually go with a Trader Joe's brand chicken, organic is much more expensive, but if you're making a fancy meal for comapny anyways, might as well spring for the better quality meat.\\r\\n\\r![http://www.traderjoes.com/images/fearless-flyer/uploads/article-1310/organic-whole-chicken450.png](http://www.traderjoes.com/images/fearless-flyer/uploads/article-1310/organic-whole-chicken450.png)\\r\\n\\r\\n\",\"annotatable_id\":10,\"annotatable_type\":\"Ingredient\",\"created_at\":\"2014-04-13T01:44:16.049Z\",\"updated_at\":\"2014-04-13T01:44:16.049Z\",\"start_pos\":0,\"end_pos\":23,\"author_id\":2}",
  "{\"id\":15,\"content\":\"## Don't be shy with the seasonings!\\r\\n\\r\\nThe rule of thumb I've heard is use **five times** as much salt as you think seems reasonable. When diluted across the entire dish, it's really not as much asyou'd think (especially compared to the amount of salt in, say, McDonald's fries).\",\"annotatable_id\":9,\"annotatable_type\":\"Step\",\"created_at\":\"2014-04-13T01:48:25.411Z\",\"updated_at\":\"2014-04-13T01:48:25.411Z\",\"start_pos\":0,\"end_pos\":40,\"author_id\":2}",
  "{\"id\":18,\"content\":\"![http://media.giphy.com/media/cFDdEQMGh6UDe/giphy.gif](http://media.giphy.com/media/cFDdEQMGh6UDe/giphy.gif)\\r\\n\\r\\n**When life gives you lemons, make grilled asparagus**\",\"annotatable_id\":35,\"annotatable_type\":\"Ingredient\",\"created_at\":\"2014-04-13T01:55:45.779Z\",\"updated_at\":\"2014-04-13T01:55:45.779Z\",\"start_pos\":0,\"end_pos\":18,\"author_id\":4}",
  "{\"id\":19,\"content\":\"### Preparing Pearl Onions\\r\\n\\r\\n![Pearl Onions](http://www.google.com/url?sa=i\\u0026source=images\\u0026cd=\\u0026cad=rja\\u0026uact=8\\u0026docid=xXMhsPB4SNBdaM\\u0026tbnid=tSGLGFhTBwdgbM:\\u0026ved=0CAgQjRw\\u0026url[=http%3A%2F%2Fsimmerandboil.cookinglight.com%2F2009%2F04%2F08%2Fkitchen-tip-pearl-onions%2F\\u0026ei=zu1JU_3tOuS08AG8jIGADQ\\u0026psig=AFQjCNFcpSGDVbXjgu-kykdFAfe9ESwX2Q\\u0026ust=1397440335100087)](=http%3A%2F%2Fsimmerandboil.cookinglight.com%2F2009%2F04%2F08%2Fkitchen-tip-pearl-onions%2F\\u0026ei=zu1JU_3tOuS08AG8jIGADQ\\u0026psig=AFQjCNFcpSGDVbXjgu-kykdFAfe9ESwX2Q\\u0026ust=1397440335100087))\\r\\n\\r\\nThe quickest way of peeling and preparing pearl onions (since they're so small, it can be a pain to peelall of them), is to blanch them in boiling water for a couple of minutes. Rinse them in cold water to keep them from cooking any further, and then snip the ends of the onions. At that point you can just pop them out of their skins!\",\"annotatable_id\":13,\"annotatable_type\":\"Step\",\"created_at\":\"2014-04-13T01:55:55.546Z\",\"updated_at\":\"2014-04-13T01:55:55.546Z\",\"start_pos\":25,\"end_pos\":58,\"author_id\":2}",
  "{\"id\":20,\"content\":\"**And if you're going all out, a little crispy bacon crumbled on top is pretty amazing, too**\\r\\n\\r![http://rob.webstarcontent.netdna-cdn.com/wp-content/uploads/baconlove.gif](http://rob.webstarcontent.netdna-cdn.com/wp-content/uploads/baconlove.gif)\",\"annotatable_id\":4,\"annotatable_type\":\"Note\",\"created_at\":\"2014-04-13T02:01:12.196Z\",\"updated_at\":\"2014-04-13T02:01:12.196Z\",\"start_pos\":209,\"end_pos\":228,\"author_id\":4}",
  "{\"id\":21,\"content\":\"_I cut mine into quarters, I foundthey cooked faster that way_\",\"annotatable_id\":24,\"annotatable_type\":\"Step\",\"created_at\":\"2014-04-13T02:02:41.798Z\",\"updated_at\":\"2014-04-13T02:02:41.798Z\",\"start_pos\":79,\"end_pos\":94,\"author_id\":4}",
  "{\"id\":22,\"content\":\"This made me super nervous at first too, but it was delicious! \\r\\n\\r![http://media.giphy.com/media/dN1s2fw1mPd6M/giphy.gif](http://media.giphy.com/media/dN1s2fw1mPd6M/giphy.gif)\",\"annotatable_id\":30,\"annotatable_type\":\"Ingredient\",\"created_at\":\"2014-04-13T02:07:35.044Z\",\"updated_at\":\"2014-04-13T02:07:35.044Z\",\"start_pos\":0,\"end_pos\":24,\"author_id\":4}",
  "{\"id\":25,\"content\":\"![http://media.giphy.com/media/36in05WSMy7vO/giphy.gif](http://media.giphy.com/media/36in05WSMy7vO/giphy.gif)\\r\\n\\r\\n#Carpe Asparagus!#\",\"annotatable_id\":5,\"annotatable_type\":\"Note\",\"created_at\":\"2014-04-13T02:33:56.337Z\",\"updated_at\":\"2014-04-13T02:33:56.337Z\",\"start_pos\":107,\"end_pos\":122,\"author_id\":4}",
  "{\"id\":26,\"content\":\"_Use oil wisely_\\r\\n\\r![http://media.giphy.com/media/83sgz4h5E9iN2/giphy.gif](http://media.giphy.com/media/83sgz4h5E9iN2/giphy.gif)\",\"annotatable_id\":29,\"annotatable_type\":\"Step\",\"created_at\":\"2014-04-13T02:36:30.794Z\",\"updated_at\":\"2014-04-13T02:36:30.794Z\",\"start_pos\":32,\"end_pos\":46,\"author_id\":4}",
  "{\"id\":27,\"content\":\"_Try to leave space in between the pieces so that you can just roll them with a fork. Flipping asparagus is surprisingly difficult and you wouldn't want to lose them to the coals below_\\r\\n\\r![http://media.giphy.com/media/5Dv11s9dcqYuY/giphy.gif](http://media.giphy.com/media/5Dv11s9dcqYuY/giphy.gif)\",\"annotatable_id\":30,\"annotatable_type\":\"Step\",\"created_at\":\"2014-04-13T02:39:10.709Z\",\"updated_at\":\"2014-04-13T02:39:10.709Z\",\"start_pos\":81,\"end_pos\":85,\"author_id\":4}",
  "{\"id\":28,\"content\":\"_I like mine a little extra crispy!_\\r\\n\\r![http://2.bp.blogspot.com/_7xr0Kr1DDH0/SdkHsjeYx3I/AAAAAAAACd4/VZ3jX5wLuq0/s320/276_7682.jpg](http://2.bp.blogspot.com/_7xr0Kr1DDH0/SdkHsjeYx3I/AAAAAAAACd4/VZ3jX5wLuq0/s320/276_7682.jpg)\",\"annotatable_id\":30,\"annotatable_type\":\"Step\",\"created_at\":\"2014-04-13T02:41:23.323Z\",\"updated_at\":\"2014-04-13T02:41:23.323Z\",\"start_pos\":51,\"end_pos\":79,\"author_id\":4}",
  "{\"id\":32,\"content\":\"#STALKS!!???!!#\\r\\n\\r![http://media2.giphy.com/media/SVL5Dws0bOSgE/giphy.gif](http://media2.giphy.com/media/SVL5Dws0bOSgE/giphy.gif)\\r\\n\\r\\n\\r\\n\\r\\n\\r\\nExample A: \\r![http://4.bp.blogspot.com/_a5BSlk38hqA/TSHSIzMkAkI/AAAAAAAAAOo/4P2RJtA4TSM/s1600/brussels-sprouts.jpg](http://4.bp.blogspot.com/_a5BSlk38hqA/TSHSIzMkAkI/AAAAAAAAAOo/4P2RJtA4TSM/s1600/brussels-sprouts.jpg)\\r\\n\\r\\nExample B: \\r![http://2.bp.blogspot.com/_a5BSlk38hqA/TSHSV0sOK4I/AAAAAAAAAOs/vhj4VW60oBE/s640/IMG_0701.JPG](http://2.bp.blogspot.com/_a5BSlk38hqA/TSHSV0sOK4I/AAAAAAAAAOs/vhj4VW60oBE/s640/IMG_0701.JPG)\\r\\n\\r\\n#**NOW YOU KNOW**#\",\"annotatable_id\":24,\"annotatable_type\":\"Step\",\"created_at\":\"2014-04-13T02:48:14.070Z\",\"updated_at\":\"2014-04-13T02:48:14.070Z\",\"start_pos\":56,\"end_pos\":75,\"author_id\":4}",
  "{\"id\":33,\"content\":\"_I've used a cheese blend from TJ's and it workedwell. I bet some salty feta would be good, too!_\",\"annotatable_id\":26,\"annotatable_type\":\"Ingredient\",\"created_at\":\"2014-04-13T02:55:55.966Z\",\"updated_at\":\"2014-04-13T02:55:55.966Z\",\"start_pos\":8,\"end_pos\":24,\"author_id\":4}",
  "{\"id\":34,\"content\":\"_If you want to keep this recipe super simple and easy, it tastes just as good withoutall the work of cutting and cooking an onion_ \\r\\n\\r![http://www.currypowders.org/images/no-onion-no-garlic.png](http://www.currypowders.org/images/no-onion-no-garlic.png)\",\"annotatable_id\":22,\"annotatable_type\":\"Ingredient\",\"created_at\":\"2014-04-13T02:59:10.794Z\",\"updated_at\":\"2014-04-13T02:59:10.794Z\",\"start_pos\":9,\"end_pos\":16,\"author_id\":4}",
  "{\"id\":35,\"content\":\"When I don't have any on hand and I'm craving pizza, I'll use the recipe below and make my own dough. It's pretty easy! \\r\\n\\r[http://allrecipes.com/Recipe/Quick-and-Easy-Pizza-Crust/](http://allrecipes.com/Recipe/Quick-and-Easy-Pizza-Crust/)\\r\\n\\r![http://gifrific.com/wp-content/uploads/2012/07/Emma-Stone-Saying-Yum.gif](http://gifrific.com/wp-content/uploads/2012/07/Emma-Stone-Saying-Yum.gif)\",\"annotatable_id\":23,\"annotatable_type\":\"Ingredient\",\"created_at\":\"2014-04-13T03:01:49.587Z\",\"updated_at\":\"2014-04-13T03:01:49.587Z\",\"start_pos\":8,\"end_pos\":19,\"author_id\":4}",
  "{\"id\":36,\"content\":\"+ Use a pizza stone if you have one\\r\\n+  Sprinklea little cornmeal on the stone before you put the dough on. It helps keep it from burning and gives the crust a nice crunch!\\r\\n+ If you don't have a pizza stone, you should really consider buying one. _Other uses: Cookies, biscuits, more pizza, french fries..._\",\"annotatable_id\":18,\"annotatable_type\":\"Step\",\"created_at\":\"2014-04-13T03:10:17.392Z\",\"updated_at\":\"2014-04-13T03:10:17.392Z\",\"start_pos\":0,\"end_pos\":27,\"author_id\":4}",
  "{\"id\":37,\"content\":\"_I like to rub a little olive oil all over the crust before adding sauce, it makes everything crispy after cooking!_\",\"annotatable_id\":19,\"annotatable_type\":\"Step\",\"created_at\":\"2014-04-13T03:11:36.509Z\",\"updated_at\":\"2014-04-13T03:11:36.509Z\",\"start_pos\":0,\"end_pos\":24,\"author_id\":4}",
  "{\"id\":38,\"content\":\"And that cheese is bubbling! \\r\\n\\r![http://31.media.tumblr.com/2ac9cc333ba6acb6a8bba2e0d5add423/tumblr_mom5496ZVF1rnfku4o1_500.gif](http://31.media.tumblr.com/2ac9cc333ba6acb6a8bba2e0d5add423/tumblr_mom5496ZVF1rnfku4o1_500.gif)\",\"annotatable_id\":23,\"annotatable_type\":\"Step\",\"created_at\":\"2014-04-13T03:15:04.479Z\",\"updated_at\":\"2014-04-13T03:15:04.479Z\",\"start_pos\":45,\"end_pos\":72,\"author_id\":4}",
  "{\"id\":39,\"content\":\"![http://rack.3.mshcdn.com/media/ZgkyMDEzLzA0LzEyLzhjL0dyaWxsZWRDaGVlLjdjMDFjLmdpZgpwCXRodW1iCTEyMDB4OTYwMD4/d495d943/d17/Grilled-Cheese-GIF-6.gif](http://rack.3.mshcdn.com/media/ZgkyMDEzLzA0LzEyLzhjL0dyaWxsZWRDaGVlLjdjMDFjLmdpZgpwCXRodW1iCTEyMDB4OTYwMD4/d495d943/d17/Grilled-Cheese-GIF-6.gif)\\r\\n\\r\\nA life without cheese.... _well that's absurd._\",\"annotatable_id\":3,\"annotatable_type\":\"Note\",\"created_at\":\"2014-04-13T03:16:19.631Z\",\"updated_at\":\"2014-04-13T03:16:19.631Z\",\"start_pos\":106,\"end_pos\":133,\"author_id\":4}",
  "{\"id\":40,\"content\":\"![http://media0.giphy.com/media/vO8F4fYQd39h6/giphy.gif](http://media0.giphy.com/media/vO8F4fYQd39h6/giphy.gif)\\r\\n\\r\\nYour children after this divine treat.\\r\\n\",\"annotatable_id\":4,\"annotatable_type\":\"Note\",\"created_at\":\"2014-04-13T03:20:32.890Z\",\"updated_at\":\"2014-04-13T03:20:32.890Z\",\"start_pos\":90,\"end_pos\":110,\"author_id\":4}"
]

annotations_json.each { |annotation| Annotation.create!(JSON.parse(annotation))}
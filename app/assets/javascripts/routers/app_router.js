window.ChefGenius.Routers.AppRouter = Backbone.Router.extend({
  initialize: function(options) {
    this.$rootEl = options.$rootEl;
    this.currentUser = options.currentUser;
    this.recipes = options.recipes;
  },

  routes: {
    "":"recipesIndex",
    "recipes":"recipesIndex",
    "recipes/new":"recipesNew",
    "recipes/:id":"recipeShow",
    "recipes/:id/edit":"recipesEdit",
    "recipes/type/:type":"recipesSubIndex"
  },

  recipesIndex: function() {
    var router = this;

    // Note, temporarily using non-bootstrapped data.
    this.recipes.fetch({
      success: function() {
        var index = new ChefGenius.Views.RecipesIndex({
          collection: router.recipes,
          description: "All"
        });

        router._swapView(index);
      }
    })

  },

  recipesSubIndex: function(type) {
    var router = this;

    this.recipes.fetch({ 
      success: function() {
        //formatting url-route
        var description = type.replace("-", " ").replace(/\b\w/g, function(letter) {
          return letter.toUpperCase();
        });

        var recipesOfType = router.recipes.where( { category: description } );
        var subCollection = new ChefGenius.Collections.Recipes(recipesOfType)

        var subIndex = new ChefGenius.Views.RecipesIndex({
          collection: subCollection,
          description: description
        });

        router._swapView(subIndex);
      }
    })
  },

  recipesEdit: function(id) {
    var view = this;
    this.recipes.getOrFetch(id, function(recipe) {
      var form = new ChefGenius.Views.RecipesForm({
        model: recipe
      });

      view._swapView(form);
    });
  },

  recipesNew: function() {
    var recipe = new ChefGenius.Models.Recipe();
    recipe.collection = this.recipes;

    var form = new ChefGenius.Views.RecipeNew({
      model: recipe
    });

    this._swapView(form);
  },

  recipeShow: function(id) {
    var view = this;
    this.recipes.getOrFetch(id, function(recipe) {
      var show = new ChefGenius.Views.RecipeShow({
        model: recipe,
        vent: vent
      });

      view._swapView(show);
    });

  },

  _swapView: function(view) {
    if (this.currentView) {
      this.currentView.remove();
    }

    this.currentView = view;
    this.$rootEl.html(view.render().$el);
  }


});
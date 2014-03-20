window.ChefGenius.Routers.AppRouter = Backbone.Router.extend({
  initialize: function(options) {
    this.$rootEl = options.$rootEl;
    this.currentUser = options.currentUser;
    this.recipes = options.recipes;
  },

  routes: {
    "":"recipesIndex",
    "recipes/new":"recipesNew",
    "recipes/:id":"recipeShow",
    "recipes/:id/edit":"recipesEdit"

  },

  recipesIndex: function() {
    var index = new ChefGenius.Views.RecipesIndex({
      collection: this.recipes
    });

    this._swapView(index);
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

    var form = new ChefGenius.Views.RecipesForm({
      model: recipe
    });

    this._swapView(form);
  },

  recipeShow: function(id) {
    var view = this;
    this.recipes.getOrFetch(id, function(recipe) {
      var show = new ChefGenius.Views.RecipeShow({
        model: recipe
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
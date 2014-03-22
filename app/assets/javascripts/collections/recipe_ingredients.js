window.ChefGenius.Collections.RecipeIngredients = Backbone.Collection.extend({
  model: ChefGenius.Models.Ingredient,

  initialize: function(models, options) {
    this.recipe = options.recipe;
  },

  url: function() {
    return "api/ingredients";
  }
});
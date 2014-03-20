window.ChefGenius.Collections.RecipeNeeds = Backbone.Collection.extend({
  model: ChefGenius.Models.Need,

  initialize: function(models, options) {
    this.recipe = options.recipe;
  },

  url: function() {
    return this.recipe.url() + "/needs";
  }
});
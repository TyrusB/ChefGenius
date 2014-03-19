window.ChefGenius.Collections.RecipeNeeds = Backbone.Collections.extend({
  model: ChefGenius.Models.Need,

  initialize: function(models, options) {
    this.recipe = options.recipe;
  },

  url: function() {
    return this.recipe.url() + "/needs";
  }
});
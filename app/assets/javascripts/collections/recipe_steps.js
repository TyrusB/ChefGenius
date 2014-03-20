window.ChefGenius.Collections.RecipeSteps = Backbone.Collection.extend({
  model: ChefGenius.Models.Step,

  initialize: function(models, options) {
    this.recipe = options.recipe;
  },

  url: function() {
    return this.recipe.url() + "/steps";
  }
});
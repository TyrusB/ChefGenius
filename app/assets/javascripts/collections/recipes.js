window.ChefGenius.Collections.Recipes = Backbone.Collections.extend({
  model: ChefGenius.Models.Recipe,

  url: "/api/recipes"
});
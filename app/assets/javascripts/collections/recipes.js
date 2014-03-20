window.ChefGenius.Collections.Recipes = Backbone.Collection.extend({
  model: ChefGenius.Models.Recipe,

  url: "/api/recipes"
});
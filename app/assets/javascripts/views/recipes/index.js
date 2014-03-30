window.ChefGenius.Views.RecipesIndex = Backbone.View.extend({
  template: JST["recipes/index"],

  initialize: function(options) {
    this.description = options.description
  },

  render: function() {
    var content = this.template({
      recipes: this.collection,
      description: this.description
    });

    this.$el.html(content);

    return this;
  }

});
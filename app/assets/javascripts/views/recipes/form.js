window.ChefGenius.Views.RecipesForm = Backbone.View.extend({
  tempate: JST["recipes/form"],

  render: function() {
    var content = this.template({
      recipe: this.model
    });

    this.$el.html(content);

    return this;
  }

});
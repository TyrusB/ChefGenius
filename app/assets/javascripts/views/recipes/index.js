window.ChefGenius.Views.RecipesIndex = Backbone.View.extend({
  template: JST["recipes/index"],

  render: function() {
    var content = this.template({
      recipes: this.collection
    });

    this.$el.html(content);

    return this;
  }

});
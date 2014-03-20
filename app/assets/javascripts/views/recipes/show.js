window.ChefGenius.Views.RecipesShow = Backbone.View.extend({
  tempate: JST["recipes/show"],

  render: function() {
    var content = this.template({
      recipe: this.model
    });

    this.$el.html(content);

    return this;
  }

});
window.ChefGenius.Views.RecipeShow = Backbone.View.extend({
  template: JST["recipes/show"],

  render: function() {

    var content = this.template({
      recipe: this.model
    });

    this.$el.html(content);

    return this;
  }

});
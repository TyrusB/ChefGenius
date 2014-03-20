window.ChefGenius.Views.RecipesForm = Backbone.CompositeView.extend({
  template: JST["recipes/form"],

  render: function() {
    var content = this.template({
      recipe: this.model
    });

    this.$el.html(content);

    return this;
  }

});
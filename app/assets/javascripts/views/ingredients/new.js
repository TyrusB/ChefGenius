window.ChefGenius.Views.IngredientNew = Backbone.View.extend({
  tagName: "li",

  template: JST["ingredients/new"],

  initialize: function(options) {
    this.number = options.number;
  },

  render: function() {
    var content = this.template({
      ingredient: this.model,
      number: this.number
    });

    this.$el.html(content);

    return this;
  }
});


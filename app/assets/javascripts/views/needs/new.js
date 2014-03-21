window.ChefGenius.Views.NeedNew = Backbone.View.extend({
  tagName: "li",

  template: JST["needs/new"],

  initialize: function(options) {
    this.number = options.number;
  },

  render: function() {
    var content = this.template({
      need: this.model,
      number: this.number
    });

    this.$el.html(content);

    return this;
  }
});


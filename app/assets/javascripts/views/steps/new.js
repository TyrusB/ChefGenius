window.ChefGenius.Views.StepNew = Backbone.View.extend({
  tagName: "li",

  template: JST["steps/new"],

  initialize: function(options) {
    this.number = options.number;
  },

  render: function() {
    var content = this.template({
      step: this.model,
      number: this.number
    });

    this.$el.html(content);

    return this;
  }
});


window.ChefGenius.Views.SuggestionShow = Backbone.View.extend({
  template: JST["suggestions/show"],

  className: "comment-container",

  initialize: function(options) {
    this.vent = options.vent
  },

  render: function() {
    var content = this.template({
      suggestion: this.model,
    });

    this.$el.html(content);
    return this;
  },

})
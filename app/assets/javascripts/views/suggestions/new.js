window.ChefGenius.Views.SuggestionNew = Backbone.View.extend({
  template: JST["suggestions/new"],


  initialize: function(options) {
    this.annotation = options.annotation;
    this.vent = options.vent;
  },

  render: function() {
    var content = this.template({
      suggestion: this.model,
      annotation: this.annotation
    });

    this.$el.html(content);
    return this;
  },

})

//needs vent and suggestion
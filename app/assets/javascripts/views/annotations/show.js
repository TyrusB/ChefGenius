window.ChefGenius.Views.AnnotationShow = Backbone.View.extend({
  template: JST["annotations/show"],

  events: {
  },

  initialize: function(options) {
    this.vent = options.vent
  },

  render: function() {
    var content = this.template({
      annotation: this.model
    });

    this.$el.html(content);
    return this;
  },

})
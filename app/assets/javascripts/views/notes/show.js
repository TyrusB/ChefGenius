window.ChefGenius.Views.NoteShow = Backbone.AnnotatableView.extend({
  template: JST["notes/show"],

  initialize: function(options) {
    this.vent = options.vent
  },

  render: function() {
    var content = this.template({
      note: this.model
    });
    this.$el.html(content);
     this.addAnnotationSpans();
    return this;
  }
})
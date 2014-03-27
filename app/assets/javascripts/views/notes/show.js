window.ChefGenius.Views.NoteShow = Backbone.AnnotatableView.extend({
  template: JST["notes/show"],

  initialize: function(options) {
    this.vent = options.vent;
    Backbone.AnnotatableView.prototype.initialize.call(this);
  },

  events: function() {
    var theseEvents = {

    }
    protoEvents = Backbone.AnnotatableView.prototype.events;

    return _.extend(theseEvents, protoEvents);

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
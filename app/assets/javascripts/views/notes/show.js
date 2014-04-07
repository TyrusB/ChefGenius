window.ChefGenius.Views.NoteShow = Backbone.EditableAnnotatableView.extend({
  tagName: "div",

  className: function() {
    return "note " + _.result(Backbone.EditableAnnotatableView.prototype, "className");
  },

  attributes: function() { 
    return {
      //for polymorphic associations on Rails end
      "data-annotatable-id": this.model.id,
      "data-annotatable-type": 'Note'
    }
  },

  template: function() {
    return this.open ? JST['notes/edit'] : JST['notes/show'];
  },

  initialize: function(options) {
    this.vent = options.vent;

    Backbone.EditableAnnotatableView.prototype.initialize.call(this);
  },

  events: function() {
    var showEvents = {
      
    }
    protoEvents = _.result(Backbone.EditableAnnotatableView.prototype, "events");

    return _.extend(showEvents, protoEvents);
  },

  render: function() {
    var content = this.template()({
      note: this.model
    });

    this.$el.html(content);
  
    if (this.open === false) {
      this.addAnnotationSpans();
    }

    return this;
  },


});
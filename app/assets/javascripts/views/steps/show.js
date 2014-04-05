window.ChefGenius.Views.StepShow = Backbone.EditableAnnotatableView.extend({
  tagName: "li",

  className: function() {
    return "step " + _.result(Backbone.EditableAnnotatableView.prototype, "className");
  },

  attributes: function() { 
    return {
      //for polymorphic associations on Rails end
      "data-annotatable-id": this.model.id,
      "data-annotatable-type": 'Step'
    }
  },

  template: function() {
    return this.open ? JST['steps/edit'] : JST['steps/show'];
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
      step: this.model
    });

    this.$el.html(content);
  
    this.addAnnotationSpans();

    return this;
  },


});

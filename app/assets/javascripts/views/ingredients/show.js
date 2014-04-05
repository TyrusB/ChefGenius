// Info on classnames/attributes and how they work with annotations and edits
// editable, annotatable: classes that serve as permanent markers
// can-edit, can-annotate: classes that indicate the present state of the view. Will be one or another
// open : attribute that indicates whether or not the view should render
//        an edit view or a show view. Should only be true when can-edit is applied.

window.ChefGenius.Views.IngredientShow = Backbone.AnnotatableView.extend({
  tagName: "li",

  className: function() {
    return "ingredient " + _.result(Backbone.EditableAnnotatableView.prototype, "className");
  },

  attributes: function() { 
    return {
      //for polymorphic associations on Rails end
      "data-annotatable-id": this.model.id,
      "data-annotatable-type": 'Ingredient'
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

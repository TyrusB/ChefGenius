window.ChefGenius.Views.IngredientShow = Backbone.AnnotatableView.extend({
  tagName: "li",

  className: "ingredient",

  attributes: function() {
    return { "data-id": this.model.id }
  },

  template: function() {
    return this.open ? JST['ingredients/edit'] : JST['ingredients/show'];
  },

  initialize: function(options) {
    this.open = false;
    this.editable = false;
    this.vent = options.vent;

    Backbone.AnnotatableView.prototype.initialize.call(this);
  },

  events: function() {
    var theseEvents = {
      "click .editable-closed":"beginEditing",
      "submit form":"endEditing"
    }
    protoEvents = Backbone.AnnotatableView.prototype.events;

    return _.extend(theseEvents, protoEvents);

  },

  toggleOpen: function() {
    this.open = (this.open === false && this.editable === true) ? true : false;
  },

  makeEditable: function() {
    this.editable = true;
  },

  makeNotEditable: function() {
    this.editable = false;
  },

  render: function() {
    var content = this.template()({
      ingredient: this.model
    });

    this.$el.html(content);

    this.addAnnotationSpans();

    return this;
  },

  beginEditing: function() {
    if (this.editable) {
      this.open = true;
      this.render();
    }
  },

  endEditing: function(event) {
    event.preventDefault();
    var view = this;
    var info = this.$(event.currentTarget).serializeJSON();

    this.model.save(info, {
      success: function(response) {
        view.open = false;
        view.render();
        view.$('.editable').toggleClass('editable-closed');
      }
    });


  }

});

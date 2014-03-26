window.ChefGenius.Views.StepShow = Backbone.AnnotatableView.extend({
  tagName: "li",

  className: "step",

  attributes: function() {
    return { "data-id": this.model.id }
  },

  template: function() {
    return this.open ? JST['steps/edit'] : JST['steps/show'];
  },

  initialize: function(options) {
    this.open = false;
    this.editable = false;
    this.vent = options.vent;

    Backbone.AnnotatableView.prototype.initialize.call(this);
    this.listenTo(this.model.annotations(), "all", this.render);
  },

  events: {
    "click .editable-closed":"beginEditing",
    "submit form":"endEditing",
    // this should probably be in the superclass
    "mouseup .annotatable":"handleUserSelection",
  },

  toggleOpen: function() {
    this.open = (this.open == false && this.editable == true) ? true : false;
  },

  makeEditable: function() {
    this.editable = true;
  },

  makeNotEditable: function() {
    this.editable = false;
  },

  render: function() {
    var content = this.template()({
      step: this.model
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
        view.$('.editable').toggleClass('editable-closed')
      }
    });


  },



});

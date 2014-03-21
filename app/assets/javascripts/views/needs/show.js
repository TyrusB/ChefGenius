window.ChefGenius.Views.NeedShow = Backbone.View.extend({
  tagName: "li",

  className: "editable ingredient",

  attributes: function() {
    return { "data-id": this.model.id }
  },

  template: function() {
    return this.open ? JST['needs/edit'] : JST['needs/show'];
  },

  initialize: function(options) {
    this.open = false;
    this.editable = false;

    this.listenTo(this.model, "change", this.render);
  },

  events: {
    "click .test":"beginEditing",
    "submit form":"endEditing"
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
      need: this.model
    });

    this.$el.html(content);

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
      }
    });


  }

});

//1. add model into view 2. Trigger end of edit
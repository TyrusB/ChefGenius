// Info on classnames/attributes and how they work with annotations and edits
// editable, annotatable: classes that serve as permanent markers
// can-edit, can-annotate: classes that indicate the present state of the view
// open : attribute that indicates whether or not the view should render
//        an edit view or a show view.

window.ChefGenius.Views.IngredientShow = Backbone.AnnotatableView.extend({
  tagName: "li",

  // editable & annotatable are permanent markers, can-* indicates current state
  className: "ingredient editable annotatable can-annotate", //holds-annotations?

  attributes: function() {
    return  { 
              //for polymorphic associations on Rails end
              "data-annotatable-id": this.model.id,
              "data-annotatable-type": 'Ingredient'
            }
  },

  template: function() {
    return this.open ? JST['ingredients/edit'] : JST['ingredients/show'];
  },

  initialize: function(options) {
    this.vent = options.vent;

    this.lisenTo(this.vent, 'edit-button:clicked', this.closeEdit)

    Backbone.AnnotatableView.prototype.initialize.call(this);
  },

  render: function() {
    var content = this.template()({
      ingredient: this.model
    });

    this.$el.html(content);
  
    this.addAnnotationSpans();

    return this;
  },

  events: function() {
    var theseEvents = {
      "click":"handleClick",
      "submit form":"submitChanges"
    }
    protoEvents = Backbone.AnnotatableView.prototype.events;

    return _.extend(theseEvents, protoEvents);

  },

  closeEdit: function() {
    if (this.open === true) {
      this.open = false;
      this.render();
    }
  },

  handleClick: function() {
    if ( this.open === false && this.$el.hasClass('can-edit') ) {
      this.open = true;
      this.render();
    }
  },

  // toggleOpen: function() {
  //   this.open = (this.open === false && this.editable === true) ? true : false;
  // },

  beginEditing: function() {
    if (this.editable) {
      this.open = true;
      this.render();
    }
  },

  submitChanges: function(event) {
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

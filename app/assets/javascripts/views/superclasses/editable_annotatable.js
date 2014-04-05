Backbone.EditableAnnotatableView = Backbone.AnnotatableView.extend({
  className: function() {
    // use result for extensibility, in case annotatable's className is a function
    return "editable " + _.result(Backbone.AnnotatableView.prototype, "className")
  }, 

  events: function() {
    var editEvents = {
      "click":"handleClick",
      "submit form":"submitChanges"
    }

    return _.extend(editEvents, _.result(Backbone.AnnotatableView.prototype, "events"));
  },

  initialize: function() {
    this.open = false;
    
    this.listenTo(this.vent, 'edit-button:clicked', this.closeEdit)

    Backbone.AnnotatableView.prototype.initialize.call(this);
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
})
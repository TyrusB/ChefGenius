Backbone.EditableView = Backbone.View.Extend({
  tagName: "li",

  // editable & annotatable are permanent markers, can-* indicates current state
  className: "editable", //holds-annotations?

  attributes: function() {
    return  { 
              //for polymorphic associations on Rails end
              "data-annotatable-id": this.model.id,
              "data-annotatable-type": 'Ingredient'
            }
  },

  events: {
    "click":"handleClick",
    "submit form":"submitChanges"
  },

  initialize: function() {
    this.open = false;
    
    this.listenTo(this.vent, 'edit-button:clicked', this.closeEdit)
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
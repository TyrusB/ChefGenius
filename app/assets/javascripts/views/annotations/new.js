window.ChefGenius.Views.AnnotationNew = Backbone.View.extend({
  template: JST["annotations/new"],

  events: {
    "click .annotation-save":"saveAnnotation"
  },

  initialize: function(options) {
    this.vent = options.vent
  },

  render: function() {
    var content = this.template({
      recipe: this.model
    });

    this.$el.html(content);
    return this;
  },

  saveAnnotation: function() {
    var view = this;

    var formData = this.$('form').serializeJSON();
    //kind of hacky
    var attrs = {
      content: formData.content,
      start_pos: this.model.get('start_pos'),
      end_pos: this.model.get('end_pos'),
      annotatable_id: this.model.get('annotatable_id'),
      annotatable_type: this.model.get('annotatable_type')
    }

    this.model.save({
      annotations: attrs
    }, {
      success: function(model) {
        model.collection.add(model);
        view.vent.trigger("annotation:saved", view);
      }
    })
  }
})
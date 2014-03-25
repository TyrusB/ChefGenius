window.ChefGenius.Views.AnnotationNew = Backbone.View.extend({
  template: JST["annotations/new"],

  events: {
    "click .annotation-save":"saveAnnotation"
  },

  initialize: function(options) {
    this.startPos = options.startPos;
    this.endPos = options.endPos;
    this.annotatableId = options.annotatableId;
    this.annotatableType = options.annotatableType;
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
    var content = this.$('form').serializeJSON()["content"];
    var annotation = new ChefGenius.Models.Annotation;
    annotation.save({
      annotations: {
        content: content,
        annotatable_id: this.annotatableId,
        annotatable_type: this.annotatableType,
        start_pos: this.startPos,
        end_pos: this.endPos
      }
    },
    {
      success: function(model) {
        view.leave();
        alert("form saved successfully!");
      }
    })
  }
})

//todo:
// add model to collection
// alerts
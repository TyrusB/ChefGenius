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

    var content = formData.content;

    var content = content.replace(/([^\[\/\(]|^)(http|www).+\..+/g, function(link) {
      link = link.replace(/\s/, "");
      // if link is an image
      if (/http.+\.(jpeg|jpg|gif|png)/.test(link)) {
        return "![" + link + "]("+ link + ")";
      // if not, it's a link, test whether it needs to be prepended with http:// or not
      } else if (/^www.+/.test(link)) {
        return "[" + link + "](http://" + link + ")";
      } else {
        return "[" + link + "](" + link + ")";
      }
    })
    

    // var content = preformatted.replace(/http.+\.(jpeg|jpg|gif|png)/, function(link) {
    //   return "![link to " + link + "]("+ link + ")"
    // });
    
    var attrs = {
      content: content,
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
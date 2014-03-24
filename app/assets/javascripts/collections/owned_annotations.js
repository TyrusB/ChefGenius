window.Backbone.Collections.OwnedAnnotations = Backbone.Collections.extend({
  model: ChefGenius.Models.Annotation,

  initialize: function(models, options) {
    this.owner = options.owner
  },

  url: function() {
    return "api/annotations";
  }

})
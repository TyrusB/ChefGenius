window.ChefGenius.Collections.OwnedAnnotations = Backbone.Collection.extend({
  model: ChefGenius.Models.Annotation,

  initialize: function(models, options) {
    this.owner = options.owner
  },

  url: function() {
    return "api/annotations";
  }

})
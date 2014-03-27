window.ChefGenius.Collections.AnnotationSuggestions = Backbone.Collection.extend({
  model: ChefGenius.Models.Suggestion,

  initialize: function(models, options) {
    this.annotation = options.annotation
  },

  url: function() {
    return "api/suggestions";
  },

  comparator: function(suggestion) {
    return suggestion.get("created_at");
  }

})
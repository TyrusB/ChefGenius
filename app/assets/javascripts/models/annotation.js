window.ChefGenius.Models.Annotation = Backbone.Model.extend({
  urlRoot: "/api/annotations",

  suggestions: function() {
    if (!this._suggestions) {
      this._suggestions = new ChefGenius.Collections.AnnotationSuggestions([], {
        annotation: this
      });
    }

    return this._suggestions;
  },

  parse: function(jsonResp) {
    if (jsonResp.suggestions) {
      this.suggestions().set(jsonResp.suggestions);
      delete jsonResp.suggestions;
    }

    return jsonResp;
  }

})
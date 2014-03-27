Backbone.AnnotatableModel = Backbone.Model.extend({
  annotations: function() {
    if (!this._annotations) {
      this._annotations = new ChefGenius.Collections.OwnedAnnotations([],{
        owner: this
      });
    }

    return this._annotations;
  },

  parse: function(jsonResp) {
    if (jsonResp.annotations) {
      this.annotations().set(jsonResp.annotations);

      delete jsonResp.annotations;
    }

    return jsonResp;
  }

});

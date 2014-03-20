window.ChefGenius.Models.Recipe = Backbone.Model.extend({
  urlRoot: "/api/recipes",

  parse: function(jsonResp) {
    if (jsonResp.steps) {
      this.steps().set(jsonResp.steps);
      delete jsonResp.steps;
    }
    if (jsonResp.needs) {

      this.needs().set(jsonResp.needs);
      delete jsonResp.needs;
    }

    return jsonResp;
  },

  steps: function() {
    if (!this._steps) {
      this._steps = new ChefGenius.Collections.RecipeSteps([], {
        recipe: this
      });
    }

    return this._steps;
  },

  needs: function() {
    if (!this._needs) {
      this._needs = new ChefGenius.Collections.RecipeNeeds([], {
        recipe: this
      });
    }

    return this._needs;
  }

})
window.ChefGenius.Models.Recipe = Backbone.Model.extend({
  urlRoot: "/api/recipes",

  parse: function(jsonResp) {
    if (jsonResp && jsonResp.steps) {
      this.steps().set(jsonResp.steps);
      delete jsonResp.steps;
    }
    if (jsonResp && jsonResp.ingredients) {
      this.ingredients().set(jsonResp.ingredients);
      delete jsonResp.needs;
    }
    if (jsonResp && jsonResp.note) {
      this.note().set(jsonResp.note);
      delete jsonResp.note;
    }
    if (jsonResp && jsonResp.info) {
      this.info().set(jsonResp.info);
      delete jsonResp.info;
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

  ingredients: function() {
    if (!this._ingredients) {
      this._ingredients = new ChefGenius.Collections.RecipeIngredients([], {
        recipe: this
      });
    }

    return this._ingredients;
  },

  note: function() {
    if (!this._note) {
      this._note = new ChefGenius.Models.Note({
        recipe: this
      });
    }

    return this._note;
  },

  info: function() {
    if (!this._info) {
      this._info = new ChefGenius.Models.Info({
        recipe: this
      });
    }

    return this._info;
  }


});
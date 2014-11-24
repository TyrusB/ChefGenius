window.ChefGenius.Models.User = Backbone.Model.extend({
    urlRoot: "/api/users",

    annotations: function() {
        if (!this._annotations) {
            this._annotations = new ChefGenius.Collections.UserAnnotations([],{
                user: this
            });
        }

        return this._annotations;
    },

    recipes: function() {
        if (!this._recipes) {
            this._recipes = new ChefGenius.Collections.UserRecipes([],{
                user: this
            });
        }

        return this._recipes;
    },

    suggestions: function() {
        if (!this._comments) {
            this._comments = new ChefGenius.Collections.UserComments([],{
                user: this
            });
        }

        return this._comments;
    },

    parse: function(jsonResp) {
        if (jsonResp.annotations) {
            this.annotations().set(jsonResp.annotations);

            delete jsonResp.annotations;
        }
        if (jsonResp.recipes) {
            this.recipes().set(jsonResp.recipes);

            delete jsonResp.recipes;
        }
        if (jsonResp.suggestions) {
            this.suggestions().set(jsonResp.suggestions);

            delete jsonResp.suggestions;
        }

        return jsonResp;
    }

});
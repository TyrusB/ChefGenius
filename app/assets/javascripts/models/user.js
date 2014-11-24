window.ChefGenius.Models.Note = Backbone.AnnotatableModel.extend({
    urlRoot: "/api/users",

    annotations: function() {
        if (!this._annotations) {
            this._annotations = new ChefGenius.Collections.UserAnnotations([],{
                owner: this
            });
        }

        return this._annotations;
    },

    recipes: function() {
        if (!this.recipes) {
            this.recipes = new ChefGenius.Collections.UserRecipes([],{
                owner: this
            });
        }

        return this.recipes;
    },

    comments: function() {
        if (!this.comments) {
            this.comments = new ChefGenius.Collections.UserComments([],{
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
        if (jsonResp.recipes) {
            this.recipes().set(jsonResp.recipes);

            delete jsonResp.recipes;
        }
        if (jsonResp.comments) {
            this.comments().set(jsonResp.comments);

            delete jsonResp.comments;
        }

        return jsonResp;
    }

});
window.ChefGenius.Collections.UserRecipes = Backbone.Collection.extend({
    model: ChefGenius.Models.Recipe,

    initialize: function(models, options) {
        this.user = options.user;
    },

    url: function() {
        return "api/user/" + this.user.id + "/recipes"
    },

    comparator: function(recipe) {
        return recipe.get("created_at");
    }
});
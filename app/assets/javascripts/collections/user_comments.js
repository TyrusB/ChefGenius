window.ChefGenius.Collections.UserComments = Backbone.Collection.extend({
    model: ChefGenius.Models.Suggestion,

    initialize: function(models, options) {
        this.user = options.user;
    },

    url: function() {
        return "api/user/" + this.user.id + "/suggestions"
    },

    comparator: function(comment) {
        return comment.get("created_at");
    }
});
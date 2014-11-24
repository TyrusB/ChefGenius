window.ChefGenius.Collections.UserComments = Backbone.Collection.extend({
    model: ChefGenius.Models.Comment,

    initialize: function(models, options) {
        this.user = options.user;
    },

    url: function() {
        return "api/user/" + this.user.id + "/comments"
    },

    comparator: function(comment) {
        return comment.get("created_at");
    }
});
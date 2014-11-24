window.ChefGenius.Collections.UserAnnotations = Backbone.Collection.extend({
    model: ChefGenius.Models.Annotation,

    initialize: function(models, options) {
        this.user = options.user;
    },

    url: function() {
        return "api/user/" + this.user.id + "/annotations"
    },

    comparator: function(annotation) {
        return annotation.get("created_at");
    }
});
window.ChefGenius.Views.UserShow = Backbone.CompositeView.extend({
    template: JST["users/show"],

    initialize: function(options) {
    },

    events: {

    },

    render: function() {
        var content = this.template({
            user: this.model
        });

        this.$el.html(content);

        return this;
    }

});
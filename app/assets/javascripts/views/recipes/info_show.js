window.ChefGenius.Views.InfoShow = Backbone.View.extend({
  template: JST["recipes/info/info_show"],

  render: function() {
    var content = this.template({
      recipe: this.model
    });

    this.$el.html(content);
    return this;
  }
})
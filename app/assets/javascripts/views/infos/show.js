window.ChefGenius.Views.InfoShow = Backbone.View.extend({
  template: JST["infos/show"],

  render: function() {
    var content = this.template({
      recipe: this.model
    });

    this.$el.html(content);
    return this;
  }
})
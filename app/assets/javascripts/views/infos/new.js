window.ChefGenius.Views.InfoNew = Backbone.View.extend({
  template: JST["infos/new"],

  render: function() {
    var content = this.template({
      recipe: this.model
    });

    this.$el.html(content);
    return this;
  }
})
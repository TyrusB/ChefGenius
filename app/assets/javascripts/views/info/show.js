window.ChefGenius.Views.InfoShow = Backbone.View.extend({
  template: JST["info/show"],

  render: function() {
    var content = this.template({
      info: this.model
    });

    this.$el.html(content);
    return this;
  }
})
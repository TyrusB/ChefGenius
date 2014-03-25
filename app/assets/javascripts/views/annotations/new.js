window.ChefGenius.Views.AnnotationNew = Backbone.View.extend({
  template: JST["annotations/new"],

  render: function() {
    var content = this.template({
      recipe: this.model
    });

    this.$el.html(content);
    return this;
  }
})
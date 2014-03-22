window.ChefGenius.Views.NoteShow = Backbone.View.extend({
  template: JST["notes/show"],

  render: function() {
    var content = this.template({
      note: this.model
    });

    this.$el.html(content);
    return this;
  }
})
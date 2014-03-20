window.ChefGenius.Views.NeedEdit = Backbone.View.extend({
  template: JST['needs/edit'],

  events: {
    "submit form":"updateIngredient"
  },

  render: function() {
    var content = this.template({
      need: this.model
    });

    this.$el.html(content);

    return this;
  },

  updateIngredient: function(event) {
    event.preventDefault();
    var info = this.$(event.currentTarget).serializeJSON()["need"];

    this.model.save(info);


  }

});

//1. add model into view 2. Trigger end of edit
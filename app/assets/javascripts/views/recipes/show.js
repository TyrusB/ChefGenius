window.ChefGenius.Views.RecipeShow = Backbone.CompositeView.extend({
  template: JST["recipes/show"],

  events: {
    "click button#edit-recipe":"makeEditable"
  },

  render: function() {

    var content = this.template({
      recipe: this.model
    });

    this.$el.html(content);

    this.model.needs().each( this.addNeed.bind(this) );
    this.model.steps().each( this.addStep.bind(this) );


    return this;
  },

  makeEditable: function() {
    var view = this;

    $('.recipe-container').toggleClass('can-edit-page-container');
    $('.editable').toggleClass('editable-closed');

    _(this.subviews()["#needs-list"]).each( function(subview) {
      subview.makeEditable();
    });

    _(this.subviews()["#steps-list"]).each ( function(subview) {
      subview.makeEditable();
    })

  },

  addNeed: function(need) {
    var needShow = new ChefGenius.Views.NeedShow({
      model: need
    });

    this.addSubview('#needs-list', needShow);
    needShow.render()
  },

  addStep: function(step) {
    var stepShow = new ChefGenius.Views.StepShow({
      model: step
    });

    this.addSubview('#steps-list', stepShow);
    stepShow.render();
  }


});

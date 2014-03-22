window.ChefGenius.Views.RecipeShow = Backbone.CompositeView.extend({
  template: JST["recipes/show"],

  events: {
    "click button#edit-recipe":"makeEditable",
    "click button#delete-recipe":"deleteRecipe"
  },

  render: function() {

    var content = this.template({
      recipe: this.model
    });

    this.$el.html(content);

    this.addInfo();
    this.model.ingredients().each( this.addIngredient.bind(this) );
    this.model.steps().each( this.addStep.bind(this) );


    return this;
  },

  makeEditable: function() {
    var view = this;

    $('.recipe-container').toggleClass('can-edit-page-container');
    $('.editable').toggleClass('editable-closed');

    _(this.subviews()["#ingredients-list"]).each( function(subview) {
      subview.makeEditable();
    });

    _(this.subviews()["#steps-list"]).each ( function(subview) {
      subview.makeEditable();
    })

  },

  addInfo: function() {
    var infoView = new ChefGenius.Views.InfoShow({
      model: this.model
    });

    this.addSubview('#info-section', infoView);
    infoView.render();
  },

  addIngredient: function(ingredient) {
    var ingredientShow = new ChefGenius.Views.IngredientShow({
      model: ingredient
    });

    this.addSubview('#ingredients-list', ingredientShow);
    ingredientShow.render()
  },

  addStep: function(step) {
    var stepShow = new ChefGenius.Views.StepShow({
      model: step
    });

    this.addSubview('#steps-list', stepShow);
    stepShow.render();
  },

  deleteRecipe: function() {
    this.model.destroy({
      success: function() {
        ChefGenius.router.navigate("", { trigger: true });
      }
    })
  }


});

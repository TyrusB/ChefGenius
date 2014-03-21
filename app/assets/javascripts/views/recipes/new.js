window.ChefGenius.Views.RecipeNew = Backbone.CompositeView.extend({
  template: JST["recipes/new"],

  initialize: function() {
    this.totalNeeds = 0;
    this.totalSteps = 0;
  },

  events: {
    "submit form":"createRecipe"
  },

  render: function() {
    var content = this.template({
      recipe: this.model
    });

    this.$el.html(content);

    this.addInfoFields();
    for ( var i = 0; i < 2; i++ ) {
      this.addBlankNeed();
      this.addBlankStep();
    }

    return this;
  },

  addInfoFields: function() {
    var infoForm = new ChefGenius.Views.InfoNew({
      model: this.model
    });
    this.addSubview('#info-list', infoForm);
    infoForm.render();
  },

  addBlankNeed: function() {
    var need = new ChefGenius.Models.Need();
    need.collection = this.model.needs();
    // MAKE SURE NOT TO SAVE THIS IF LEFT BLANK
    var needForm = new ChefGenius.Views.NeedNew({
      model: need,
      number: this.totalNeeds++
    });
    this.addSubview('#needs-list', needForm);
    needForm.render();
  },

  addBlankStep: function() {
    var step = new ChefGenius.Models.Step();
    step.collection = this.model.steps();

    var stepForm = new ChefGenius.Views.StepNew({
      model: step,
      number: this.totalSteps++
    });
    this.addSubview('#steps-list', stepForm);
    stepForm.render();
  },

  createRecipe: function(event) {
    event.preventDefault();
    var view = this;
    var info = this.$(event.currentTarget).serializeJSON();
    // var recipeInfo = this.$(event.currentTarget).serializeJSON()["recipes"];
 //    var stepsInfo = this.$(event.currentTarget).serializeJSON()["steps"];
 //    var needsInfo = this.$(event.currentTarget).serializeJSON()["needs"];
    this.model.save(info);


  }

});


//TODO:
// Add editable Title/info
// Add buttong ot add fields OR listen for end of blank fields
// Add form completions
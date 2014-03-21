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
    $('.editable').toggleClass('can-edit');

    _(this.subviews()["#needs-list"]).each( function(subview) {
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

  }


});

// 1. Add editable class 2. add editable-item class
// 3. Add data id attribute on form 4. IngredientEdit view

// getorfetch may not be best option for effect, since it fetches existin model
//
//
// $(this).toggleClass('can-edit')
// $(this).off('click');
//
// var needId = $(this).data('id');
// var need = view.model.needs().get(needId);
// var needEditView = new ChefGenius.Views.NeedEdit({
//   model: need
// });
//
// $(this).html(needEditView.render().$el);
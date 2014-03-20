window.ChefGenius.Views.RecipeShow = Backbone.View.extend({
  template: JST["recipes/show"],

  events: {
    "click button#edit-recipe":"makeEditable"
  },

  render: function() {

    var content = this.template({
      recipe: this.model
    });

    this.$el.html(content);

    return this;
  },

  makeEditable: function() {
    var view = this;

    $('.recipe-container').toggleClass('can-edit-page-container');
    $('.editable').toggleClass('can-edit');

    $('.editable.ingredient').on('click', function() {
      // Use attributes to get ingredient (id?)
      $(this).toggleClass('can-edit')
      $(this).off('click');
      var needId = $(this).data('id');
      var need = view.model.needs().get(needId);
      var needEditView = new ChefGenius.Views.NeedEdit({
        model: need
      });

      $(this).html(needEditView.render().$el);
    });
  }

});

// 1. Add editable class 2. add editable-item class
// 3. Add data id attribute on form 4. IngredientEdit view

// getorfetch may not be best option for effect, since it fetches existin model
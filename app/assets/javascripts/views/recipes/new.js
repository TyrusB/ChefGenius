window.ChefGenius.Views.RecipeNew = Backbone.CompositeView.extend({
  template: JST["recipes/new"],

  initialize: function() {
    this.uniqueNum = 0;
  },

  events: {
    "click #submit-recipe":"createRecipe",
    "focus .ingredient-input":"checkEmptyIngredientBoxes",
    "focus .check-empty":"checkEmptyBoxes",
    "change .recipe-photo-input":"handle_files"
  },

  render: function() {
    var content = this.template({
      recipe: this.model
    });

    this.$el.html(content);

    this.addInfoFields();
    this.addNoteField();
    for ( var i = 0; i < 2; i++ ) {
      this.addBlankIngredient();
      this.addBlankStep();
    }

    return this;
  },

  handle_files: function(event) {
    var view = this;
    var file = event.currentTarget.files[0]
    var reader = new FileReader();
    reader.onload = function(e) {
      // you need to send e.target.result in your $.ajax request
      view.renderPhoto(e.target.result)
      view.photoData = e.target.result
      // add view var with data
    }
    reader.readAsDataURL(file);
  },

  renderPhoto: function(data) {
    var $img = $("<img></img>").attr("src", data).attr("class", "title-picture img-rounded");
    this.$('#picture-container').html($img)
  },

  addInfoFields: function() {
    var infoForm = new ChefGenius.Views.InfoNew({
      model: this.model
    });
    this.addSubview('#info-section', infoForm);
    infoForm.render();
  },

  addNoteField: function() {
    var noteForm = new ChefGenius.Views.NoteNew({
      model: this.model
    });
    this.addSubview('#note-section', noteForm);
    noteForm.render();
  },

  addBlankIngredient: function() {
    var ingredient = new ChefGenius.Models.Ingredient();
    ingredient.collection = this.model.ingredients();
    // MAKE SURE NOT TO SAVE THIS IF LEFT BLANK
    var ingredientForm = new ChefGenius.Views.IngredientNew({
      model: ingredient,
      number: this.uniqueNum++
    });
    this.addSubview('#ingredients-list', ingredientForm);
    ingredientForm.render();
  },

  addBlankStep: function() {
    var step = new ChefGenius.Models.Step();
    step.collection = this.model.steps();

    var stepForm = new ChefGenius.Views.StepNew({
      model: step,
      number: this.uniqueNum++
    });
    this.addSubview('#steps-list', stepForm);
    stepForm.render();
  },

  createRecipe: function(event) {
    event.preventDefault();
    var view = this;
    var info = this.$('.recipe-form').serializeJSON();
    
    if (this.photoData) {
      info.recipes["title_photo"] = this.photoData;
    }

    this.model.save(info, {
      success: function(model) {
        model.collection.add(model);
        ChefGenius.router.navigate("#/recipes/" + model.id, { trigger: true })
      }
    });
  },

  checkEmptyBoxes: function(event) {
    var focusedEl = event.currentTarget;
    var view = this;

    if (
      _(this.$('.check-empty')).all( function(el) {
        return (el === focusedEl) || (el.className !== focusedEl.className) || !!$.trim( $(el).val() )
      })
    ) {
        this.$('.check-empty').off('focus')
        $(focusedEl).on('keydown', function(event) {
          if (event.which !== 9) {
            view.addLikeInputBox($(focusedEl));
            $(focusedEl).off('keydown');
            view.on('focus','.check-empty', view.checkEmptyBoxes.bind(view));
          }
        })
    }
  },

  addLikeInputBox: function($boxToClone) {
    var $newBox = $boxToClone.clone().html("");
    var oldName = $newBox.attr('name')
    var newName = oldName.replace(/\d+/, this.uniqueNum++);
    $boxToClone.attr('name', newName);

    $boxToClone.closest('ul, ol').append($('<li></li>').html($newBox));
  }

});


//TODO:
// Add editable Title/info
// Add buttong ot add fields OR listen for end of blank fields
// Add form completions
window.ChefGenius.Views.RecipeShow = Backbone.CompositeView.extend({
  template: JST["recipes/show"],

  events: {
    "click button#edit-recipe":"makeEditable",
    "click button#delete-recipe":"deleteRecipe",
  },

  initialize: function(options) {
    this.vent = options.vent

    this.listenTo(this.vent, "tooltip:clicked", this.addAnnotationBox)
    this.listenTo(this.vent, "annotation:saved", this.handleAnnotationSaved)
    this.listenTo(this.vent, "annotation-link:clicked", this.handleAnnotationClicked)
  },

  render: function() {
    var content = this.template({
      recipe: this.model
    });
    this.$el.html(content);

    this.addInfo();
    this.addNote();
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

  handleAnnotationSaved: function() {
    $('.annotation-pending').toggleClass('annotation-pending annotated')
  },

  handleAnnotationClicked: function($annotation, collection) {
    var id = $annotation.data('id');
    var view = this;

    collection.getOrFetch(id, function(annotation) {
      var annotationShow = new ChefGenius.Views.AnnotationShow({
        model: annotation,
        vent: view.vent
      })

      view.addSubview('#annotation-show-section', annotationShow);
      annotationShow.render();
      $('#annotation-show-modal').modal();
      $('#annotation-show-modal').on('hidden.bs.modal', function(e) {
        annotationShow.leave();
      });
    })
  },

  addInfo: function() {
    var infoView = new ChefGenius.Views.InfoShow({
      model: this.model.info()
    });
    this.addSubview('#info-section', infoView);
    infoView.render();
  },

  addAnnotationBox: function(annotation) {
    var annotationNew = new ChefGenius.Views.AnnotationNew({
      model: annotation,
      vent: this.vent
    })
    this.addSubview('#annotation-section', annotationNew);
    annotationNew.render();
    $('#annotation-modal').modal();

    $('#annotation-modal').on('hidden.bs.modal', function(e) {
      annotationNew.leave();
    })
  },

  addNote: function() {
    var noteView = new ChefGenius.Views.NoteShow({
      model: this.model.note(),
      vent: this.vent
    });
    this.addSubview('#note-section', noteView);
    noteView.render();
  },

  addIngredient: function(ingredient) {
    var ingredientShow = new ChefGenius.Views.IngredientShow({
      model: ingredient,
      vent: this.vent
    });
    this.addSubview('#ingredients-list', ingredientShow);
    ingredientShow.render()
  },

  addStep: function(step) {
    var stepShow = new ChefGenius.Views.StepShow({
      model: step,
      vent: this.vent
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
  },



});



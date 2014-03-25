window.ChefGenius.Views.RecipeShow = Backbone.CompositeView.extend({
  template: JST["recipes/show"],

  events: {
    "click button#edit-recipe":"makeEditable",
    "click button#delete-recipe":"deleteRecipe",
    "mouseup .annotatable":"handleUserSelection",
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

  addInfo: function() {
    var infoView = new ChefGenius.Views.InfoShow({
      model: this.model.info()
    });
    this.addSubview('#info-section', infoView);
    infoView.render();
  },

  addAnnotationBox: function(startPos, endPos, annotatableId, annotatableType) {
    var annotationBox = new ChefGenius.Views.AnnotationNew({
      startPos: startPos,
      endPos: endPos,
      annotatableId: annotatableId,
      annotatableType: annotatableType
    });
    this.addSubview('#annotation-section', annotationBox);
    annotationBox.render();
  },

  addNote: function() {
    var noteView = new ChefGenius.Views.NoteShow({
      model: this.model.note()
    });
    this.addSubview('#note-section', noteView);
    noteView.render();
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
  },

  insertSpan: function(start, end, $el) {
    var originalText = $el.html();

    var spanOpen = "<span class='annotated-pending ttip' title='Annotate?'>",
        spanClose = "</span>";

    var replacement = $el.html().slice(0, start) + spanOpen + $el.html().slice(start, end) + spanClose + $el.html().slice(end);
    $el.html( replacement )

    $(document).on('click', 'div', function(event) {
      if ( !$( event.target ).hasClass( "tooltipster-base" ) && !$( event.target ).hasClass( "annotate-button" ) ) {
        $el.html( originalText );
      }
    })
  },

  createTooltip: function(startPos, endPos, annotatableId, annotatableType) {
    var view = this;

    $('.ttip').tooltipster({
      content: $("<a href='#' class='annotate-button'>Annotate this text?</button>"),
      autoClose: false,
      offsetY: 10,
      interactive: true
    });

    $('.ttip').tooltipster("show");

    $('.annotate-button').on("click", function(event) {
      event.preventDefault();
      view.addAnnotationBox(startPos, endPos, annotatableId, annotatableType);
    })
  },

  handleUserSelection: function() {
    var view = this;

    var selection = window.getSelection();
    var range = selection.getRangeAt(0),
        startPos = range.startOffset,
        endPos = range.endOffset;

    if (startPos - endPos !== 0) {

      if (range.startContainer === range.endContainer) {
          var startPos = range.startOffset,
              endPos = range.endOffset;

          var startEl = range.startContainer.parentNode,
              $el = $(startEl)
          var annotatableId = startEl.getAttribute("data-annotatable-id"),
              annotatableType = startEl.getAttribute("data-annotatable-type");


          view.insertSpan(startPos, endPos, $el);
          view.createTooltip(startPos, endPos, annotatableId, annotatableType);

      } else {
          alert("Sorry, can only select within a step");
      }
    }

  }

});



window.ChefGenius.Views.AnnotationShow = Backbone.CompositeView.extend({
  template: JST["annotations/show"],

  initialize: function(options) {
    this.vent = options.vent
  },

  events: {
    'submit form':'newComment'
  },

  render: function() {
    var content = this.template({
      annotation: this.model
    });

    this.$el.html(content);

    this.model.suggestions().each( this.addSuggestion.bind(this) );
    this.addNewSuggestionBox();

    return this;
  },

  addSuggestion: function(suggestion) {
    var suggestionShow = new ChefGenius.Views.SuggestionShow({
      model: suggestion,
      vent: this.vent
    });

    this.addSubview('#suggestions-container', suggestionShow);
    suggestionShow.render();
  },

  addNewSuggestionBox: function() {
    var suggestion = new ChefGenius.Models.Suggestion();
    var suggestionNew = new ChefGenius.Views.SuggestionNew({
      model: suggestion,
      vent: this.vent
    })

    this.addSubview('#new-suggestion-container', suggestionNew)
    suggestionNew.render();
  },

  newComment: function(event) {
    var view = this;
    event.preventDefault();
    // format comment data
    var commentData = $(event.currentTarget).serializeJSON();
    var otherInfo = {
      annotation_id: this.model.id
    }
    _.extend(commentData.suggestions, otherInfo);
    //initialize/save comment
    var comment = new ChefGenius.Models.Suggestion();
    comment.collection = this.model.suggestions();
    comment.save(commentData, {
      success: function(suggestion) {
        view.model.suggestions().add(suggestion);
        view.addSuggestion(suggestion);
        $('.new-comment-form')[0].reset()
      }
    })
  }

})
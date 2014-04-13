Backbone.AnnotatableView = Backbone.View.extend({
  className: "annotatable can-annotate",

  initialize: function(options){
    this.listenTo(this.model.annotations(), "sync", this.render);
    this.listenTo(this.model.annotations(), 'remove', this.addAnnotationSpans);
  },

  events: {
    "click a.annotated":"handleAnnotationClick",
    "mouseup":"handleUserSelection",
    "click a.annotation-pending":"disableLink"
  },

  disableLink: function(event) {
    event.preventDefault();
  },

  handleUserSelection: function(event) {
    if ( $(event.target).hasClass('can-annotate') && !$(event.target).hasClass('annotated') && !$(event.target).hasClass('annotation-pending') ) {
      var selection = window.getSelection();
      var range = selection.getRangeAt(0);

      if (range.startContainer !== range.endContainer) {
        alert("Sorry, you can only annotate a single element.");
      }
      else if ( (range.startOffset - range.endOffset) !== 0 ) {
        this.getSelectionInfo(range);
      }
    }
  },

  getSelectionInfo: function(range) {
    //Counts the number of characters contained by all siblings that come before startNode
    function getOffset(startNode, $li) {
      // grab all the children of the li passed into the argument.
      var children = [].slice.call($li[0].childNodes);

      var offset = 0;

      // Loop through the children until you find the startNode, adding to your offset as you go
      _(children).find(function(el) {
        if (el.textContent !== startNode.textContent) {
          offset += el.textContent.length
        }
        return el.textContent === startNode.textContent;
      });

      return offset;
    }

    var startPos = range.startOffset,
        endPos = range.endOffset,
        startNode = range.startContainer;
    
    var $li = $(startNode.parentNode).hasClass('annotatable') ? $(startNode.parentNode) : $(startNode.parentNode).closest('.annotatable');

    var offset = getOffset(startNode, $li);

    var id = $li.data('annotatable-id'),
        type = $li.data('annotatable-type'),
        offsetStartPos = offset + startPos,
        offsetEndPos = offset + endPos;

    var potentialAnnotation = new ChefGenius.Models.Annotation({
      start_pos: offsetStartPos,
      end_pos: offsetEndPos,
      annotatable_id: id,
      annotatable_type: type
    });

    //HAVE TO HAVE THIS ONE FIRST
    this.vent.trigger("annotationRefresh")

    this.addAnnotationSpans(potentialAnnotation)
    this.createTooltip();

    potentialAnnotation.collection = this.model.annotations();
    this.addTooltipListener(potentialAnnotation);

    this.listenToOnce(this.vent, "annotationRefresh", this.render)
  },

  createTooltip: function() {
    var view = this;

    $('.ttip').tooltipster({
      content: $("<a href='#' class='annotate-button'>Annotate</button>"),
      autoClose: false,
      offsetY: 2,
      interactive: true
    });

    $('.ttip').tooltipster("show");
  },

  addTooltipListener: function(potentialAnnotation) {
    var view = this;

    $('.annotate-button').on("click", function(event) {
      event.preventDefault();
      view.vent.trigger("tooltip:clicked", potentialAnnotation)
      $('.ttip').tooltipster("hide");
      $('.ttip').toggleClass('ttip');
    })
  },

  addAnnotationSpans: function(currentSelection) {
  
    // currentSelection is optional, used to render pending annotations like persisted ones
    //  it will be removed at the end of the function
    if (currentSelection) {
      this.model.annotations().add(currentSelection, { silent: true });
    }

    var startIndex = 0,
        accumHTML = "";

    //Uses the plain text of the annotatable element to build up the HTML string.
    var $li = this.$el.hasClass('annotatable') ? this.$el : this.$('.annotatable')
    var text = $li.text();

    //Annotations are ordered by start position.
    //One by one, take the text in between the annotations indices, wrap it with an 'a' tag, then add it to accumHTML
    this.model.annotations().each( function(annotation) {
      var spanStart = annotation.get("start_pos"),
          spanEnd = annotation.get("end_pos");

      if (annotation === currentSelection) {
        var spanOpenTag = "<a href='#' class='annotation-pending ttip'>"
      } else {
        var spanOpenTag = "<a href='#' class='annotated' data-id=" + annotation.id + ">"
      }

      var spanCloseTag = "</a>";

      var spanHTML = spanOpenTag + text.slice(spanStart, spanEnd) + spanCloseTag
      accumHTML += text.slice(startIndex, spanStart) + spanHTML;

      startIndex = spanEnd;
    })
    accumHTML += text.slice(startIndex);

    // Set the parent container's html to the built up HTML string.
    $li.html( accumHTML );

    //Removes the pending annotation from the collection of persisted annotations.
    if (currentSelection) {
      this.model.annotations().remove(currentSelection, { silent: true })
    }

  },

  handleAnnotationClick: function(event) {
    event.preventDefault();
    var $annotation = $(event.currentTarget);
    this.vent.trigger("annotation-link:clicked", $annotation, this.model.annotations())
  }

});
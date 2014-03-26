Backbone.AnnotatableView = Backbone.View.extend({
  initialize: function(options){
    this.listenTo(this.model.annotations(), "all", this.render);
  },

  events: {
    "click a.annotated":"handleAnnotationClick",
    "mouseup .holds-annotations":"handleUserSelection"
  },

  addAnnotationSpans: function(currentSelection) {
    if (currentSelection) {

      this.model.annotations().add(currentSelection, { silent: true });
    }

    var startIndex = 0;
    var accumHTML = "";
    var text = this.$('.holds-annotations').text();

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

    this.$('.holds-annotations').html( accumHTML );

    if (currentSelection) {

      this.model.annotations().remove(currentSelection, { silent: true })
    }

  },

  handleUserSelection: function(event) {
    if ( !$(event.target).hasClass('annotated') ) {
      var selection = window.getSelection();
      var range = selection.getRangeAt(0);

      if (range.startContainer !== range.endContainer) {
        alert("Sorry, you can only select within a step");
      }
      else if ( (range.startOffset - range.endOffset) !== 0 ) {
        this.getSelectionInfo(range);
      }
    }
  },

  getSelectionInfo: function(range) {
    function getOffset(startNode, children) {
      var offset = 0;

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

    var $li = $(startNode.parentNode).closest('.holds-annotations')
    var children = [].slice.call($li[0].childNodes);

    var offset = getOffset(startNode, children);

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
    this.vent.trigger("item:highlighted")

    this.addAnnotationSpans(potentialAnnotation)
    this.createTooltip();

    potentialAnnotation.collection = this.model.annotations();
    this.addTooltipListener(potentialAnnotation);

    this.listenToOnce(this.vent, "item:highlighted", this.render)

  },

  createTooltip: function() {
    var view = this;

    $('.ttip').tooltipster({
      content: $("<a href='#' class='annotate-button'>Annotate</button>"),
      autoClose: false,
      offsetY: 5,
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
      $('.ttip').toggleClass('.ttip')
    })
  },

  handleAnnotationClick: function(event) {
    event.preventDefault();
    var $annotation = $(event.currentTarget);
    this.vent.trigger("annotation-link:clicked", $annotation, this.model.annotations())
  }

});
Backbone.AnnotatableView = Backbone.View.extend({
  initialize: function(options){
    this.listenTo(this.model.annotations(), "all", this.render);
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
        var spanOpenTag = "<span style='background:yellow' class='annotated-pending ttip'>"
      } else {
        var spanOpenTag = "<span style='background:yellow'>"
      }

      var spanCloseTag = "</span>";

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

  handleUserSelection: function() {
    var selection = window.getSelection();
    var range = selection.getRangeAt(0);

    if (range.startContainer === range.endContainer) {
      this.getSelectionInfo(range);
    }
    else {
      alert("Sorry, can only select within a step");
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

    this.vent.trigger("item:highlighted")
    this.addAnnotationSpans(potentialAnnotation)

    this.listenTo(this.vent, "item:highlighted", this.renderOnce)


    // this.insertSpan(offsetStartPos, offsetEndPos, $li)

    alert("Id: " + id + ", startPos: " + offsetStartPos + ", endPos: " + offsetEndPos);
  },

  renderOnce: function() {
    this.render();
    this.off(this.vent);
  },

  // insertSpan: function(start, end, $el) {
 //
 //
 //    var originalText = $el.html();
 //
 //    var spanOpen = "<span class='annotated-pending ttip' title='Annotate?'>",
 //        spanClose = "</span>";
 //
 //    var replacement = $el.html().slice(0, start) + spanOpen + $el.html().slice(start, end) + spanClose + $el.html().slice(end);
 //    $el.html( replacement )
 //
 //    $(document).on('click', 'div', function(event) {
 //      if ( !$( event.target ).hasClass( "tooltipster-base" ) && !$( event.target ).hasClass( "annotate-button" ) ) {
 //        $el.html( originalText );
 //      }
 //    })
 //  },

  createTooltip: function() {
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
      view.vent.trigger("tooltip:clicked", this.model)
    })
  },

});
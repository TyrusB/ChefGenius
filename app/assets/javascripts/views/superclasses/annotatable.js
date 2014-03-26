Backbone.AnnotatableView = Backbone.View.extend({
  initialize: function(options){
    this.listenTo(this.model.annotations(), "all", this.render);
  },

  addAnnotationSpans: function() {
    var startIndex = 0;
    var accumHTML = "";
    var text = this.$('.annotatable').text();


    this.model.annotations().each( function(annotation) {
      var spanStart = annotation.get("start_pos"),
          spanEnd = annotation.get("end_pos"),
          spanOpenTag = "<span style='background:yellow'>",
          spanCloseTag = "</span>";

      var spanHTML = spanOpenTag + text.slice(spanStart, spanEnd) + spanCloseTag
      accumHTML += text.slice(startIndex, spanStart) + spanHTML;

      startIndex = spanEnd;
    })

    accumHTML += text.slice(startIndex);

    this.$('.annotatable').html( accumHTML );

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
      view.vent.trigger("tooltip:clicked", this.model)
    })
  },

});
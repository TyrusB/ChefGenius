window.ChefGenius = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function(currentUser) {
    var recipes = new ChefGenius.Collections.Recipes();
    recipes.fetch({
      success: function() {
        new ChefGenius.Routers.AppRouter({
          $rootEl: $('#main-content'),
          recipes: recipes,
          currentUser: currentUser
        });
        Backbone.history.start();
      }
    });
  }
};



//CURRENTLY DOESN'T ACTUALLY CALL CALLBACK UNTIL IT GETS DATA FROM SERVER
Backbone.Collection.prototype.getOrFetch = function(id, callback) {

  var model;
  var collection = this;

  if (model = this.get(id)) {
    model.fetch({
      success: function() {
        callback(model);
      }
    });
  } else {
    model = new this.model( {id: id} );
    model.collection = this;

    model.fetch({
      success: function() {
        collection.add(model);
        callback(model);
       }
    });
  }
};

Backbone.View.prototype.leave = function() {
  this.remove();
}


Backbone.CompositeView = Backbone.View.extend({

  // subviews are view objects, but which HAVEN'T been rendered yet.
  // BUT the rendering happens right after this method call.
  addSubview: function(selector,subview) {
    // HAVE to use [] selectors here
    var selectorSubviews =
      this.subviews()[selector] || (this.subviews()[selector] = []);

    selectorSubviews.push(subview);

    // have to actually add to the dom
    // once again, this element doesn't have content yet.
    var $selectorEl = this.$(selector);
    $selectorEl.append(subview.$el);

  },

  removeSubview: function(selector, subview) {
    // Did this differently from the demo.
    this.subviews()[selector] =
      _(this.subviews()[selector]).without(subview);

    subview.leave();
  },

  leave: function() {
    Backbone.View.prototype.remove.call(this);

    _(this.subviews()).each(function(subview) {
      subview.leave();
    });
  },

  renderSubviews: function() {
    var mainview = this;

    _.each(mainview.subviews(), function(selectorSubviews, selector) {
      var $selectorEl = mainview.$(selector);
      $selectorEl.empty();

      _.each(selectorSubviews, function(subview) {
        $selectorEl.append(subview.render().$el);
        subview.delegateEvents();
      });
    });
  },

  subviews: function() {
    if (!this._subviews) {
      this._subviews = {};
    }

    return this._subviews;
  }
});


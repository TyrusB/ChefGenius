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
        this.add(model);
        callback(model);
       }
    })
  }


}


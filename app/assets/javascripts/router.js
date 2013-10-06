// Router
App.Router.map(function() {
    this.resource('about');
    this.resource('repositories',function(){
        this.resource('repository',{path: ':repository_id'})
    });
});

// Repositories Route
App.RepositoriesRoute = Ember.Route.extend({
	model: function(params){
		return App.Repository.find();
	}
});
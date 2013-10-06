App.RepositoriesController = Ember.ArrayController.extend({
	isMarkedForDeletionCount: function () {
	  return this.filterProperty('markedForDeletion', true).get('length');
	}.property('@each.markedForDeletion'),
	markedForDeletion: function(){
	  return this.filterProperty('markedForDeletion', true)
	}.property('@each.markedForDeletion')
});
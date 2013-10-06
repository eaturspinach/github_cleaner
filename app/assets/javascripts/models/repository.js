// Repository Model
App.Repository  = DS.Model.extend({
	item:   	  DS.attr('number'),
	name:         DS.attr('string'),
	url:          DS.attr('string'),
	description:  DS.attr('string'),
	markedForDeletion: false
});
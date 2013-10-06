// Repository Model
App.Repository  = DS.Model.extend({
  name:         DS.attr('string'),
  url:          DS.attr('string'),
  description:  DS.attr('string')
});
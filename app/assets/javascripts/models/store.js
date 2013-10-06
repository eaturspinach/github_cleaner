App.Store = DS.Store.extend({
  revision: 11
});

DS.RESTAdapter.configure("plurals", {
  repository: "repositories"
});
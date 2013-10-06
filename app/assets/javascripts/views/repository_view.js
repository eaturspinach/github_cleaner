App.RepositoryView = Ember.View.extend({
  click: function(evt) {
  	var repoDesc = this.$().find('.repo-description')[0].innerText.trim(),
        repoModal = this.$().closest('.repo').find('.repo-modal');
    $(repoModal).find('.container').append("<p>"+repoDesc+"</p>"); //Add repo description
    $(repoModal).foundation('reveal', 'open'); //Open the modal
  }
});

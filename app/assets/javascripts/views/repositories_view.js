App.RepositoriesView = Ember.View.extend({
  reviewModal: function(){
    $('#review-modal').foundation('reveal', 'open');
  },
  cancel: function(){
  	$('#review-modal').foundation('reveal', 'close');
  },
  submit: function(){
  	var reposToDelete = App.Repository.find().filterProperty('markedForDeletion',true),
        repos = [];
  	reposToDelete.forEach(function(repo){
  		var repoId = repo.get('item');
  	  repos.push(repoId);
      repo.deleteRecord();
  	});
    $.ajax({
      url:"/destroy_repos",
      type: "post",
      dataType: "json",
      data: { "repos" : repos },
      complete:function (data) {
        $('#confirmation-modal').foundation('reveal','open');
      }
    });
  }
})
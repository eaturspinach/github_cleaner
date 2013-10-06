App.RepositoryCheckbox = Ember.Checkbox.extend({
    classNames:['regular-checkbox','big-checkbox'],
    click: function (evt) {
        var repo_id = this.get('value');
        var repo = App.Repository.find(repo_id);
        
        if(repo.markedForDeletion === false){
       		repo.set('markedForDeletion', true);
        } else {
        	repo.set('markedForDeletion', false);
        }

        this.$().closest('.repo').find('.checkbox_label').toggleClass('checked')
    }
});
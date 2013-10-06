var App = Ember.Application.create();

// All common code that needs to execute once only
GitHubCleaner = {
	init: function(){
		var self = this;
		self.reRoute(); // If I'm at /, then reroute to /#/repositories
		self.mobileNav(); // Initializes mobile nav
		self.initializeFoundationModals(); // Initializes Foundation modals
		self.closeFoundationModals(); // When clicking escape, close Foundation modal
	},
	reRoute: function(){
		var hash = window.location.hash;
		if(hash === ""){ window.location.replace('/#/repositories'); }
	},
	initializeFoundationModals: function(){
    	$(document).foundation('reveal', GC.Configs.Reveal.options());
    	$(document).foundation(); // Need this bizarrely
	},
	mobileNav: function(){ // Provides mobile nav dropdown functionality via Foundation Topbar
		$(document).foundation('topbar', {
			index : 0,
			stickyClass : 'sticky',
			custom_back_text: true, // Set this to false and it will pull the top level link name as the back text
			back_text: 'Back', // Define what you want your custom back text to be if custom_back_text: true
			init : false
		});
	},
	closeFoundationModals: function(){
		$(document).keyup(function(e) { //Note to self, this has to be unbound
			if (e.keyCode == 27) { // esc key
				$(document).foundation('reveal','close');
			}
		});
	}
}

GitHubCleaner.init();


GC.Configs.Reveal = {

    options: function(userOptions) {
        var opts = {
            animation: 'fadeAndPop',
            animationSpeed: 100,
            closeOnBackgroundClick: true,
            dismissModalClass: 'close-reveal-modal',
            bgClass: 'reveal-modal-bg',
            open: function(){},
            opened: function(){},
            close: function(){},
            closed: function(){
                $(this).find('.container').empty();
            },
            bg : $('.reveal-modal-bg'),
            css : {
                open : {},
                close : {}
            }
        };

        for (var attrname in userOptions) {
            opts[attrname] = userOptions[attrname]; // Merge opts{} with userOptions{}
        }

        return opts;
    }
}
$(document).foundation();

var menu = $('.left-off-canvas-menu');

$(document).on('resize', function() {
  // Beware with resize handlers...
  //  Throttle & consolidate #perfmatters
  menu.height($(this).height());  
});

// Initialize height
$(document).trigger('resize');

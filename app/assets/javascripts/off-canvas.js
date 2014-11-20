$(document).foundation();

var menu = $('.left-off-canvas-menu');

$(document).on('resize', function() {
  // Beware with resize handlers...
  //  Throttle & consolidate #perfmatters
  menu.height($(this).height());  
});
$(document).foundation({
  offcanvas : {
    // Sets method in which offcanvas opens.
    // [ move | overlap_single | overlap ]
    open_method: 'move', 
    // Should the menu close when a menu link is clicked?
    // [ true | false ]
    close_on_click : true 
  }
});
// Initialize height
$(document).trigger('resize');

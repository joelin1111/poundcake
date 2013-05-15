$(document).ready(function() {
    
    $('a.toggle').click(function(){
        // swap icon
        $(this).find( '[class^=icon-resize]' ).toggleClass( 'icon-resize-small icon-resize-full' );
        // expand or collapse child elements
        $(this).siblings("ul").toggle();
    });
    
});
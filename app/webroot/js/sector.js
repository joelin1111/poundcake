
/*
Toggle the true/mag azimuth fields based on whether or not the user has
checked the box for a sector antenna
*/
 
$(document).ready(function() {
    $("#NetworkRadioSector").click(
    function() {
       $("#NetworkRadioTrueAzimuth").each(
            function() {
               this.disabled = !this.disabled;
            }
        );
       $("#NetworkRadioMagAzimuth").each(
            function() {
               this.disabled = !this.disabled;
            }
        );
    });
});
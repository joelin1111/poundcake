
/*
Toggle the true/mag azimuth fields based on whether or not the user has
checked the box for a sector antenna
*/
 
$(document).ready(function() {
    $("#NetworkRadioSector_").click(
    function() {
       $("#NetworkRadioTrueAzimuth").each(
            function() {
               this.disabled = !this.disabled;
               // if it's disabled then clear the field
               if(this.disabled)
                   $(this).val("");
            }
        );
       $("#NetworkRadioMagAzimuth").each(
            function() {
               this.disabled = !this.disabled;
               // if it's disabled then clear the field
               if(this.disabled)
                   $(this).val("");
            }
        );
    });
});
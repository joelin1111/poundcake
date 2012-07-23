
/*
 * This datepicker is from:
 * http://nik.chankov.net/2011/07/16/setting-datepicker-with-jquery-in-cakephp-project/
 */
$(document).ready(function() {
   $( "input.datepicker" ).dp({
      dateFormat: 'dd.mm.yy',
      altFormat: 'yy-mm-dd'
   }); 
});
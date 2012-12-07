/*
 * This datepicker is from:
 * http://nik.chankov.net/2011/07/16/setting-datepicker-with-jquery-in-cakephp-project/
 */

$(document).ready(function () {
    
    cakebootstrap();
    
    errorstrap();
    
    $( "input.datepicker" ).dp({
       dateFormat: 'dd.mm.yy',
       altFormat: 'yy-mm-dd'
    });
    
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
    
    // Checkbox stuff from: http://www.abeautifulsite.net/blog/2007/12/jquery-checkboxes-select-all-select-none-and-invert-selection/
    
    // Select all
    $("A[href='#select_all']").click( function() {
        $("#" + $(this).attr('rel') + " INPUT[type='checkbox']").attr('checked', true);
        return false;
    });

    // Select none
    $("A[href='#select_none']").click( function() {
        $("#" + $(this).attr('rel') + " INPUT[type='checkbox']").attr('checked', false);
        return false;
    });

    // Invert selection
    $("A[href='#invert_selection']").click( function() {
        $("#" + $(this).attr('rel') + " INPUT[type='checkbox']").each( function() {
            $(this).attr('checked', !$(this).attr('checked'));
        });
        return false;
    });
    
    // Select none
    $("A[href='#clear_all']").click( function() {
        $("#" + $(this).attr('rel') + " INPUT[type='text']").val('');
        return false;
    });
});

// CakePHP Twitter Bootstrappifier
// https://gist.github.com/2035441
function cakebootstrap()
{
    //All submit forms wrapped to div.action
    $('form[class*="form-horizontal"] input[type="submit"][class!="btn btn-primary"]').wrap('<div class="form-actions" />');
    //All submit forms converted to primary button
    $('form[class*="form-horizontal"] input[type="submit"]').addClass('btn btn-primary');
    //All index actions converted into pretty buttons
    $('form[class*="form-horizontal"] td[class="actions"] > a[class!="btn"]').addClass('btn');

    //All (div.inputs) with default FormHelper style (div.input > label ~ input)
    //converted into Twitter Bootstrap Style (div.clearfix > label ~ div.input)

    $('form[class*="form-horizontal"] div[class!="input added"].input').removeClass().addClass('control-group');
    $('form[class*="form-horizontal"] div.control-group').closest('form').addClass('form-horizontal');
    $('form[class*="form-horizontal"] div.control-group label').addClass('control-label');
    $('form[class*="form-horizontal"] div.control-group > label ~ input').wrap('<div class="controls" />');
    $('form[class*="form-horizontal"] div.control-group > label ~ select').wrap('<div class="controls" />');
    $('form[class*="form-horizontal"] div.control-group > label ~ textarea').wrap('<div class="controls" />');
    $('form[class*="form-horizontal"] div.control-group > input[type="checkbox"]').each(function(e, data){
            $(this).parent().find('label').insertBefore(this);
            $(this).wrap('<div class="controls" />');
    });
    $('form[class*="form-horizontal"] div.control-group > input ~ label').insertBefore();
    $('div.pagination ul li a.disabled').parent().addClass('disabled');
    //$('div.pagination ul li.active').wrapInner('<a href="#" />');
}

//Default CakePHP Error inputs are converted to twitter bootstrap style
function errorstrap()
{
    $('.message').addClass('alert-message error');
    $('.flash_success').addClass('alert-message success');
    $('.flash_warning').addClass('alert-message warning');
    $('form[class*="form-horizontal"] .form-error').addClass('error');
    $('form[class*="form-horizontal"] .form-error').closest('.control-group').addClass('error');
    $('form[class*="form-horizontal"] .error .error-message').each(function(e, data){
            $(data).parent().find('.controls').append('<span class="help-inline">' + $(this).text() + '</span>');
            $(data).remove();
    });
}

/*

// make all checkboxes checked
$("#allsts").click(function() {
    $(".selsts").attr('checked', true);
});

// make all checkboxes un-checked
$("#nosts").click(function() {
    $(".selsts").attr('checked', false);
});

*/
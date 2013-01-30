/*
 * This datepicker is from:
 * http://nik.chankov.net/2011/07/16/setting-datepicker-with-jquery-in-cakephp-project/
 */

$(document).ready(function () {
    
    cakebootstrap();
    
    errorstrap();
    
    bootbox_dialogs();
    
    jquery_map();

    // fade out flash messages after n miliseconds
    // replace with empty block to maintain space
    //$('#flash').fadeTo(4000, 0, function(){ $(this).html().fadeTo(1000, 1); })
    $('#flash').fadeTo(4000, 0, function(){  })
    
    // date picker
    $( "input.datepicker" ).dp({
       dateFormat: 'dd.mm.yy',
       altFormat: 'yy-mm-dd'
    });
    
    // checkbox on Radio add/edit for denoting it as a sector -- enables/disables
    // the true azimuth field
    $('#NetworkRadioSector').click( function() {
        $("[id$='Azimuth']").each( function() {
            this.disabled = !this.disabled;
            // if it's disabled then clear the field
            //if(this.disabled)
                $(this).val("");
         });
    });

    // checkboes on the main search
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
    
    /*
    // tabs on admin interface
    $('#home a').click(function (e) {
        e.preventDefault();
        $(this).tabs('show');
    })
    
    $('#profile a').click(function (e) {
        e.preventDefault();
        $(this).tabs('show');
    })
    
    
    $('#messages a').click(function (e) {
        e.preventDefault();
        $(this).tabs('show');
    })
    
    
    $('#settings a').click(function (e) {
        e.preventDefault();
        $(this).tabs('show');
    })
    
    $('a[data-toggle="tab"]').on('shown', function (e) {
        e.target // activated tab
        e.relatedTarget // previous tab
    })
    */

    /*
    
    // this highlights the current tab
    $(".main-navigation .nav li a").each(function() {
        var str=location.href.toLowerCase();
        $(".nav li a").each(function() {
            // this changes the main navigation
            if (str.indexOf(this.href.toLowerCase()) > -1) {
                //$("li.active").removeClass("active");
                //$(this).parent().addClass("active");
                $(this).parent().css({
                    //'background-color':'#0088cc',
                    'text-shadow':'0 -1px 0 rgba(0, 0, 0, 0.2)',
                    'color':'#ffffff'
                });
                return false;
            } else if ( str.match(/overview/)) {
                $("li.active").removeClass("active");
                $(".nav li a").eq(0).css({
                    //'background-color':'#0088cc',
                    'text-shadow':'0 -1px 0 rgba(0, 0, 0, 0.2)',
                    'color':'#ffffff'
                });
                return false;
            } else if ( str.match(/admin/)) {
                // this keeps admin highlighted even when we're on sub-pages
                // of the admin UI such as /admin/buildItems/index
                //alert("Admin page!");
                $("li.active").removeClass("active");
                //$(".nav li a").eq(6).addClass("active"); // doesn't work!
                $(".nav li a").eq(6).css({
                    //'background-color':'#0088cc',
                    'text-shadow':'0 -1px 0 rgba(0, 0, 0, 0.2)',
                    'color':'#ffffff'
                });
                return false;            
            };           
        });
        $("li.active").removeClass("active");
        $(this).parent().addClass("");
        //alert($(this).text());
    });
    */
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

function bootbox_dialogs() {
    
    /*
     * Generic way to handle Bootbox dialog boxes for confirmation
     * from users on an action such a "Delete"
     */
    $('a.confirm').removeAttr('onclick');
    $('a.confirm').click(function(e) {
        e.preventDefault();
        
        // get the form element preceding the Delete link
        //var $action = $('a.confirm').siblings().last().attr('action');
        var $action = $(this).siblings( 'form' ).attr('action');
        //console.log( $action );
        
        // the text to display in the dialog box comes in as an HTML5
        // data attribute, data-dialog_msg="Foo"
        var $string = $(this).data( 'dialog_msg' );
        
        // console.log( $action );
        
        // bootbox.confirm( "Confirm "+$name+"?", function(confirmed) {
        bootbox.confirm( $string + '?', function(confirmed) {
            if (confirmed) {
                $.ajax({
                        type: 'POST',
                        url: $action,
                        success: function() {
                            console.log( 'success');
                            window.location.reload(true);
                        },
                        error: function() { console.log( 'error'); }
                });
                return false;
            }
        });
        return false;
    });
}

function jquery_map() {
    //$('#elemId').length
    if ($("#map_canvas").is('*')) {
        //var yourStartLatLng = new google.maps.LatLng(59.3426606750, 18.0736160278);
        var default_lat = $('#google_mapDefaultLat').val();
        var default_lon = $('#google_mapDefaultLon').val();
        console.log( default_lat );
        //console.log( default_lon );
        var centerMapAt = new google.maps.LatLng( default_lat, default_lon );
        $('#map_canvas').gmap({'center': centerMapAt});

    //    $("input[type='hidden']").each(function() {
    //        console.log($(this).val());
    //    });

        $('#map_canvas').gmap().bind('init', function(ev, map) {
            // adds plcemarkers, data from json_encoded data in view
            $("[data-gmapping]").each(function(i,el) {
                var data = $(el).data('gmapping');
                console.log(data.icon);
                
                $('#map_canvas').gmap('addMarker', {'id': data.id, 'icon':data.icon, 'tags':data.tags, 'position': new google.maps.LatLng(data.latlng.lat, data.latlng.lng), 'bounds':true }, function(map,marker) {
                    $(el).click(function() {
                        $(marker).triggerEvent('click');
                    });
                }).click(function() {
                    $('#map_canvas').gmap('openInfoWindow', { 'content': $(el).find('.info-box').text() }, this);
                });
            });        
        });

        $('input:checkbox').click(function() {
            $('#map_canvas').gmap('closeInfoWindow');
            $('#map_canvas').gmap('set', 'bounds', null);
            
            // get an array with the values of all the checked boxes
            var filters = [];
            $('input:checkbox:checked').each(function(i, checkbox) {
                filters.push($(checkbox).val());
            });
            
            console.log("Length"+filters.length);

            if ( filters.length >= 0 ) {
                console.log(filters);
                $('#map_canvas').gmap('find', 'markers', { 'property': 'tags', 'value': filters, 'operator': 'OR' }, function(marker, isFound) {
                    console.log(isFound);
                    if ( isFound ) {
                        marker.setVisible(true);
                        $('#map_canvas').gmap('addBounds', marker.position);
                    } else {
                        marker.setVisible(false);
                    }
                });
            }/* else {
                $.each($('#map_canvas').gmap('get', 'markers'), function(i, marker) {
                    $('#map_canvas').gmap('addBounds', marker.position);
                    marker.setVisible(true);
                    // marker.setVisible(true);
                });
            }*/
        });
    }   
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


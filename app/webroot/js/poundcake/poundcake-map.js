/*
 * This JQuery file is for interfacing with the jquery-ui-map.js library
 * @see http://code.google.com/p/jquery-ui-map/
 */

$(document).ready(function () {
    if ($("#map_canvas").is('*')) {
        //var yourStartLatLng = new google.maps.LatLng(59.3426606750, 18.0736160278);
        var default_lat = $('#google_mapDefaultLat').val();
        var default_lon = $('#google_mapDefaultLon').val();
        // console.log( default_lat );
        // console.log( default_lon );
        var centerMapAt = new google.maps.LatLng( default_lat, default_lon );
        $('#map_canvas').gmap({'center': centerMapAt});

        // make an array of site states
        //$("input[type='hidden']").each(function() {
        var siteStates = [];
        $('input[id^=google_mapSitestate]').each(function() {
             siteStates.push( $(this).val() );
        });
        //console.log(siteStates);

        $('#map_canvas').gmap().bind('init', function(ev, map) {
            
            $('#map_canvas').gmap('addControl', 'control', google.maps.ControlPosition.RIGHT_TOP);           
            
            // adds placemarkers, data from json_encoded data in view
            $("[data-gmapping]").each(function(i,el) {
                var data = $(el).data('gmapping');
                //console.log(data.tags);
                $('#map_canvas').gmap('addMarker', {'id': data.id, 'icon':data.icon, 'tags':data.tags, 'position': new google.maps.LatLng(data.latlng.lat, data.latlng.lng), 'bounds':true }, function(map,marker) {
                    $(el).click(function() {
                        $(marker).triggerEvent('click');
                    });
                }).click(function() {
                    $('#map_canvas').gmap('openInfoWindow', { 'content': $(el).find('.info-box').html() }, this); // was: ('.info-box').text()()
                });
            });       
            
           // $('#map_canvas').gmap('addShape', 'Circle', { 'strokeColor': "#FF0000", 'strokeOpacity': 0.8, 'strokeWeight': 2, 'fillColor': "#FF0000", 'fillOpacity': 0.35, 'center': new google.maps.LatLng(58.12, 12.01), 'radius': 2000 });
            
        });


        // setup the map's key -- the checkboxes
        $('#map_canvas').gmap('addControl', 'radios', google.maps.ControlPosition.BOTTOM_LEFT);
        $.each(siteStates, function(i, tag) {
            //console.log(tag);
            var str = '<label style="margin-right:5px;display:block;"><input type="checkbox" style="margin-right:3px" value="';
            str += tag;
            str += '" checked/>'+tag+'</label>';
            $('#radios').append( str );
            //console.log(str);
            // ('<label style="margin-right:5px;display:block;"><input type="checkbox" style="margin-right:3px" value="{0}"/>{1}</label>').format(tag, tag)
            //$('#radios').append(('<label style="margin-right:5px;display:block;"><input type="checkbox" style="margin-right:3px" value="{0}"/>{1}</label>').format(tag, tag));
        });

        // toggles place marks if un-checked
        $('input:checkbox').click(function() {
            $('#map_canvas').gmap('closeInfoWindow');
            $('#map_canvas').gmap('set', 'bounds', null);

            // get an array with the values of all the checked boxes
            var filters = [];
            $('input:checkbox:checked').each(function(i, checkbox) {
                filters.push($(checkbox).val());
            });

            // console.log("Length"+filters.length);

            if ( filters.length >= 0 ) {
                // console.log(filters);
                $('#map_canvas').gmap('find', 'markers', { 'property': 'tags', 'value': filters, 'operator': 'OR' }, function(marker, isFound) {
                    // console.log(isFound);
                    if ( isFound ) {
                        marker.setVisible(true);
                        $('#map_canvas').gmap('addBounds', marker.position);
                    } else {
                        marker.setVisible(false);
                    }
                });
            }
        });
    }
});
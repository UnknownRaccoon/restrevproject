#= require rate
#= require map
#= require slimbox2.min
#= require cloudinary

window.onload = ->
    rate(gon.restaurant, false)
    $('.cloudinary-fileupload').bind('cloudinarydone', (e, data) ->  
        $('.fotorama').append("<a href=" + $.cloudinary.image(data.result.public_id, format: data.result.format, version: data.result.version, crop: 'fill', width: 150, height: 100) + " rel='lightbox' title='my caption'>image #1</a>"
        )   
        $('cloudinary-fileupload').val(data.result.public_id)
    )

google.maps.event.addDomListener window, 'load', ->
    initmap()
    marker = new google.maps.Marker
        map: map
        animation: google.maps.Animation.DROP
        draggable: true
        position:
            lat: gon.restaurant.x
            lng: gon.restaurant.y

    # Saving coordinates to inputs by clicking the map or dragging the marker
    google.maps.event.addListener map, 'click', (event) ->
        marker.setPosition event.latLng
        $('#lat').val event.latLng.lat()
        $('#lng').val event.latLng.lng()
        geocodeLatLng event.latLng

    google.maps.event.addListener marker,'dragend', (event) ->
        $('#lat').val event.latLng.lat()
        $('#lng').val event.latLng.lng()
        geocodeLatLng marker.getPosition

# Getting address from marker's location
geocodeLatLng = (pos) ->
    $.ajax('https://geocode-maps.yandex.ru/1.x/',
        data:
            sco: 'latlong'
            format: 'json'
            geocode: "#{pos.lat()}, #{pos.lng()}"
        dataType: 'json'
    ).done (result) ->
        $('input[name="review[address]"]').val result.response.GeoObjectCollection.featureMember[0].GeoObject.metaDataProperty.GeocoderMetaData.AddressDetails.Country.AddressLine

# For ukrainian streets google's geocoder sends ukrainian names only
#geocodeLatLng = (position) ->
#    geocoder = new google.maps.Geocoder
#    geocoder.geocode('location': position, (results, status)->
#        if status == google.maps.GeocoderStatus.OK
#            if results[1]
#                $('input[name="review[address]"]').val(results[0].formatted_address)
#            else $('input[name="review[address]"]').val("")
#        else $('input[name="review[address]"]').val("")
#    )

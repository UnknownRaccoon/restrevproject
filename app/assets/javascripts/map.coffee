# The script loads the map and centers it to the user's position. If geolocation fails the map will focus on the center of Odessa
window.initmap = ->
    window.map = new google.maps.Map document.getElementById('map'),
        center: new google.maps.LatLng 46.4711427, 30.7396057
        zoom: 14
    navigator.geolocation.getCurrentPosition (position) ->
        map.setCenter lat: position.coords.latitude, lng: position.coords.longitude
    , ->

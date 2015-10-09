#= require map
#= require rate

# Script file for the main page

rev = JSON.parse(gon.restaurants)

window.onload = ->      # Loading
    rate r for r in rev # the ratings

google.maps.event.addDomListener(window, 'load', ->
    initmap()
    infoW = new google.maps.InfoWindow

    # Adding markers and labels for them
    markers = []
    for r in rev
        marker = new google.maps.Marker(
            position: new google.maps.LatLng(r.x, r.y),
            map: map
            label: r.name[0]
        )
        marker.addListener('click', ->
            for m of markers
                if markers[m] == this
                    infoW.setContent(m) 
                    infoW.open(map, this)
        )
        markers[r.name + '<br />' + r.comment] = marker
)
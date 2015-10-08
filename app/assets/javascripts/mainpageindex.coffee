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
    cnt = []
    for r in rev
        cnt.push(r.name + '<br />' + r.comment)
        marker = new google.maps.Marker(
            position: new google.maps.LatLng(r.x, r.y),
            map: map
            label: r.name[0]
        )
        marker.addListener('click', ->
            j = 0
            while j < cnt.length
                if this.getPosition() == markers[j].getPosition()
                    infoW.setContent(cnt[j]) 
                    infoW.open(map, this)
                    break
                j++
        )
        markers.push(marker)
)
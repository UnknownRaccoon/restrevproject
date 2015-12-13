(function() {
  var rev;

  rev = JSON.parse(gon.restaurants);

  $(document).ready(function() {
    var didScroll, i, init, len, r, scrollPage, scrollY;
    for (i = 0, len = rev.length; i < len; i++) {
      r = rev[i];
      rate(r);
    }
    $('a.page-scroll').bind('click', function(event) {
      var $anchor;
      $anchor = $(this);
      $('html, body').stop().animate({
        scrollTop: $($anchor.attr('href')).offset().top - 60
      }, 1500, 'easeInOutExpo');
      return event.preventDefault();
    });
    didScroll = false;
    init = function() {
      return window.addEventListener('scroll', function(event) {
        if (!didScroll) {
          didScroll = true;
          return setTimeout(scrollPage, 250);
        }
      }, false);
    };
    scrollPage = function() {
      var sy;
      sy = scrollY();
      if (sy >= 300) {
        $('.navbar-default').addClass('navbar-shrink');
      } else {
        $('.navbar-default').removeClass('navbar-shrink');
      }
      return didScroll = false;
    };
    scrollY = function() {
      return window.pageYOffset || document.documentElement.scrollTop;
    };
    return init();
  });

  initmap();

  google.maps.event.addDomListener(window, 'load', function() {
    var i, infoW, len, marker, markers, r, results;
    markers = [];
    infoW = new google.maps.InfoWindow;
    results = [];
    for (i = 0, len = rev.length; i < len; i++) {
      r = rev[i];
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(r.x, r.y),
        map: map,
        label: r.name[0]
      });
      marker.addListener('click', function() {
        var m, results1;
        results1 = [];
        for (m in markers) {
          if (markers[m] === this) {
            infoW.setContent(m);
            infoW.open(map, this);
            break;
          } else {
            results1.push(void 0);
          }
        }
        return results1;
      });
      results.push(markers["<a href='reviews/" + r.id + "'>" + r.name + "</a><br /><small>" + r.address + "</small><br />" + r.comment] = marker);
    }
    return results;
  });

}).call(this);

function refreshMap() {
  address =  $('#suggestions ul li:first-child small').text() || $('#suggestions ul li:first-child ').text();
  GMaps.geocode({
    address: address,
    callback: function(results, status) {
      if (status == 'OK') {

        map = new GMaps({
          el: '#map',
          lat: 51.5072,
          lng: 0.1275
        });

        var latlng = results[0].geometry.location;
        map.setCenter(latlng.lat(), latlng.lng());
        map.addMarker({
          lat: latlng.lat(),
          lng: latlng.lng()
        });
      }
    }
  });
  $('#prevelant-location .location').text($('#suggestions ul li:first-child .place').text());

  return map;
}


$(window).resize(function() {
  process();
});


function process() {
  console.log("ASDSAD");
  $('#map').css('height', parseInt($(window).height()*0.75));
  map = refreshMap();
  google.maps.event.trigger(map, 'resize');
};

$('document').ready(function(){
  process();

  $('#suggestions ul').sortable().bind('sortupdate', function() {
    process();
  });

  refreshMap();
});


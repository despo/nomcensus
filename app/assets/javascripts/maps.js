function getAddress() {
  var address = $('#suggestions ul li:first-child small').text() || $('#suggestions ul li:first-child .place').text() || $('#place_name').val();
  return address;
};

function refreshMap(address) {
  var map = "";
  GMaps.geocode({
    address: address,
    callback: function(results, status) {
      if (status == 'OK') {
        var latlng = results[0].geometry.location;

        map = new GMaps({
          el: '#map',
            lat: latlng.lat(),
            lng: latlng.lng()
        });

        map.setCenter(latlng.lat(), latlng.lng());
        map.addMarker({
          lat: latlng.lat(),
          lng: latlng.lng()
        });
      }
    }
  });
  text = $('#pevelant-location .location').text($('#suggestions ul li:first-child .place').text());

  if (text) {
    $('#prevelant-location .location').text($('#suggestions ul li:first-child .place').text());
  }

  return map;
}

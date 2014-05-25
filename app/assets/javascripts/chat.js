function attachSortable(address) {
  $('#suggestions li:not(.suggestion)').on("click", function(){
    place = $(this).attr('data-place-slug');
    chat = $(this).attr('data-chat-slug');
    if (place == null) {
      return;
    }
    process($(this).find('small').text());
    var jqxhr = $.post( "/" + chat + "/places/" + place + "/vote", function() {
    }).done(function(data) {
      $('#suggestions ul').html(data);
      attachSortable();
      $('li[data-place-slug='+place+']').attr('selected', true);

    }).fail(function(){
    })
  });
}

function process(address) {
  $('#map').css('height', parseInt($(window).height()*0.75));
  map = refreshMap(address);
  google.maps.event.trigger(map, 'resize');
};

$(window).resize(function() {
  var address = getAddress();
  process(address);
});

function ready() {
  $('#chat_date').pickadate();
  $('#chat_time').pickatime();
  $('#place_name, #place_address').on('blur', function() {
    process($(this).val());
  });

  address = $('#suggestions ul li:first-child small').text() || $('#suggestions ul li:first-child ').text().trim();
  process(address);
  attachSortable();
}

$('document').ready(function(){
  ready();
});

$(document).on('page:load', ready);

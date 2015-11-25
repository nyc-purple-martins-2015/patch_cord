$(document).ready(function(){

  // fix to get sound cloud to work
  $('a[href*="soundcloud.com"]').each(function(){
      var $link = $(this);
      $.getJSON('http://soundcloud.com/oembed?format=js&url=' + $link.attr('href') + '&iframe=true&callback=?'), function(response){
       $link.replaceWith(response.html);
      }
  });

  $(".media-resources").hide()

  $('.link_media_resources').on('click', function(event){
    event.preventDefault();

    $(".button_to").children().attr("value", "Bio Information")
    $("#inner-container").slideToggle()
    $(".media-resources").show();

});
});

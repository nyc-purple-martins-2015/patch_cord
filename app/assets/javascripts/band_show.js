$(document).ready(function(){
  $('.link_media_resources').on('click', function(event){
    event.preventDefault();
    var id = event.target.dataset.id;
    $.ajax({
      method: "get",
      url: "/mediaresources/" + id,
    })
    .done(function(response){
      $('.media-resources').html(response)
        $('a[href*="soundcloud.com"]').each(function(){
        var $link = $(this);
        $.getJSON('http://soundcloud.com/oembed?format=js&url=' + $link.attr('href') + '&iframe=true&callback=?', function(response){
         $link.replaceWith(response.html);
    });
  });

    });
  });
});

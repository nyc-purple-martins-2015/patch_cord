$(document).ready(function(){

  // fix to get sound cloud to work
  $('a[href*="soundcloud.com"]').each(function(){
    var $link = $(this);
    debugger
    $.getJSON('http://soundcloud.com/oembed?format=js&url=' + $link.attr('href') + '&iframe=true&callback=?', function(response){
    $link.replaceWith(response.html);
      });
    });
  });


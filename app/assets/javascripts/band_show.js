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
    });
  });
});

$(document).ready(function(){
  $('#musician-band-search').on("submit", function(event){
    event.preventDefault();
    $.ajax({
      method: "post",
      url: "/search",
      data: $(event.target).serialize()
    })
    .done(function(response){
      console.log(response)
      $('.original-homepage').replaceWith(response)
      });
    });

  $('.homepage').on("submit", "#band-search-genre", function(event){
    event.preventDefault();
    $.ajax({
      method: "post",
      url: "bands/search",
      data: $(event.target).serialize()
    })
    .done(function(response){
      console.log(response)
      $('#band-search-genre').replaceWith(response)
      });
    });

   $('.homepage').on("submit", "#musician-search-genre", function(event){
    event.preventDefault();
    $.ajax({
      method: "post",
      url: "users/search",
      data: $(event.target).serialize()
    })

    .done(function(response){
      console.log(response)
      $('#musician-search-genre').replaceWith(response)
      });
    });

    $('.homepage').on("submit", "#musicians-instruments-search", function(event){
    event.preventDefault();
    $.ajax({
      method: "post",
      url: "users/search",
      data: $(event.target).serialize()
    })

    .done(function(response){
      console.log(response)
      $('#musicians-instruments-search').replaceWith(response)
      });
    });

  });

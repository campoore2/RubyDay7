var page_title = ""
$(function(){
  page_title = $('title').text()
  $("#" + page_title).addClass("active");

  $("#clear").click(function(e){
    $(location).attr('href', '/'+page_title+'/clear')
  });

  $("#food").click(function(e){
    $(location).attr('href', '/' + page_title + '/edit/'+ $('#pet_id').text() + '/food/')
  });
  $('#activity').click(function(e){
    $(location).attr('href', '/' + page_title + '/edit/'+ $('#pet_id').text() + '/activity/')
  });
  $('#sleep').click(function(e){
    $(location).attr('href', '/' + page_title + '/edit/'+ $('#pet_id').text() + '/sleep/')
  })
});

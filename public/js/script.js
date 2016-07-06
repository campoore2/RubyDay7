var page_title = ""
$(function(){
  page_title = $('title').text()
  $("#" + page_title).addClass("active");

  $("#clear").click(function(e){
    $(location).attr('href', '/tasks/clear')
  });
});

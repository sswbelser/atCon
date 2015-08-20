$(function(){
  console.log("this is working")
  $("body").on("click", ".edit-btn", function(e){
    e.preventDefault()

    var $body = $(this).parent().find("p").first().text();
    var $f = $(this).siblings("div").find("form");

    $("#new-post").toggleClass("hide");
    $f.toggleClass("hide");

    $f.find("textarea").text($body);
    getNum($(this),$f );

    function getNum(element, f){
      var num = $(element).attr("href");
      num = num.split("/");
      var actionStr = "/posts/"+num[2]
      f.attr("action", actionStr) 
    }
  });
});
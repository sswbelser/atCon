$(function(){
  console.log("this is working")
  $("body").on("click", ".edit-btn", function(e){
    e.preventDefault()

    var $body = $(this).prev().find("p").text();

    $("#new-post").toggleClass("hide");
    $("#edit-post").toggleClass("hide");
    $("textarea").text($body);
    getNum($(this));

    function getNum(element){
      var num = $(element).attr("href");
      num = num.split("/");
      var actionStr = "/posts/"+num[2]
      $("#edit-post").attr("action", actionStr) 
    }
  });
});
$(document).ready(function(){
  console.log("this is working")
  $("body").on("click", ".edit-btn", function(e){
    e.preventDefault()

    var $body = $(this).prev().find("p").text();

    $("#new-post").addClass("hide");
    $("#edit-post").removeClass("hide");
    $("textarea").text($body);
    getNum($(this));

    function getNum(element){
      //var num = $("#edit-post").attr("action")
      //console.log("this is edit post",num);
      var num = $(element).attr("href");
      num = num.split("/");
      console.log(num[2]);
      var actionStr = "/posts/"+num[2]
      $("#edit-post").attr("action", actionStr) 
      console.log($("#edit-post").attr("action"));

    }

  });
});
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


  $("body").on("click", "#going-btn", function(e){

    if ($(this).hasClass("going") ){
      console.log("you are already going")
    }else{
    $.ajax({
      url: "/rsvps",
      type: "POST",
      data: {rsvp:{event_id: $(this).attr("data-index")}},
      success: function(data){
        $("#going-btn").addClass("going").removeClass("not-going");
        console.log("this rsvp was added", data);
        $("not-going-btn").attr("data-r","data.id")
        location.reload();
      },
      error: function(err){
        console.log(err);
      }
    });
  }
  });

  $("body").on("click", "#not-going-btn", function(e){

    var rsvp_event_id = $(this).attr("data-index")
    var rsvp_user_id = $(this).attr("data-user")
    var that_rsvp_id = $(this).attr("data-r")
    $.ajax({
      url: "/rsvps/"+ that_rsvp_id,
      type: "DELETE",
      data: {rsvp:{user_id: rsvp_user_id, event_id: rsvp_event_id }},
      success: function(data){
  
        $("#going-btn").removeClass("going").addClass("not-going");
        console.log("this rsvp was deleted", data);
        location.reload();
      },
      error: function(err){
        console.log(err);
      }
    });
  
  });
});
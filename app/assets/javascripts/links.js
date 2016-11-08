$(document).ready(function(){
  markLinkAsRead();
})

  function markLinkAsRead(link){
    $(".linked-list").on("click", ".mark-read", function(){
      var $linkId = $(this).closest(".link")
      var id = $linkId.data("id")
      var user = $linkId.data("user")
      var data = $linkId.data("read")
      $.ajax({
        url: "/api/v1/links/" + id,
        type: "put",
        data: {data: data, user: user}
      }).fail(manageError)
    })
  }

  function manageError(error){console.log(error)}

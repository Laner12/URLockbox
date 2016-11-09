$(document).ready(function(){
  markLinkAsRead();
  markLinkAsUnread();
})

  function markLinkAsUnread(){
    $(".linked-list").on("click", ".mark-unread", function(){
      var $linkId = $(this).closest(".link")
      var id = $linkId.data("id")
      var user = $linkId.data("user")
      var data = $linkId.data("unread")
      $.ajax({
        url: "/api/v1/links/" + id,
        type: "PATCH",
        data: {data: data, user: user}
      }).fail(manageError)
    })
  }

  function markLinkAsRead(){
    $(".linked-list").on("click", ".mark-read", function(){
      var $linkId = $(this).closest(".link")
      var id = $linkId.data("id")
      var user = $linkId.data("user")
      var data = $linkId.data("read")
      $.ajax({
        url: "/api/v1/links/" + id,
        type: "PATCH",
        data: {data: data, user: user}
      }).fail(manageError)
    })
  }

  function manageError(error){console.log(error)}

$(document).ready(function(){
  gatherLinks();
})

  function gatherLinks(){
    $.ajax({
      url: "/api/v1/links",
      type: "get"
    }).then(formatLinks)
    .then(renderLinks)
    .fail(manageError)
  }

  function formatLinks(linkData){
    return linkData.map(createHTML)
  }

  function createHTML(link){
    return $("<div class='link row well' data-up='up' data-down='down' data-all='"
          + link.title +" "+ link.url +"' data-id='"
          + link.id
          + "'><p contenteditable='true' class='input-field-title'>"
          + link.title
          + "</p><p><a href='"
          + link.url
          +"' class='input-field-url>"
          + link.url
          +"</a></p>")
          readStatus(link);
          // + "<div class='read-status-buttons'>"
          // + "<button name='button-up' class='thumbs-up btn btn-primary'>Upvote</button>"
          // + "<button name='button-down' class='thumbs-down btn btn-danger'>Downvote</button>"
          // + "</div>"
          // + "<div class='text-right'>"
          // + "<button id='delete-button' name='button-delete' class='btn btn-secondary text-right' value='Delete'>Delete</button>"
          // + "</div>"
          // + "</div>")
  }

  function readStatus(link){
    if (link.read === "false") {
      return "<button name='button-mark-as-read' class='btn btn-primary'>Mark as Read</button>"
    } else {
      return "<button name='button-mark-as-unread' class='btn btn-primary'>Mark as Unread</button>"
    }
  }

  function renderLinks(linkData){
    $(".linked-list").html(linkData)
  }

  function manageError(error){console.log(error)}

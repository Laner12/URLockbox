$(document).ready(function(){
  alphabeticalSort();
})

  function alphabeticalSort(){
    $(".alphabetical").on("click", function(){
      $links = $(".linked-list").find(".link")
      $alphabeticalLinks = $links.sort(function(a, b){
        var alpha = $(a).find(".link-title").text().toLowerCase();
        var beta = $(b).find(".link-title").text().toLowerCase();
        
        if (alpha < beta) {
          return -1;
        } else if (alpha > beta) {
          return 1;
        } else {
          return 0;
        }
      });
      $('.linked-list').html($alphabeticalLinks);
    })
  }

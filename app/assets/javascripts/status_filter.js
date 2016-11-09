$(document).ready(function(){
  searchTerm();
})

  function searchTerm(){
    $(".read-status-filter").on("click", function(){
      var $links = $(".link-status-true")
      $.each($links, function(index, link){
        debugger
      })
      // .find(".link")
      // $.each($links, function(link){
      //   var status = $(link).find('.link-status-true').selector
      //   if (status) {
      //     $(link).show();
      //   } else {
      //     $(link).hind();
      //   }
      // })
    })
  }

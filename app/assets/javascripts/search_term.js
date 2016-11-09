$(document).ready(function(){
  searchTerm();
})

  function searchTerm(){
    $("#search-field").on("keyup", function(){
      var currentValue = this.value.toLowerCase();
      $(".link").each(function(index, link){
        $link = $(link);
        if($link.find(".link-title").text().toLowerCase().indexOf(currentValue) !== -1 ) {
          $link.show();
        } else if ($link.find(".link-url").text().toLowerCase().indexOf(currentValue) !== -1) {
          $link.show();
        }else {
          $link.hide();
        }
      })
    })
  }

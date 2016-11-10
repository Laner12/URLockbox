$(document).ready(function(){
  tagFilter();
})

  function tagFilter(){
    $(".tag-button").on("click", function(){
      var buttonName = this.innerText;
      $(".link").each(function(index, link){
        $link = $(link)
        var seperateTags = $link.find(".link-tags").text().toLowerCase().split("\n")

        var tagListRaw = seperateTags.filter(function(word) { return /\S/.test(word) })

        var output = tagListRaw.map(function(tag){ return tag.trim() })

        if(output.includes(buttonName)) {
          $link.show();
        }else {
          $link.hide();
        }
      })
    })
  }

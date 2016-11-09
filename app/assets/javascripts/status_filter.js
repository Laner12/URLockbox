$(document).ready(function(){
  searchFilterRead();
  searchFilterUnread();
  searchFilterReset();
})

  function searchFilterRead(){
    $(".read-status-filter").on("click", function(){
      $(".link-status-false").hide();
      $(".link-status-true").show();
    })
  }

  function searchFilterUnread(){
    $(".unread-status-filter").on("click", function(){
      $(".link-status-true").hide();
      $(".link-status-false").show();
    })
  }

  function searchFilterReset(){
    $(".all-links").on("click", function(){
      $(".link-status-true").show();
      $(".link-status-false").show();
    })
  }

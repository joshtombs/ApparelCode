$(document).on('click', '.strip-button', {},
  function(e) {
    e.stopPropagation();
    e.preventDefault();
    var $sideBarDIV = $('.side-nav');
    var $contentDIV = $('.content');

    if (($sideBarDIV.position().left == 0)&&($sideBarDIV.is(":visible"))){  
      $sideBarDIV.animate({ left: -$sideBarDIV.outerWidth() }, { duration: 200, queue: false, complete: function(){
        $(".side-nav").hide();
        $contentDIV.removeClass("col-md-10");
        $contentDIV.removeClass("col-sm-10");
        $contentDIV.addClass("col-md-12");
        $contentDIV.addClass("col-sm-12");
      }});
    }
    else{
      $sideBarDIV.show();
      $sideBarDIV.animate({ left: 0 }, { duration: 200, queue: false });
      $contentDIV.removeClass("col-md-12");
      $contentDIV.removeClass("col-sm-12");
      $contentDIV.addClass("col-md-10");
      $contentDIV.addClass("col-sm-10");
    }
  }
);

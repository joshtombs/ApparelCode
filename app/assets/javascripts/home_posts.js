$(document).on('mouseenter', '.post-container', {},
  function(e) {
    e.stopPropagation();
    e.preventDefault();
    console.log('hover');
    var topCaption =  $($($(e.target)).find(".caption.top"));
    var botCaption =  $($($(e.target)).find(".caption.bottom"));
    topCaption.animate({top: 0}, { duration: 100, queue: false });
    botCaption.animate({bottom: 0}, { duration: 100, queue: false });
  }
);

$(document).on('mouseleave', '.post-container', {},
  function(e) {
    e.stopPropagation();
    e.preventDefault();
    console.log('leave');
    var topCaption =  $($($(e.target)).find(".caption.top"));
    var botCaption =  $($($(e.target)).find(".caption.bottom"));
    console.log(topCaption);
    topCaption.animate({top: -40}, { duration: 100, queue: false });
    botCaption.animate({bottom: -40}, { duration: 100, queue: false });
  }
);

$(document).ready(function(){

  var content = $('#output');
  var pageIndex = 0;
  var pages = window.pages;

  var setFontSize = function(){
    var h = $(window).height();
    var lineHeight = parseFloat(content.css('line-height'));
    var fontSize = parseFloat(content.css('font-size'));
    var k = fontSize / lineHeight;

    content.css('font-size', k * h / 20 + 'px');
  };

  var showPage = function(){
    content.text(pages[pageIndex]);
    sh_highlightDocument();
    window.location.hash = '#' + (pageIndex + 1)
  };

  var movePage = function(d){
    pageIndex = Math.max(0, Math.min(pages.length - 1, pageIndex + d));
    showPage();
  };

  var keyPressed = function(ev){
    switch (ev.which) {
      case 37: // left
      case  8: // backspace
        movePage(-1);
        break;
      case 39: // right
      case 32: // space
        movePage(+1);
        break;
    }
  };

  $(window).resize(setFontSize);
  $(window).keydown(keyPressed);

  if (window.location.hash) {
    pageIndex = parseInt(window.location.hash.slice(1), 10) - 1;
  }

  setFontSize();
  showPage();
});

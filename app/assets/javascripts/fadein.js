$(function(){
  function animation(){
    $('.third').each(function(){
      var target = $(this).offset().top;

      var scroll = $(window).scrollTop();

      var windowHeight = $(window).scrollTop();

      if (scroll > target - windowHeight){
        $(this).css('opacity', '1');
        $(this).css('transform', 'translateX()')
      }
    });
    $('.forth').each(function(){
      var target = $(this).offset().top;

      var scroll = $(window).scrollTop();

      var windowHeight = $(window).scrollTop();

      if (scroll > target - windowHeight){
        $(this).css('opacity', '1');
        $(this).css('transform', 'translateX()')
      }
    });
  }
  animation();
  $(window).scroll(function(){
    animation();
  });
});
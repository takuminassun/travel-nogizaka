$(function(){
  function animation(){
    $('.third').each(function(){
      var target = $(this).offset().top;

      var scroll = $(window).scrollTop();

      var windowHeight = $(window).scrollTop();

      if (scroll > target - windowHeight){
        $(this).css('opacity', '1');
        $(this).css('transform', 'translateX(0)')
      }
    });
    $('.forth').each(function(){
      var target = $(this).offset().top;

      var scroll = $(window).scrollTop();

      var windowHeight = $(window).scrollTop();

      if (scroll > target - windowHeight){
        $(this).css('opacity', '1');
        $(this).css('transform', 'translateX(0)')
      }
    });
  }
  animation();
  $(window).scroll(function(){
    animation();
  });
});

$('.slide-nav').on('click', function(e) {
    e.preventDefault();
    // get current slide
    var current = $('.Flex_activo').data('slide'),
      // get button data-slide
      next = $(this).data('slide');
  
    $('.slide-nav').removeClass('active');
    $(this).addClass('active');
  
    if (current === next) {
      return false;
    } else {
      $('.slider-pokemon').find('.contenedor_flexible[data-slide=' + next + ']').addClass('flex--preStart');
      $('.Flex_activo').addClass('animate--end');
      setTimeout(function() {
        $('.flex--preStart').removeClass('animate--start flex--preStart').addClass('Flex_activo');
        $('.animate--end').addClass('animate--start').removeClass('animate--end Flex_activo');
      }, 800);
    }
  });
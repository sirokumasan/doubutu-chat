$(function() {
  console.log('ok')
  $('.show__image').slick({
    dots: true,
    autoplay: true,
    autoplaySpeed: 3000,
    speed: 400,
    cssEase: 'ease',
    dots: false,
    arrows: false,
    infinite: true,
    swipe: true,
  });
  console.log('err')
});
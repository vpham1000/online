jQuery(document).ready(function ($) {

    setInterval(function () {
        moveRight();
    }, 3000);
  
  var slideCount = $('#slider ul li').length;
  var slideWidth = $('#slider ul li').width();
  var slideHeight = $('#slider ul li').height();
  var sliderUlWidth = slideCount * slideWidth;
  
  $('.sliderbox').css({ width: slideWidth, height: slideHeight });
  
  $('.sliderbox ul').css({ width: sliderUlWidth, marginLeft: - slideWidth });
  
    $('.sliderbox ul li:last-child').prependTo('.sliderbox ul');

    function moveLeft() {
        $('.sliderbox ul').animate({
            left: + slideWidth
        }, 200, function () {
            $('#.sliderbox li:last-child').prependTo('.sliderbox ul');
            $('#.sliderbox ul').css('left', '');
        });
    };

    function moveRight() {
        $('.sliderbox ul').animate({
            left: - slideWidth
        }, 200, function () {
            $('.sliderbox li:first-child').appendTo('.sliderbox ul');
            $('.sliderbox ul').css('left', '');
        });
    };

    

});    

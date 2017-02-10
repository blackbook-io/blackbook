$(document).on('turbolinks:load', function() {
  $('body').on('click', '.animation-demo .btn', function() {
    var animation = $(this).text();
    var cardImg = $(this).closest('.card').find('img');
    if (animation === "hinge") {
      animationDuration = 2100;
    } else {
      animationDuration = 1200;
    }

    cardImg.removeAttr('class');
    cardImg.addClass('animated ' + animation);

    setTimeout(function() {
      cardImg.removeClass(animation);
    }, animationDuration);
  });
});

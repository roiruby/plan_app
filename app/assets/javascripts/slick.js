$(document).on('turbolinks:load', function() {
    $('.slide-image').slick({
        dots: true,
        slidesToShow: 3,
        accessibility: true,
        autoplay: true,
        arrows: true,
        swipe: true,
        pauseOnHover: false,
        pauseOnDotsHover: false,
        infinite: true,
        // prevArrow: '<button class="slide-arrow prev-arrow"></button>',
        // nextArrow: '<button class="slide-arrow next-arrow"></button>',
        autoplaySpeed: 4500
    });
});
(function ($) {
    "use strict";



    /*---------------------------
     Commons Variables
     ------------------------------ */
    var $window = $(window),
            $body = $("body");

    /*---------------------------
     Menu Fixed On Scroll Active
     ------------------------------ */
    $(window).on("scroll", function (e) {
        var window_top = $(window).scrollTop() + 1;
        if (window_top > 250) {
            $(".sticky-nav").addClass("menu_fixed animated fadeInDown");
        } else {
            $(".sticky-nav").removeClass("menu_fixed animated fadeInDown");
        }
    });

    /*----------------------------------------
     Bootstrap dropdown               
     -------------------------------------------*/

    // Add slideDown animation to Bootstrap dropdown when expanding.

    $('.dropdown').on('show.bs.dropdown', function () {
        $(this).find('.dropdown-menu').first().stop(true, true).slideDown();
    });
    // Add slideUp animation to Bootstrap dropdown when collapsing.
    $('.dropdown').on('hide.bs.dropdown', function () {
        $(this).find('.dropdown-menu').first().stop(true, true).slideUp();
    });


    /*---------------------
     Home Slider
     ---------------------- */

    var homeSlider = new Swiper('.home-swiper', {
        loop: true,
        speed: 1000,
        effect: "fade",
        autoplay: {
            delay: 4000,
            disableOnInteraction: false,
        },

        pagination: {
            el: '.swiper-pagination',
            clickable: true
        },

        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
    });


    /*---------------------
     Category Slider
     ---------------------- */

    var categorySlider = new Swiper('.tab-slider.swiper-container', {
        loop: true,
        slidesPerView: 6,
        spaceBetween: 30,
        speed: 1500,
        // Navigation arrows
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',

        },
        breakpoints: {
            0: {
                slidesPerView: 2,
            },
            478: {
                slidesPerView: 2,
            },
            576: {
                slidesPerView: 3,
            },
            768: {
                slidesPerView: 4,
            },
            992: {
                slidesPerView: 5,
            },
            1200: {
                slidesPerView: 6,
            },
        },
    });

    /*---------------------------
     Testimonial Slider 
     ------------------------------ */

    var testiSlider = new Swiper('.content-top', {
        slidesPerView: 2,
        spaceBetween: 30,
        speed: 1500,
        loop: true,

        // Navigation arrows

        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },

        breakpoints: {
            0: {
                slidesPerView: 1,
            },
            478: {
                slidesPerView: 1,
            },
            576: {
                slidesPerView: 1,
            },
            768: {
                slidesPerView: 2,
            },
            992: {
                slidesPerView: 2,
            },
            1200: {
                slidesPerView: 2,
            },
        },
    });

    /*-------------------------------
     Feature Product Slider
     -------------------------------- */

    var productSlider = new Swiper('.feature-product-slider.swiper-container', {
        slidesPerView: 2,
        spaceBetween: 30,
        speed: 1500,
        loop: true,

        // Navigation arrows

        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },

        breakpoints: {
            0: {
                slidesPerView: 1,
            },
            478: {
                slidesPerView: 1,
            },
            576: {
                slidesPerView: 1,
            },
            768: {
                slidesPerView: 1,
            },
            992: {
                slidesPerView: 2,
            },
            1200: {
                slidesPerView: 2,
            },
        },
    });

    /*---------------------------
     Product Details Slider 
     ------------------------------ */

    var imagesSlider = new Swiper(".images-slider", {
        spaceBetween: 15,
        slidesPerView: 3,
        watchSlidesVisibility: true,
        watchSlidesProgress: true,
        loop: true,
    });
    var topImageSlider = new Swiper(".slider-top", {
        spaceBetween: 0,
        slidesPerView: 1,
        effect: 'fade',
        loop: true,
        fadeEffect: {
            crossFade: true,
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
        thumbs: {
            swiper: imagesSlider,
        },
    });

    var productSlider = new Swiper('.related-product-slider', {
        slidesPerView: 4,
        spaceBetween: 30,
        speed: 1000,
        loop: true,

        // Navigation arrows

        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },

        breakpoints: {
            0: {
                slidesPerView: 1,
            },
            478: {
                slidesPerView: 1,
            },
            576: {
                slidesPerView: 2,
            },
            768: {
                slidesPerView: 2,
            },
            992: {
                slidesPerView: 3,
            },
            1200: {
                slidesPerView: 4,
            },
        },
    });

    /*----------------------------
     Cart Plus Minus Button
     ------------------------------ */
    $(".qtybutton").on("click", function () {
        var $button = $(this);
        var oldValue = $button.parent().find("input").val();
        if ($button.text() === "+") {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            // Don't allow decrementing below zero
            if (oldValue > 1) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 1;
            }
        }
        $button.parent().find("input").val(newVal);
    });


    /*-------------------------------
     Create an account toggle
     ---------------------------------*/
//    $(".checkout-toggle2").on("click", function () {
//        $(".open-toggle2").slideToggle(1000);
//    });
//
//    $(".checkout-toggle").on("click", function () {
//        $(".open-toggle").slideToggle(1000);
//    });


    /*---------------------
     Scroll Up
     --------------------- */
//    $.scrollUp({
//        scrollText: '<i class="pe-7s-angle-up"></i>',
//        easingType: "linear",
//        scrollSpeed: 900,
//        animation: "fade",
//    });
//    /*---------------------
//     Countdown
//     --------------------- */
//    $("[data-countdown]").each(function () {
//        var $this = $(this),
//                finalDate = $(this).data("countdown");
//        $this.countdown(finalDate, function (event) {
//            $this.html(event.strftime('<span class="cdown hour"><span class="cdown-1">%-H</span><p>Hrs</p></span> <span class="cdown minutes"><span class="cdown-1">%M</span> <p>Min</p></span> <span class="cdown second"><span class="cdown-1"> %S</span> <p>Sec</p></span>'));
//        });
//    });
//
//    /*-----------------------------
//     Blog Gallery Slider 
//     -------------------------------- */
//    var swiper = new Swiper(".blog-post-media.swiper-container", {
//        slidesPerView: 1,
//        spaceBetween: 0,
//        loop: true,
//        autoplay: {
//            delay: 2000,
//            disableOnInteraction: false,
//        },
//        navigation: {
//            nextEl: ".swiper-button-next",
//            prevEl: ".swiper-button-prev",
//        },
//    });
//
//    /*---------------------------
//     Brand Logo
//     ------------------------------ */
//    var companyLogoSlider = new Swiper('.brand-slider.swiper-container', {
//        slidesPerView: 4,
//        speed: 1500,
//        loop: true,
//        autoplay: {
//            delay: 2000,
//            disableOnInteraction: false,
//        },
//        breakpoints: {
//
//            0: {
//                slidesPerView: 1,
//            },
//            480: {
//                slidesPerView: 2,
//            },
//            768: {
//                slidesPerView: 2,
//            },
//            992: {
//                slidesPerView: 3,
//            },
//            1200: {
//                slidesPerView: 4,
//            },
//        }
//    });
})(jQuery);

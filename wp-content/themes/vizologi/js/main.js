/* All custom scriptings/jquery functions will come here */

/* Ready function */
$(document).ready(function() {
    "use strict"; // Start of use strict

    // jQuery for page scrolling feature - requires jQuery Easing plugin
    $('.page-scroll a').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: ($($anchor.attr('href')).offset().top - 50)
        }, 1250, 'easeInOutExpo');
        event.preventDefault();
    });

    // Highlight the top nav as scrolling occurs
    $('body').scrollspy({
        target: '.navbar-fixed-top',
        offset: 51
    });

    // Closes the Responsive Menu on Menu Item Click
    $('.navbar-collapse ul li a').click(function() {
        $('.navbar-toggle:visible').click();
    });

    //apply class to main menu to give 100% height in mobile
    $('.navbar-toggle').click(function() {
        $('#mainNav').toggleClass("full-height");
    });

    // Offset for Main Navigation
    $('#mainNav').affix({
        offset: {
            top: 100
        }
    })

    //add placeholder for search
    $(".search-field").attr("placeholder", "Search canvas");

    //add attribute for search field on load
    $('.search-field').attr('autocomplete', 'off');

    //show data box on search
    $(".search-field").click(function() {
        $(".search-cat").addClass("active");
    });
    $(".search-field").keyup(function() {
        if ($(".search-field").val() != "") {
            $("input.search-submit").addClass("active");

        } else {
            $("input.search-submit").removeClass("active");
        }

    });
    $("#content, footer, .copy, .navbar-collapse").click(function() {
        $(".search-cat").removeClass("active");
    });

});
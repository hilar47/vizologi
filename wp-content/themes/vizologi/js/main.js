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


    // If scrolling upwards show shrinked menu
    /*  var lastScroll = 0;
     $(window).on('scroll', function() {

         var scroll = $(window).scrollTop();
         if (lastScroll - scroll > 0) {
             $("#mainNav").addClass("shrink");
         } else {
             $("#mainNav").removeClass("shrink");
         }
         lastScroll = scroll;

     }); */
    $(window).on('mousewheel DOMMouseScroll wheel', function(e) {
        var direction = (function() {

            var delta = (e.type === 'DOMMouseScroll' ?
                e.originalEvent.detail * -40 :
                e.originalEvent.wheelDelta);

            return delta > 0 ? 0 : 1;
        }());

        if (direction === 1) {
            $("#mainNav").removeClass("shrink");
        }
        if (direction === 0) {
            $("#mainNav").addClass("shrink");
        }
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
            if (!$('.clear-img').length) {
                $("<div class='clear-img'></div>").insertBefore(".search-field");
            }
        } else {
            $("input.search-submit").removeClass("active");
            $(".clear-img").remove();
        }

    });
    $("#content, footer, .copy, .navbar-collapse").click(function() {
        $(".search-cat").removeClass("active");
    });

    //clear btn in search
    $('body').on('click', '.search-field', function() {
        $('.search-field').val('');
        $("input.search-submit").removeClass("active");
        $(".clear-img").remove();
    });

    //Get canvas image width and apply it
    $('.img-holder img').on('load', function() {
        var width = $(this).width();
        var height = $(this).height();
        $(this).attr("width", width);
    });


    //load more for blogs
    jQuery('.load-more-blog a').on('click', function(e) {
        e.preventDefault();
        var link = jQuery(this).attr('href');
        jQuery('.load-more-blog').html('<span class="loader">Loading more Blogs...</span>');
        $.get(link, function(data) {
            var post = $("#masonry .item ", data);
            $('#masonry').append(post);
        });
        jQuery('.load-more-blog').load(link + ' .load_more a');
    });
	
	// Add class to share button of detail
$(".open-new").click(function(event) {
    event.preventDefault();
    $(this).toggleClass("active");
});

$('#set-accept-cookie').click(function() {
	var now = new Date();
  var time = now.getTime();
  var expireTime = time + 3600 * 1000 * 24 * 365;
  now.setTime(expireTime);
	document.cookie = "use_cookies=true; expires="+expireTime+"; path=/";
});

});
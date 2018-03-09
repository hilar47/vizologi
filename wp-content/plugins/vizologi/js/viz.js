var ratio = -1;
var isMobile = (/android|webos|iphone|ipad|ipod|blackberry|iemobile|opera mini/i.test(navigator.userAgent.toLowerCase()));

function calcRatio() {
    if (viewer != undefined && viewer.imageData != undefined) {
        ratio = (viewer.imageData.width / viewer.imageData.naturalWidth) * 100;
        zoom = ratio / 100;
        $('#slider1').attr('min', ratio);
        $('#slider1').attr('max', 100);
        $('.viewer-container').addClass('viewer-container-transparent');
    }
}

function doZoom(value) {
	viewer.options.zoomable = true;
    if (ratio == -1) {
        calcRatio();
    }
    zoom = value / 100;
    viewer.zoomTo(value / 100);
	viewer.options.zoomable = false;
}

var options = {
	zoomRatio: 0.5,
	movable: !isMobile,
    inline: true,
    navbar: false,
    toolbar: false,
    tooltip: false,
    button: false,
    title: false,
    keyboard: false,
	zoomable: false,
    url: 'data-original',
    ready: function(e) {
        $('.viewer-container').addClass('viewer-container-transparent');
    },
    show: function(e) {
        $('.viewer-container').addClass('viewer-container-transparent');
    },
    shown: function(e) {},
    hide: function(e) {},
    hidden: function(e) {},
    view: function(e) {
        calcRatio();
        $('.viewer-container').addClass('viewer-container-transparent');
    },
    viewed: function(e) {
        calcRatio();
        $('.viewer-container').addClass('viewer-container-transparent');
    }
};
var viewer = new Viewer(document.getElementById('canvas-company-image'), options);

var zoom = 0;
/* 
$('#bt-show-info').click(function(event) {
    event.preventDefault();
    $('#canvas-info').slideToggle("slow");
}); */

$('#bt-canvas-minus').click(function(event) {
	viewer.options.zoomable = true;
    window.location.href.substr(0, window.location.href.indexOf('#'));
    zoom = zoom - 0.15;
    if (zoom < (ratio / 100)) zoom = (ratio / 100);
    viewer.zoomTo(zoom);
    var slider1 = document.getElementById('slider1');
    slider1.MaterialSlider.change(zoom * 100);
	viewer.options.zoomable = false;
    event.preventDefault();
});

$('#bt-canvas-plus').click(function(event) {
	viewer.options.zoomable = true;
    window.location.href.substr(0, window.location.href.indexOf('#'));
    zoom = zoom + 0.15;
    if (zoom > 1) zoom = 1;
    viewer.zoomTo(zoom);
    var slider1 = document.getElementById('slider1');
    slider1.MaterialSlider.change(zoom * 100);
	viewer.options.zoomable = false;
    event.preventDefault();
});

$('#bt-canvas-close').click(function(event) {
    viewer.exit();
    $('.viewer-container').addClass('viewer-container-transparent');
	viewer.options.zoomable = false;
	if(isMobile) {
		viewer.options.movable = false;
		$(".viewer-container").css({"touch-action": "auto", "-ms-touch-action": "auto", "-webkit-touch-callout": "auto"});
	}
		
    $('#bt-canvas-close').hide();
    event.preventDefault();
})

$('#bt-canvas-full').click(function(event) {
    $('#bt-canvas-close').show();
    viewer.full();
    $('.viewer-container').removeClass('viewer-container-transparent');
	viewer.options.zoomable = true;
	if(isMobile) {
		viewer.options.movable = true;
		$(".viewer-container").css({"touch-action": "none", "-ms-touch-action": "none", "-webkit-touch-callout": "none"});
	}
    event.preventDefault();
});

$(document).ready(function() {
	if(isMobile) {
		$(".viewer-container").click(function(){
			$('#bt-canvas-full').trigger('click');
		});
	}
});

$(function() {
//----- OPEN
	$('[data-popup-open]').on('click', function(e)  {
		var targeted_popup_class = jQuery(this).attr('data-popup-open');
		$('[data-popup="' + targeted_popup_class + '"]').fadeIn(350);
		e.preventDefault();
	});
	//----- CLOSE
	$('[data-popup-close]').on('click', function(e)  {
		var targeted_popup_class = jQuery(this).attr('data-popup-close');
		$('[data-popup="' + targeted_popup_class + '"]').fadeOut(350);
		e.preventDefault();
	});
});
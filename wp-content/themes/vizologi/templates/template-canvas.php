<?php 
/*
Template Name: Canvas
*/

get_header();
?>
<a id="bt-canvas-close" href=""> close </a>

<style type="text/css">
#bt-canvas-close {
    z-index: 100000;
    position: fixed;
    top: 0;
    right: 0;
    padding: 20px;
    font-size: 42px;
    color: white;
    display: none;
}

.detail-bar-tools .open-new.active {
    background-color: #f27576;
}

.detail-bar-tools .open-new-share {
    position: absolute;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    width: 270px;
    height: 0px;
    top: 50%;
    opacity: 0;
    right: 10px;
    padding: 0 15px;
    background-color: #646464;
    -webkit-justify-content: space-around;
    -ms-flex-pack: distribute;
    justify-content: space-around;
    -webkit-align-items: center;
    -ms-flex-align: center;
    align-items: center;
    transition: all 0.25s ease-in-out;
    overflow: hidden;
}

@media only screen and (min-width: 1024px)
index.scss:296
.detail-bar-tools .open-new {
    -webkit-order: 6;
    -ms-flex-order: 6;
    order: 6;
    transition: all 0.25s ease-in-out;
}

.detail-bar-tools .open-new.active .open-new-share {
    height: 60px;
    top: 120%;
    opacity: 1;
    overflow: visible;
}

.detail-bar-tools .open-new-share-item {
    min-height: 0;
    height: auto;
}

@media only screen and (min-width: 1024px) {
.detail-bar-tools a {
    min-height: 100%;
}

.detail-bar-tools a.open-new-share-item {
    height: 60px;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-justify-content: center;
    -ms-flex-pack: center;
    justify-content: center;
    -webkit-align-items: center;
    -ms-flex-align: center;
    align-items: center;
    text-decoration: none;
    position: relative;
}
}

@media only screen and (min-width: 1024px) {
.detail-bar-tools .open-new-share {
    width: 300px;
    left: 285px;
    right: initial;
}
}

.viewer-fixed {
    background-color: rgba(0, 0, 0, .5);
}
</style>

<!-- Rating -->
<script rel="stylesheet" src="<?php echo content_url();?>/themes/vizologi/js/star-rating.min.js"></script>
<!-- Content -->
<?php while ( have_posts() ): the_post(); ?>
	<?php the_content(); ?>
<?php endwhile; ?>


<!-- Green Section slides -->
<?php
	get_template_part( 'template-parts/content', 'slides' );
?>
<script type="text/javascript">
$(document).ready(function() {
	val = $("#rating-value").val();
	if(val != "")
		$('#input-2').rating('update', val);
	
	$('.rating-stars').click(function() {
		vizologi.checkRating('<?php echo $_COOKIE["vizologi_user"]; ?>', '<?php echo $_REQUEST["slug"]; ?>', $('.caption').text());
	});

	var firstClick = true;

	//scroll based on location (canvas single page)
    $(window).scroll(function() {
		if($(window).scrollTop() == 0){
			$(".canvas-detail-bar").removeClass("detach");
			firstClick = true;
		}
		else{
			$(".canvas-detail-bar").addClass("detach");
		}
        
	});	

	$('#bt-show-info').click(function(event) {
		event.preventDefault();
		if(firstClick){
			$('#canvas-info').css("display", "block");
			$('html,body').animate({
				scrollTop: $(".canvas-detail-bar").offset().top-170},
			'slow');
			firstClick = false;
		} else {
			$('#canvas-info').slideToggle("slow");
		}
	});
});
</script>
<?php 
	get_footer();
?>

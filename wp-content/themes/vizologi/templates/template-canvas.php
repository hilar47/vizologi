<?php 
/*
Template Name: Canvas
*/

get_header();
?>
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

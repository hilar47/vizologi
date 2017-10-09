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
});
</script>
<?php 
	get_footer();
?>

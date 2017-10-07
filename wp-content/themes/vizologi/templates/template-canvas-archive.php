<?php 
/*
Template Name: Canvas Archive
*/

get_header();
?>
	<!-- Content -->
	<?php while ( have_posts() ): the_post(); ?>
		<?php the_content(); ?>
	<?php endwhile; ?>
<script type="text/javascript">
	$('#viz-archive-load-more').click(function () {
     	vizologi.getCanvasArchive(document.getElementById('canvas-archive-results'));
     });
</script>

<?php 
	get_footer();
?>

<?php 
/*
Template Name: Search
*/

get_header();
?>
	<!-- Content -->
	<?php while ( have_posts() ): the_post(); ?>
		<?php the_content(); ?>
	<?php endwhile; ?>
<script type="text/javascript">
	$('#viz-search-load-more').click(function () {
     	vizologi.getCompanies(document.getElementById('canvas-search-results'));
     });
</script>

<?php 
	get_footer();
?>

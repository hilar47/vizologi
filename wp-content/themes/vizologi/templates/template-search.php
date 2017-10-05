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


<?php 
	get_footer();
?>
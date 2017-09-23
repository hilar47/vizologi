<?php 
/*
Template Name: About
*/

get_header();
?>

<!-- Green Section slides -->
<?php
	get_template_part( 'template-parts/content', 'slides' );
?>

<!-- Content -->
<?php while ( have_posts() ): the_post(); ?>
	<?php the_content(); ?>
<?php endwhile; ?>



<?php 
	get_footer();
?>
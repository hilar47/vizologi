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
<?php 
	get_footer();
?>

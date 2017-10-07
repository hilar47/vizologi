<?php 
/*
Template Name: About
*/

get_header();
?>


<!-- Content -->
<div class="about">
 <?php while ( have_posts() ): the_post(); ?>
	<?php the_content(); ?>
<?php endwhile; ?> 

</div>



<?php 
	get_footer();
?>
<?php 
/*
Template Name: Inner Page - No Title
*/

get_header();
?>

<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<!-- Content -->
			<?php while ( have_posts() ): the_post(); ?>
				<?php the_content(); ?>
			<?php endwhile; ?>
		</div>
	</div>
</div>

<!-- Green Section slides -->
<?php
	get_template_part( 'template-parts/content', 'slides' );
?>

<?php 
	get_footer();
?>
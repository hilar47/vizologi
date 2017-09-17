<?php 
/*
Template Name: Inner Page
*/

get_header();
?>

<?php  
	//GET METABOX DATA
	//global $content_home_meta;
	//GET METABOX DATA FOR CURRENT POST
	//$meta = get_post_meta($post->ID, $content_home_meta->get_the_id(), true);
?>

<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<h1 class="title"><?php echo get_the_title( $post->ID );?></h1>
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
<?php
/**
 * The template for displaying all single posts
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/#single-post
 *
 * @package Vizology
 */

get_header(); ?>
<?php  
	//GET METABOX DATA
	global $content_home_meta;
	//GET METABOX DATA FOR CURRENT POST
	$meta = get_post_meta($post->ID, $content_home_meta->get_the_id(), true);
?>

<div class="header-img">
	<img src="<?php echo (isset($meta['cat1_img']) && !empty($meta['cat1_img'])) ? $meta['cat1_img'] : ''; ?>" alt="">
</div>

<?php
		while ( have_posts() ) : the_post();
?>

<div class="container blog">
	<small><?php echo get_the_date(); ?></small>
	<a class="cat" href=""><?php 
		$category = get_the_category( $post->ID );
		echo $category[0]->cat_name;?>
	</a>
	<h1 class="title"><?php echo get_the_title( $post->ID );?></h1>
	<!-- Content -->
		<?php the_content(); ?>
</div>

<?php
	the_post_navigation();

			// If comments are open or we have at least one comment, load up the comment template.
			/* if ( comments_open() || get_comments_number() ) :
				comments_template();
			endif; */

		endwhile; // End of the loop.
?>

<!-- Green Section slides -->
<?php
	get_template_part( 'template-parts/content', 'slides' );
?>
<?php
get_footer();

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
	<div class="col-sm-10 col-sm-offset-1">
		<small><?php echo get_the_date(); ?></small>
		<?php
			// Get the category name from the post	
			$category = get_the_category( $post->ID );
			// Get the ID of a given category		
			$category_id = get_cat_ID( $category[0]->cat_name );
			// Get the URL of this category
			$category_link = get_category_link( $category_id );
		?>

		<!-- <a class="cat" href="<?php echo esc_url( $category_link ); ?>"><?php
			echo $category[0]->cat_name;
			?>
		</a> -->
		
		<!-- tags -->
			<?php
				$tags = get_the_term_list( get_the_ID(), 'post_tag');
				echo $tags;
			?>
		<h1 class="title"><?php echo get_the_title( $post->ID );?></h1>
		<!-- Content -->
			<?php the_content(); ?>
	</div>
</div>

<section class="blog-navigation">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-lg-offset-3">
			<h3>Next reads</h3>
			<?php
			//	the_post_navigation();
			?>

			<?php $prevPost = get_previous_post(true);
				 if (!empty( $prevPost )) {
					$args = array(
						'posts_per_page' => 1,
						'include' => $prevPost->ID
					);
					$prevPost = get_posts($args);
					foreach ($prevPost as $post) {
						setup_postdata($post);
			?>
				<div class="item">
					<?php
						// Get the category name from the post	
						$category = get_the_category( $post->ID );
						// Get the ID of a given category		
						$category_id = get_cat_ID( $category[0]->cat_name );
						// Get the URL of this category
						$category_link = get_category_link( $category_id );
					?>
					<!-- <a class="cat" href="<?php echo esc_url( $category_link ); ?>"><?php
						echo $category[0]->cat_name;
						?>
					</a> -->
					<!-- tags -->
					<div class="tag-holder">
						<?php
							$tags = get_the_term_list( get_the_ID(), 'post_tag');
							echo $tags;
						?>
					</div>
					<a href="<?php the_permalink(); ?>">
						<h4><?php the_title(); ?></h4>
						<small><?php the_date('F j, Y'); ?></small>
					</a>
				</div>
			<?php
						wp_reset_postdata();
					} //end foreach
				} // end if
				
				$nextPost = get_next_post(true);
				 if (!empty( $nextPost )) {
					$args = array(
						'posts_per_page' => 1,
						'include' => $nextPost->ID
					);
					$nextPost = get_posts($args);
					foreach ($nextPost as $post) {
						setup_postdata($post);
			?>
				<div class="item">
					<!-- <a class="cat" href=""><?php 
						$category = get_the_category( $post->ID );
						echo $category[0]->cat_name;?>
					</a> -->
					<!-- tags -->
					<div class="tag-holder">
					<?php
						$tags = get_the_term_list( get_the_ID(), 'post_tag');
						echo $tags;
					?>
					</div>
					<a href="<?php the_permalink(); ?>">
						<h4><?php the_title(); ?></h4>
						<small><?php the_date('F j, Y'); ?></small>

					</a>
				</div>
			<?php
						wp_reset_postdata();
					} //end foreach
				} // end if
			?>
			</div>
		</div>
	</div>
</section>
<?php
	endwhile;
?>
<!-- Green Section slides -->
<?php
	get_template_part( 'template-parts/content', 'slides' );
?>
<?php
get_footer();

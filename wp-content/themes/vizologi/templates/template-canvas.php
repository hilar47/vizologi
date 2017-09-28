<?php 
/*
Template Name: Canvas
*/

get_header();
?>

<!-- Blog List -->
<section class="trending">
	<div class="container">

		<div class="row">
			<div class="masonry ajax_posts">
			<?php
				$temp = $wp_query;
				$wp_query = null;
				$wp_query = new WP_Query();
				$wp_query->query('showposts=6&post_type=post'.'&paged='.$paged);

				while ($wp_query->have_posts()) : $wp_query->the_post();
				?>

				<!-- LOOP: Usual Post Template Stuff Here -->
				<div class="item">
				  
					<div class="imageHolder">
						<a href="<?php the_permalink(); ?>">
							<?php the_post_thumbnail('full'); ?>
						</a>
					</div>

					<a class="category-name" href="">
						<?php
						/* $terms = get_the_terms($post->ID, 'blog_category' );
							if ($terms && ! is_wp_error($terms)) :
								$tslugs_arr = array();
								foreach ($terms as $term) {
									$tslugs_arr[] = $term->slug;
								}
								$terms_slug_str = join( " ", $tslugs_arr);
							endif;
							echo $terms_slug_str; */
						?>
					<?php 
						$category = get_the_category( $post->ID );
						echo $category[0]->cat_name;?>
					</a>
					
					<h1><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h1>
										
					<small><?php echo get_the_date(); ?></small>
					<a class="read-more" href="<?php the_permalink(); ?>">Read</a>
				</div>
				<?php endwhile; ?>
			
			</div>
		</div>
	</div>
</section>


<!-- Green Section slides -->
<?php
	get_template_part( 'template-parts/content', 'slides' );
?>


<?php 
	get_footer();
?>

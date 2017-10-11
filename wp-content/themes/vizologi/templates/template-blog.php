<?php 
/*
Template Name: Blog
*/

get_header();
?>
<!-- Rating -->
<script rel="stylesheet" src="<?php echo content_url();?>/plugins/vizologi/js/viz_canvas.js"></script>

<!-- Blog List -->
<section class="trending">
	<div class="container">

		<div class="row">
			<div class="masonry ajax_posts" id="masonry">
				<?php if (have_posts()) : ?>
						<?php
							$temp = $wp_query;
							$wp_query = null;
							$wp_query = new WP_Query();
							$wp_query->query('showposts=15&post_type=post'.'&paged='.$paged);

							while ($wp_query->have_posts()) : $wp_query->the_post();
							?>

							<!-- LOOP: Usual Post Template Stuff Here -->
							<div class="item">
							
								<div class="imageHolder">
									<a href="<?php the_permalink(); ?>">
										<?php the_post_thumbnail('full'); ?>
									</a>
								</div>

								<?php
									// Get the category name from the post	
									$category = get_the_category( $post->ID );
									// Get the ID of a given category		
									$category_id = get_cat_ID( $category[0]->cat_name );
									// Get the URL of this category
									$category_link = get_category_link( $category_id );
								?>
								<!-- <a class="category-name" href="<?php echo esc_url( $category_link ); ?>"><?php
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
								<h1><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h1>
													
								<small><?php echo get_the_date(); ?></small>
								<a class="read-more" href="<?php the_permalink(); ?>">Read</a>
							</div>
							<?php endwhile; ?>
			  
				<?php endif;  ?>
			</div>

			<!-- load more btn -->
			<?php if ( $wp_query->max_num_pages > 1 ) : ?>
				<div class="load-more-blog">
                	<input type="hidden" id="blog-page-length" value="<?php echo $wp_query->max_num_pages; ?>"/>
                    <span class="loader " style="display:none;">Loading more Blogs...</span>
					<?php next_posts_link( 'Load More' ); ?>
				</div>
			<?php endif;  ?>
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

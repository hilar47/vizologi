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

					<?php
						// Get the category name from the post	
						$category = get_the_category( $post->ID );
						// Get the ID of a given category		
						$category_id = get_cat_ID( $category[0]->cat_name );
						// Get the URL of this category
						$category_link = get_category_link( $category_id );
					?>
					<a class="category-name" href="<?php echo esc_url( $category_link ); ?>"><?php
						echo $category[0]->cat_name;
						?>
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

<button id="load-more-posts" class="">Load More</button>

<!-- Green Section slides -->
<?php
	get_template_part( 'template-parts/content', 'slides' );
?>
<script type="text/javascript">
$(document).ready(function() {
	 //ajax call 
	 $('#load-more-posts').click(function() {
		 	vizologi.paginateBlogPosts(<?php echo ($paged + 1); ?>, '<?php echo admin_url( 'admin-ajax.php' ) ?>');	 
		 });
});
</script>

<?php 
	get_footer();
?>

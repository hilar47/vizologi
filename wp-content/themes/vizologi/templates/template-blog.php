<?php 
/*
Template Name: Blog
*/

get_header();
?>

<!-- Canvas List -->
<section class="trending">
	<div class="container">

		<div class="row">
			<div class="masonry">
			<?php

			
				$temp = $wp_query;
				$wp_query = null;
				$wp_query = new WP_Query();
				$wp_query->query('showposts=6&post_type=blog'.'&paged='.$paged);

				while ($wp_query->have_posts()) : $wp_query->the_post();
				?>

				<!-- LOOP: Usual Post Template Stuff Here -->
				<div class="item">
				  <?php 
               $category = get_the_category( $post->ID );
               echo $category[0]->cat_name;?>

<div class="category-name">
    <?php
     $terms = get_the_terms($post->ID, 'blog_category' );
if ($terms && ! is_wp_error($terms)) :
    $tslugs_arr = array();
    foreach ($terms as $term) {
        $tslugs_arr[] = $term->slug;
    }
    $terms_slug_str = join( " ", $tslugs_arr);
endif;
echo $terms_slug_str;
    ?>
</div>



				<a href="<?php the_permalink(); ?>" target="_blank">
								<div class="imageHolder"><?php the_post_thumbnail('medium'); ?></div>
								<h1 class="title"><?php the_title(); ?></h1>
								<div class="date"><?php echo get_the_date(); ?></div>
								<div class="entry-content"><?php echo substr(strip_tags($post->post_content), 0, 350); ?>...</div>
							</a></div>
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
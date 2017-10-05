<?php
/**
 * Template part for displaying posts
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package Vizology
 */

?>
<div class="item" id="post-<?php the_ID(); ?>">
		<div class="imageHolder">
			<a href="<?php the_permalink(); ?>">
				<?php the_post_thumbnail('full'); ?>
			</a>
		</div>

		<h1 class="extra-pad"><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h1>
										
		<small><?php echo get_the_date(); ?></small>
		<a class="read-more" href="<?php the_permalink(); ?>">Read</a>
</div>



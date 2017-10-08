<?php
/**
 * The template for displaying archive pages
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package Vizology
 */

get_header(); ?>
	<section class="blog-category">
		<div class="container">
			
				<?php
					if ( have_posts() ) : ?>

						<header>
							 <p>Your search for</p>
							<?php
								the_archive_title( '<h1 class="page-title">', '</h1>' );
							//	the_archive_description( '<div class="archive-description">', '</div>' );
							?>
							<p>Resulted in the following blogs</p>
						</header><!-- .page-header -->

						<div class="masonry">
							<?php
							/* Start the Loop */
							while ( have_posts() ) : the_post();

								/*
								* Include the Post-Format-specific template for the content.
								* If you want to override this in a child theme, then include a file
								* called content-___.php (where ___ is the Post Format name) and that will be used instead.
								*/
								get_template_part( 'template-parts/content', get_post_format() );

							endwhile;

							//	the_posts_navigation();

							else :
							get_template_part( 'template-parts/content', 'none' );?>
						</div>
					<?php endif; ?>
			
		</div>
	</section>
<?php
get_footer();

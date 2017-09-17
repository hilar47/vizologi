<?php 
/*
Template Name: Page with Sidebar
*/

get_header();
?>

<div class="container">
	<div class="row">
		<div class="col-sm-3">
			<?php wp_nav_menu(array('theme_location' => 'sidebar', 'menu_class'=> 'sidebar-menu', 'container' => '')); ?>
		</div>
		<div class="col-sm-9 m-b-60">
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
<?php
/**
 * The header for our theme
 *
 * This is the template that displays all of the <head> section and everything up until <div id="content">
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package Vizology
 */

?>
<!doctype html>
<html <?php language_attributes(); ?>>
<head>
	<meta charset="<?php bloginfo( 'charset' ); ?>">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Vizologi - <?php the_title(); ?></title>
	<link rel="shortcut icon" type="image/png" href="<?php echo content_url();?>/themes/vizologi/favicon.png"/>
	<?php wp_head(); ?>
	<!-- jquery -->
	<script rel="stylesheet" src="<?php echo content_url();?>/themes/vizologi/js/jquery-3.1.1.min.js"></script>
	</head>

<body <?php body_class(); ?>>

<!-- Navigation/Header -->
<nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header page-scroll">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<?php echo esc_url( home_url( '/' ) ); ?>">
				<img src="<?php echo get_template_directory_uri();?>/images/logo-2x.png" class="img-responsive" />
			</a>
		</div>

		<!-- Search -->
		<div class="search hidden-xs">
		<?php get_search_form(); ?>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<!-- Mobile Search -->
			<div class="search visible-xs">
				<?php get_search_form(); ?>
			</div>
			<!-- dropdown menu -->
			<ul class="nav navbar-nav navbar-right custom-menu hidden-xs">
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">...</a>
					<?php wp_nav_menu(array('theme_location' => 'dropdown_menu', 'menu_class'=> 'dropdown-menu', 'container' => '')); ?>
				</li>
			</ul>

			<?php wp_nav_menu(array('theme_location' => 'in_header', 'menu_class'=> 'nav navbar-nav navbar-right')); ?>

			<!-- Mobile Bottom menu -->
			<?php wp_nav_menu(array('theme_location' => 'dropdown_menu', 'menu_class'=> 'mobile-bottom-menu nav navbar-nav visible-xs', 'container' => '')); ?>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>



<!-- Main Content -->
<main id="content" class="site-content">
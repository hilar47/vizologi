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
	<div class="container custom-container">
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
			<div class="search-cat">
				<h4>Or explore sectors:</h4>
				<ul>
					<li><a href="<?php echo home_url() ?>/business-strategy/case-studies/sector/energy%20%26%20utilities/">Energy & utilities</a></li>
					<li><a href="<?php echo home_url() ?>/business-strategy/case-studies/sector/consumer%20services/">Consumer services</a></li>
					<li><a href="<?php echo home_url() ?>/business-strategy/case-studies/sector/information%20%26%20media/">Information & media</a></li>
					<li><a href="<?php echo home_url() ?>/business-strategy/case-studies/sector/healthcare/">Healthcare</a></li>
					<li><a href="<?php echo home_url() ?>/business-strategy/case-studies/sector/technology/">Technology</a></li>
					<li><a href="<?php echo home_url() ?>/business-strategy/case-studies/sector/transportation/">Transportation</a></li>
					<li><a href="<?php echo home_url() ?>/business-strategy/case-studies/sector/telecommunications/">Telecommunications</a></li>
					<li><a href="<?php echo home_url() ?>/business-strategy/case-studies/sector/financials/">Financials</a></li>
					<li><a href="<?php echo home_url() ?>/business-strategy/case-studies/sector/consumer%20goods/">Consumer goods</a></li>
					<li><a href="<?php echo home_url() ?>/business-strategy/case-studies/sector/industrials/">Industrials</a></li>
				</ul>
			</div>
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
<?php if(!isset($_COOKIE["use_cookies"])) {  ?>
<section class="cookies">
	<div class="container">
		<div class="row">
				<div class="col-sm-10">
					<p>This web app uses cookies to compile statistic information of our users visits. By continuing to browse the site you are agreeing to our use of cookies.
				If you wish you may change your preference or <a href="<?php echo home_url() ?>/privacy-policy/">read about cookies</a> </p>
				</div>
				<div class="col-sm-2">
					<button id="set-accept-cookie">OK</button>
				</div>
</section>
<?php } ?>
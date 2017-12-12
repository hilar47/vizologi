<?php 
/*
Template Name: Canvas
*/

//get_header();
?>


<?php
//Custom Header
/**
 * The header for our theme
 *
 * This is the template that displays all of the <head> section and everything up until <div id="content">
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package Vizologi
 */

?>
<!doctype html>
<html <?php language_attributes(); ?>>
<head>
	<meta charset="<?php bloginfo( 'charset' ); ?>">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- <title>Vizologi - Business Models & Business Strategy <?php the_title(); ?></title> -->
	<title>Vizologi - Business Models & Business Strategy</title>
	<link rel="shortcut icon" type="image/png" href="<?php echo content_url();?>/themes/vizologi/favicon.png"/>
	<?php wp_head(); ?>
	<link rel="stylesheet" type="text/css" href="<?php echo content_url();?>/themes/vizologi/css/owl.carousel.css">
	<!-- jquery -->
	<script src="<?php echo content_url();?>/themes/vizologi/js/jquery-3.1.1.min.js"></script>
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


<!-- Header end -->





<a id="bt-canvas-close" href=""> close </a>

<style type="text/css">
#bt-canvas-close {
    z-index: 100000;
    position: fixed;
    top: 0;
    right: 0;
    padding: 20px;
    font-size: 42px;
    color: white;
    display: none;
}

.detail-bar-tools .open-new.active {
    background-color: #f27576;
}

.detail-bar-tools .open-new-share {
    position: absolute;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    width: 270px;
    height: 0px;
    top: 50%;
    opacity: 0;
    right: 10px;
    padding: 0 15px;
    background-color: #646464;
    -webkit-justify-content: space-around;
    -ms-flex-pack: distribute;
    justify-content: space-around;
    -webkit-align-items: center;
    -ms-flex-align: center;
    align-items: center;
    transition: all 0.25s ease-in-out;
    overflow: hidden;
}

@media only screen and (min-width: 1024px)
index.scss:296
.detail-bar-tools .open-new {
    -webkit-order: 6;
    -ms-flex-order: 6;
    order: 6;
    transition: all 0.25s ease-in-out;
}

.detail-bar-tools .open-new.active .open-new-share {
    height: 60px;
    top: 120%;
    opacity: 1;
    overflow: visible;
}

.detail-bar-tools .open-new-share-item {
    min-height: 0;
    height: auto;
}

@media only screen and (min-width: 1024px) {
.detail-bar-tools a {
    min-height: 100%;
}

.detail-bar-tools a.open-new-share-item {
    height: 60px;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-justify-content: center;
    -ms-flex-pack: center;
    justify-content: center;
    -webkit-align-items: center;
    -ms-flex-align: center;
    align-items: center;
    text-decoration: none;
    position: relative;
}
}

@media only screen and (min-width: 1024px) {
.detail-bar-tools .open-new-share {
    width: 300px;
    left: 285px;
    right: initial;
}
}

.viewer-fixed {
    background-color: rgba(0, 0, 0, .5);
}
</style>

<!-- Rating -->
<script rel="stylesheet" src="<?php echo content_url();?>/themes/vizologi/js/star-rating.min.js"></script>
<!-- Content -->
<?php while ( have_posts() ): the_post(); ?>
	<?php the_content(); ?>
<?php endwhile; ?>


<!-- Green Section slides -->
<?php
	get_template_part( 'template-parts/content', 'slides' );
?>
<script type="text/javascript">
$(document).ready(function() {
	var val = $("#rating-value").val();
	var userRate = $("#user-rate").val();
	
	if(parseFloat(userRate) > 0) {
		$('#input-2').rating('update', userRate);
		$('#input-2').rating('refresh',{displayOnly: true, showCaption: true});
	}else {
		$('#input-2').rating('update', val);
	}
	
	$('.rating-stars').click(function() {
		<?php $company = explode("-business-model-canvas",get_query_var('company',1)); ?>
		vizologi.checkRating('<?php echo $_COOKIE["vizologi_user"]; ?>', '<?php echo $company[0] ?>', $('.caption').text());
	});

	var firstClick = true;

	//scroll based on location (canvas single page)
    $(window).scroll(function() {
		if($(window).scrollTop() == 0){
            $(".canvas-detail-bar").removeClass("detach");
         //   $('#canvas-info').css("display", "none");
			firstClick = true;
		}
		else{
			$(".canvas-detail-bar").addClass("detach");
		}
        
	});	

	$('#bt-show-info').click(function(event) {
		event.preventDefault();
		if(firstClick){
			$('#canvas-info').css("display", "block");
			$('html,body').animate({
				scrollTop: $(".canvas-detail-bar").offset().top-170},
			'slow');
			firstClick = false;
		} else {
			$('#canvas-info').slideToggle("slow");
		}
	});
});
</script>
<?php 
	get_footer();
?>

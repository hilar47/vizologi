<?php
/**
 * Template part for displaying slides in footer
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package Vizology
 */

?>

<section id="footer-slider" class="footer-slider">
	<div class="container">
		<h1>Ok, a lot of business model canvas but, <br class="hidden-xs hidden-sm" />
		<span>what else?</span></h1>

		<!-- carousel -->
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="<?php echo get_template_directory_uri();?>/images/footer-slides/slide-dummy.jpg" />
				<a href="#" class="btn btn-black text-uppercase">Read more</a>
			</div>
			<div class="item">
				<img src="<?php echo get_template_directory_uri();?>/images/footer-slides/slide-dummy.jpg" />
				<a href="#" class="btn btn-black text-uppercase">Read more</a>
			</div>
			<div class="item">
				<img src="<?php echo get_template_directory_uri();?>/images/footer-slides/slide-dummy.jpg" />
				<a href="#" class="btn btn-black text-uppercase">Read more</a>
			</div>
		</div>

		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>

		<!-- Controls -->
		<!-- <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a> -->
		</div>

		
	</div>
</section><!-- .no-results -->

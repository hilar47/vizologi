<?php 
/*
Template Name: About
*/

get_header();
?>

<!-- Green Section slides -->
<?php
	get_template_part( 'template-parts/content', 'slides' );
?>

<section class="about">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<h4>About Vizologi...</h4>
				<h1>Vizologi is a "techgeek" business company.</h1>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-5">
				<p>We create global positive impact, helping individuals, companies and organizations through vision, strategy and creativity. </p>
			</div>
			<div class="col-sm-3 col-sm-offset-2">
				<p>From 1 to ∞ for existing business lines.</p>
			</div>
			<div class="col-sm-6 col-sm-offset-6 m-t-60">
				<p>From 0 to 1 for new disruptive business.</p>
			</div> 
		</div>
	</div>
</section>

<section class="about-bottom">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<h4>We believe...</h4>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-5">
				<img src="<?php echo get_template_directory_uri();?>/images/about-2.png"/>
			</div>
			<div class="col-sm-7">
				<h3>Every human is creative</h3>
				<p>Vizology builds human-centered platforms to unlock creativity, amplifying your intuition through knowledge and experience. </p>
			</div> 
		</div>

		<div class="row">
			<div class="col-sm-5">
				<img src="<?php echo get_template_directory_uri();?>/images/about-3.png"/>
			</div>
			<div class="col-sm-7">
				<h3>Every human is creative</h3>
				<p>Vizology builds human-centered platforms to unlock creativity, amplifying your intuition through knowledge and experience. </p>
			</div> 
		</div>

		<div class="row">
			<div class="col-sm-5">
				<img src="<?php echo get_template_directory_uri();?>/images/about-4.png"/>
			</div>
			<div class="col-sm-7">
				<h3>Every human is creative</h3>
				<p>Vizology builds human-centered platforms to unlock creativity, amplifying your intuition through knowledge and experience. </p>
			</div> 
		</div>
	</div>
</section>



<?php 
	get_footer();
?>
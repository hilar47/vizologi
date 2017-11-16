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
	
		<!-- carousel -->
		<div id="carousel-example-generic" class="carousel slide carousel-fade" data-ride="carousel" data-interval="false">

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item green active">
					<div class="container">
						<h1>Ok, a lot of business <br class="hidden-xs hidden-sm" />model canvas but...</h1>
						<div class="circle-container">
						<div class="circle">
							<div class="vertical-center">
							<h3>what else?</h3>
							<p>Ask yourself the right questions and find the right answers. <b>Vizologi</b> is more than a huuuuge business model collection.</p>
							</div>
						</div>
						</div>
					</div>
				</div>
		
				<div class="item yellow">
					<div class="container">
						<h1>What's happening <br class="hidden-xs hidden-sm" />in the Marketing Landscape?</h1>
						<div class="circle-container">
						<div class="circle">
							<div class="vertical-center">
								<h3>Learn</h3>
								<p>Try to understand the <b>HOW</b> behind the scene of each business model. <b>Knowledge</b> is power, and here you have a lot of <b>canvas</b> to improve it.</p>
							</div>
						</div>
						</div>
					</div>
				</div>
				
				<div class="item pink">
					<div class="container">
						<h1>How is the business model <br class="hidden-xs hidden-sm" />context connected?</h1>
						<div class="circle-container">
						<div class="circle">
							<div class="vertical-center">
							<h3>Discover</h3>
							<p>Explore the connections between the <b>neural network</b> and find the patterns. Experience the cognition journey to <b>boost your creativity</b>.</p>
							</div>
						</div>
					</div>
					</div>
				</div>
				
				<div class="item indigo">
					<div class="container">
						<h1>How can I change <br class="hidden-xs hidden-sm" />the game?</h1>
						<div class="circle-container">
							<div class="circle">
								<div class="vertical-center">
								<h3>Play</h3>
								<p>The best business model isn't written yet. Build something unique. <b>Hack your creativity</b> and break the rules to find the true innovation path.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<a href="<?php echo get_home_url(); ?>/about" class="btn btn-black text-uppercase pull-left read-more">Read more</a>
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				<li data-target="#carousel-example-generic" data-slide-to="3"></li>
			</ol>

			<!-- Controls -->
			 <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
				<img src="<?php echo get_template_directory_uri();?>/images/arrow-previous.png" class="prev" />
			</a>
			<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
				<img src="<?php echo get_template_directory_uri();?>/images/arrow-next.png" class="next" />
			</a> 
		</div>

		

</section><!-- .no-results -->

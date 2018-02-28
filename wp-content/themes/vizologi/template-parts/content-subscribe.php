<?php
/**
 * Template part for displaying subscription
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package Vizology
 */

?>


<section id="subscribe" class="subscribe">
	<div class="container">
		<div class="row">
			<div class="col-sm-offset-2 col-sm-8">
				<h1>Stay tuned!</h1>
				<p>Sign up for Vizologi newsletter for a time-to-time look into business model canvas <br class="hidden-xs hidden-sm" />updates and our next roadmap achievements.</p>
					 <div class="form-group">
                      	<?php // echo do_shortcode('[mc4wp_form id="300"]'); 
							$mailchimp = new MC4WP_Form_Output_Manager();
							echo $mailchimp->shortcode(array("id"=>"300"));
						?>
					</div>
			</div>
		</div>
	</div>
</section>
<?php
/**
 * The template for displaying the footer
 *
 * Contains the closing of the #content div and all content after.
 *
 *
 * @package Vizology
 */

?>

<!-- Subscription -->
<?php
	get_template_part( 'template-parts/content', 'subscribe' );
?>

</main><!-- #content -->

<!-- Footer -->
<footer>
	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<h3>Vizologi</h3>
				<?php wp_nav_menu(array('theme_location' => 'in_footer', 'menu_class'=> 'footer-menu menu1', 'container' => '')); ?>
			</div>

			<div class="col-sm-3">
				<?php wp_nav_menu(array('theme_location' => 'in_footer2', 'menu_class'=> 'footer-menu menu2', 'container' => '')); ?>
			</div>

			<div class="col-sm-6 social">
				<a href="https://twitter.com/vizologi" target="_blank"><i class="fa fa-twitter"></i></a>
				<a href="https://www.facebook.com/vizologi/" target="_blank"><i class="fa fa-facebook-square"></i></a>
				<a href="
https://www.linkedin.com/company/11166009/" target="_blank"><i class="fa fa-linkedin-square"></i></a>
				<!-- <a href="https://www.instagram.com/vizologi/" target="_blank"><i class="fa fa-instagram"></i></a> -->
				<a href="http://www.pinterest.com/vizologi/" target="_blank"><i class="fa fa-pinterest"></i></a>
			</div>

			

			
		</div>
	</div>
</footer>


<div class="copy">
	<div class="container">
		<div class="row">
			<div class="col-sm-4 hidden-xs">
				<img src="<?php echo get_template_directory_uri();?>/images/logo-2x.png" class="img-responsive" />
			</div>
			<div class="col-sm-8">
				<p>&copy;2017 Vizologi Inc. All rights reserved.</p>
			</div>
		</div>
	</div>
</div>


<?php wp_footer(); ?>



	
<script type="text/javascript">
	if (jQuery(window).width() <= 767) {
		document.write('<scri'+'pt src="<?php echo content_url();?>/themes/vizologi/js/owl.carousel.min.js"></'+'script>');	
	}
</script>
<!-- custom scripts -->
<script src="<?php echo content_url();?>/themes/vizologi/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.touchswipe/1.6.4/jquery.touchSwipe.min.js"></script>
<script src="<?php echo content_url();?>/themes/vizologi/js/main.js?ver=<?php echo time(); ?>"></script>
</body>
</html>

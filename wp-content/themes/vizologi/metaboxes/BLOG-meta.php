<div class="my_meta_control metabox">
<?php

global $wpalchemy_media_access1;

?>

<!-- Company/Position -->
<div class="postbox section-background">
	<h2 class="handle ui-sortable-handle">
		<span>Company/Position</span>
	</h2>
	<div class="inside">
		<div class="my_meta_control metabox">
			<?php $metabox->the_field('testimonial_position'); ?>
			<p><input type="text" name="<?php $metabox->the_name(); ?>" value="<?php $metabox->the_value(); ?>"/></p>
		</div>
	</div>
</div>


	


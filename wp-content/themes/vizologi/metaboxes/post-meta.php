<div class="my_meta_control metabox">
<?php

global $wpalchemy_media_access;

?>


<!-- Header image -->
<div class="postbox section-background">
	<div class="inside">
		<!-- image upload -->
		<label>Header Image</label>
		<?php $metabox->the_field('cat1_img'); ?>
		<?php $wpalchemy_media_access->setGroupName('cat1_img' . $mb->get_the_index())->setInsertButtonLabel('Insert'); ?>
		<p class="media-input">
			<?php echo $wpalchemy_media_access->getField(array('name' => $mb->get_the_name(), 'value' => $mb->get_the_value())); ?>
			<?php echo $wpalchemy_media_access->getButton(); ?>
		</p>
	</div>
</div>

	
	


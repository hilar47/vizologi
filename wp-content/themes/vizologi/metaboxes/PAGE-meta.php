<div class="my_meta_control metabox">
<?php

global $wpalchemy_media_access;

?>

<!-- Video -->
<div class="postbox section-background">
	<h2 class="handle ui-sortable-handle">
		<span>Video</span>
	</h2>
	<div class="inside">
		<div class="my_meta_control metabox">
			<?php $metabox->the_field('video_link'); ?>
			<?php $wpalchemy_media_access->setGroupName('video_link' . $mb->get_the_index())->setInsertButtonLabel('Insert'); ?>
			<p class="media-input">
				<?php echo $wpalchemy_media_access->getField(array('name' => $mb->get_the_name(), 'value' => $mb->get_the_value())); ?>
				<?php echo $wpalchemy_media_access->getButton(); ?>
			</p>
		</div>
	</div>
</div>

<!-- Slider -->
<div class="postbox section-background">
	<h2 class="handle ui-sortable-handle">
		<span>Slider</span>
	</h2>
	<div class="inside">
		<div class="my_meta_control metabox">
			<?php $metabox->the_field('slider_id'); ?>
			<p><input type="text" name="<?php $metabox->the_name(); ?>" value="<?php $metabox->the_value(); ?>"/></p>
		</div>
	</div>
</div>



<!-- Categories -->
<!-- category 1 -->
<div class="postbox section-background">
	<h2 class="handle ui-sortable-handle">
		<span>Category 1</span>
	</h2>
	<div class="inside">
		<!-- image upload -->
		<label>Column 1 Image</label>
		<?php $metabox->the_field('cat1_img'); ?>
		<?php $wpalchemy_media_access->setGroupName('cat1_img' . $mb->get_the_index())->setInsertButtonLabel('Insert'); ?>
		<p class="media-input">
			<?php echo $wpalchemy_media_access->getField(array('name' => $mb->get_the_name(), 'value' => $mb->get_the_value())); ?>
			<?php echo $wpalchemy_media_access->getButton(); ?>
		</p>
		
		<!-- image description -->
		<label>Column 1 Name</label>
		<div class="my_meta_control metabox">
			<?php $metabox->the_field('cat1_name'); ?>
			<p><input type="text" name="<?php $metabox->the_name(); ?>" value="<?php $metabox->the_value(); ?>"/></p>
		</div>
		
		<!-- image link -->
		<label>Column 1 Link</label>
		<div class="my_meta_control metabox">
			<?php $metabox->the_field('cat1_link'); ?>
			<p><input type="text" name="<?php $metabox->the_name(); ?>" value="<?php $metabox->the_value(); ?>"/></p>
		</div>
		
	</div>
</div>

<!-- category 2 -->
<div class="postbox section-background">
	<h2 class="handle ui-sortable-handle">
		<span>Category 2</span>
	</h2>
	<div class="inside">
		<!-- image upload -->
		<label>Column 2 Image</label>
		<?php $metabox->the_field('cat2_img'); ?>
		<?php $wpalchemy_media_access->setGroupName('cat2_img' . $mb->get_the_index())->setInsertButtonLabel('Insert'); ?>
		<p class="media-input">
			<?php echo $wpalchemy_media_access->getField(array('name' => $mb->get_the_name(), 'value' => $mb->get_the_value())); ?>
			<?php echo $wpalchemy_media_access->getButton(); ?>
		</p>
		
		<!-- image description -->
		<label>Column 2 Name</label>
		<div class="my_meta_control metabox">
			<?php $metabox->the_field('cat2_name'); ?>
			<p><input type="text" name="<?php $metabox->the_name(); ?>" value="<?php $metabox->the_value(); ?>"/></p>
		</div>
		
		<!-- image link -->
		<label>Column 2 Link</label>
		<div class="my_meta_control metabox">
			<?php $metabox->the_field('cat2_link'); ?>
			<p><input type="text" name="<?php $metabox->the_name(); ?>" value="<?php $metabox->the_value(); ?>"/></p>
		</div>
		
	</div>
</div>

<!-- category 3 -->
<div class="postbox section-background">
	<h2 class="handle ui-sortable-handle">
		<span>Category 3</span>
	</h2>
	<div class="inside">
		<!-- image upload -->
		<label>Column 3 Image</label>
		<?php $metabox->the_field('cat3_img'); ?>
		<?php $wpalchemy_media_access->setGroupName('cat3_img' . $mb->get_the_index())->setInsertButtonLabel('Insert'); ?>
		<p class="media-input">
			<?php echo $wpalchemy_media_access->getField(array('name' => $mb->get_the_name(), 'value' => $mb->get_the_value())); ?>
			<?php echo $wpalchemy_media_access->getButton(); ?>
		</p>
		
		<!-- image description -->
		<label>Column 3 Name</label>
		<div class="my_meta_control metabox">
			<?php $metabox->the_field('cat3_name'); ?>
			<p><input type="text" name="<?php $metabox->the_name(); ?>" value="<?php $metabox->the_value(); ?>"/></p>
		</div>
		
		<!-- image link -->
		<label>Column 3 Link</label>
		<div class="my_meta_control metabox">
			<?php $metabox->the_field('cat3_link'); ?>
			<p><input type="text" name="<?php $metabox->the_name(); ?>" value="<?php $metabox->the_value(); ?>"/></p>
		</div>
		
	</div>
</div>
	
	


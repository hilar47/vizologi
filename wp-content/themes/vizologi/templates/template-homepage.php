<?php 
/*
Template Name: Homepage
*/

get_header();
?>

<!-- Header -->
<section class="hero">
	<div class="container vertical-center">
		<div class="row">
			<div class="col-md-10 col-md-offset-1 col-lg-8 col-lg-offset-2">
				<h1>Empower your business insight</h1>
				<h2>Free <a href="faq">(do whatever you want)</a> business model canvas</h2>
				<div class="select-wrapper">
					<h2>I'm interested in</h2>
					<div class="select">
						<select name="select" id="sectorSelect">
							<option value="all sectors">all sectors</option>
							<option value="energy & utilities">energy &amp; utilities</option>
							<option value="information & media">information &amp; media</option>
							<option value="technology">technology</option>
							<option value="telecommunications">telecommunications</option>
							<option value="consumer goods">consumer goods</option>
							<option value="consumer services">consumer services</option>
							<option value="healthcare">healthcare</option>
							<option value="transportation">transportation</option>
							<option value="financials">financials</option>
							<option value="industrials">industrials</option>
						</select>
					<button class="btn btn-yellow" id="discoverBtn">Discover</button>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Trending -->
<!-- <section class="trending">
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<h2>Trending Now <a href="#" class="view-all visible-xs">Canvas archive</a></h2>
				<p>This week most visited Business Model Canvas</p>
			</div>
			<div class="col-sm-6 view-all">
				<a href="#" class="text-right hidden-xs">View all canvas</a>
			</div>
		</div>

		<div class="row">
			<?php
			$args = array( 'post_type' => 'canvas',
               'posts_per_page'=>6,
               'tax_query' => array(
                      array(
                      'taxonomy' => 'canvas_category', //taxonomy name
                      'field' => 'slug',	//the type of field
                      'terms' => 'trending'	//category name
                      )
                )
            );
			$loop = new WP_Query( $args );
			while ( $loop->have_posts() ) : $loop->the_post();
				echo '<div class="col-sm-4"><div class="card">';
				the_post_thumbnail('medium');
				echo '<div class="tags">';
				echo get_the_term_list( get_the_ID(), 'tag');
				echo '</div><h1>';
				the_title();
				echo '</h1>';
				echo '<div class="entry-content">';
				$content = get_the_content(); echo mb_strimwidth($content, 0, 200, '...');
				echo '</div>';
				echo '<a href="';
				the_permalink();
				echo '">View Canvas</a>';
				echo '</div></div>';
			endwhile;
			?>
		</div>
	</div>
</section> -->

<!-- New -->
<!-- <section class="new">
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<h2>New <a href="#" class="view-all visible-xs">Canvas archive</a></h2>
				<p>Recently added or updated Business Model Canvas</p>
			</div>
			<div class="col-sm-6 view-all hidden-xs">
				<a href="#" class="text-right">View all canvas</a>
			</div>
		</div>

		<div class="row">
			<?php
			$args = array( 'post_type' => 'canvas',
               'posts_per_page'=>6,
               'tax_query' => array(
                      array(
                      'taxonomy' => 'canvas_category', //taxonomy name
                      'field' => 'slug',	//the type of field
                      'terms' => 'new'	//category name
                      )
                )
            );
			$loop = new WP_Query( $args );
			while ( $loop->have_posts() ) : $loop->the_post();
				echo '<div class="col-sm-4"><div class="card">';
				the_post_thumbnail('medium');
				echo '<div class="tags">';
				echo get_the_term_list( get_the_ID(), 'tag');
				echo '</div><h1>';
				the_title();
				echo '</h1>';
				echo '<div class="entry-content">';
				//the_content('More ...');
				$content = get_the_content(); echo mb_strimwidth($content, 0, 200, '...');
				echo '<a href="';
				the_permalink();
				echo '">Read more </a>';
				echo '</div>';
				echo '</div></div>';
			endwhile;
			?>
		</div>
	</div>
</section> -->

<!-- Content from Page -->
<?php while ( have_posts() ): the_post(); ?>
	<?php the_content(); ?>
<?php endwhile; ?>

<!-- Green Section slides -->
<?php
	get_template_part( 'template-parts/content', 'slides' );
?>


<!-- dynamic path -->
<?php $sitePath= home_url(); ?>

<!-- SELECT STYLING -->
<script src="<?php echo get_template_directory_uri();?>/js/jquery.selectric.min.js"></script>
<script>
	$(function() {
		$('select').selectric();
	});

	//pass sector values
    $("#discoverBtn").on("click", function() {
        var data = [];
        $("#sectorSelect").each(function() {
            data.push($(this).val());
        });
        sectorRedirect(data);
    });

    function sectorRedirect(val) {
		var sitePath="<?php echo $sitePath; ?>";
        window.location.href = sitePath + "/business-strategy/case-studies/sector/" +encodeURIComponent(val);
    }
</script>
<?php 
	get_footer();
?>
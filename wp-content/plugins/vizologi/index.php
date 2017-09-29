<?php
/*
* Plugin Name: Vizologi
* Description: Show new, trending and display company information.
* Version: 1.0
* Author: Aniket Betkikar
* Author URI: 
*/

// Example 1 : WP Shortcode to display form on any page or post.
function getResults($atts){
	$res = _curlTemplate('https://vizologi-api-server.herokuapp.com/getselections?selection='. $atts["type"]);
	return _canvasTemplate($res);
}

function getRelated() {
    $company = $_GET['company'];
	$res = _curlTemplate("https://vizologi-api-server.herokuapp.com/getrelated?slug=" . rawurlencode($company));
	return _canvasTemplate($res);
}

function getCompanyCanvas() {
	$company = $_GET['slug'];
	$res = _curlTemplate("https://vizologi-api-server.herokuapp.com/getcompany?slug=" . rawurlencode($company));
	return _singleCompanyTemplate($res);
}

function getCompaniesByTag() {
	$tag = $_GET['tag'];
	$res = _curlTemplate("https://vizologi-api-server.herokuapp.com/searchcanvasbytag?tag=" . rawurlencode($tag));
	return _canvasTemplate($res);
}

function searchCompanies() {
	$type = $_GET['type'];
	$term = $_GET['type'];
	
	$url = "";
	
	if(isset($type) && isset($term)) {
		switch ($type) {
			case "tag":
				$url = "https://vizologi-api-server.herokuapp.com/searchcanvasbytag?tag=" . rawurlencode($term);
				break;
			case "category":
				echo "Your favorite color is blue!";
				break;
			case "search":
				$url = "https://vizologi-api-server.herokuapp.com/searchcanvas?query=" . rawurlencode($term);
				break;
			default:
				echo "";
		}
		
		$res = _curlTemplate($url);
		return _searchTemplate($res);
	}
}

add_shortcode('vizologi_results', 'getResults');
add_shortcode('vizologi_recommended', 'getRelated');
add_shortcode('vizologi_company_details', 'getCompanyCanvas');
add_shortcode('vizologi_search', 'searchCompanies');


function _curlTemplate($url) {
	
	$curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $url);
	// Make it so the data coming back is put into a string
	curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

    // Send the request
    $result = curl_exec($curl);
   
    // Free up the resources $curl is using
    curl_close($curl);
    $a = json_decode($result, true);
  
    return $a;
}

function _canvasTemplate($arr) {
	/*echo "<pre>";
	print_r($arr);
	echo "</pre>";*/
	
	$html = "";
	foreach ($arr as $obj) {
		
		//related array has a nested company object.
		if($obj["Company Name"] == "")
			$obj = $obj["companyObject"];
		
		$desc = (strlen($obj["Description"]) > 13) ? substr($obj["Description"],0,180) .'...' : $obj["Description"];
	 	$html .= '<div class="col-sm-4"><div class="card"><img src="https://vizologi-api-server.herokuapp.com/'.strtolower($obj["Company Name"]).'" class="attachment-medium size-medium wp-post-image" alt="" />';
		$html .= '<div class="tags">';
		$tags = explode(",",$obj["Tags"]);
		foreach($tags as $tag) {
			$html .= '<a href="'.get_home_url().'/canvas/search?type=tag&term='.ltrim($tag) .'" rel="tag">'.ltrim($tag).'</a>';
		}
		$html .= '</div><h1>'. $obj["Company Name"] .'</h1><div class="entry-content">'.$desc.'</div><a href="'.get_home_url().'/canvas/?slug='.$obj["slug"].'&company='.$obj["slug"].'" class="view-canvas">View Canvas</a></div></div>';
	}
	return $html;
}

function _singleCompanyTemplate($obj) {
	
	wp_register_style( 'materialCSS', 'https://storage.googleapis.com/code.getmdl.io/1.0.6/material.indigo-pink.min.css' );
    wp_enqueue_style( 'materialCSS' );
	wp_register_style( 'viewer', plugin_dir_url(__FILE__) .'js/viewer/viewer.css' );
    wp_enqueue_style( 'viewer' );
	wp_register_script('materialJS', 'https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js');
	wp_enqueue_script( 'materialJS' );
	wp_register_script('viewer', plugin_dir_url(__FILE__) . 'js/viewer/viewer.js');
	wp_enqueue_script('viz', plugin_dir_url(__FILE__) . 'js/viz.js', array('viewer'), '4.8.1', true);
	
?>
    <div class="viewer__wrapper">
        <div class="container detail__viewer">
            <img id="canvas-company-image" src="<?php echo plugin_dir_url(__FILE__) . "images/vizo_canvas.png" ?>" style="display:none;"/>
        </div>
    </div>

    <div class="detail__bar"> <!-- id="bar" -->
        <div class="detail__bar__name">
            <h4> <?php echo $obj[0]["Company Name"]; ?> </h4>
        </div>

        <div class="detail__bar__tools">
            <div class="info">
                <a id="bt-show-info" href="#">
                    <i class="fa fa-info-circle"></i>
                </a>
            </div>

            <div class="minus">
                <a id="bt-canvas-minus" href="#">
                    <i class="fa fa-minus"></i>
                </a>
            </div>

            <div class="range-slider" style="padding-bottom:1px; height: 60px;align-items: center;">
                <input id="slider1" style="color:white;" class="mdl-slider mdl-js-slider" oninput="doZoom(this.value)" onchange="doZoom(this.value);" type="range" min="0" max="100" value="0" tabindex="0">
            </div>

            <div class="plus">
                <a id="bt-canvas-plus" href="#">
                    <i class="fa fa-plus"></i>
                </a>
            </div>

            <div class="full-screen">
                <a id="bt-canvas-full" href="">
                    <i class="fa fa-arrows-alt"></i>
                </a>
            </div>

            <div class="download">
                <a href="/img/vizo-canvas.jpg" download="vizology-canvas-<?php echo $obj[0]["slug"]; ?>.jpg">
                    <i class="fa fa-download"></i>
                </a>
            </div>

            <div class="open-new">
                <a href="#">
                    <i class="fa fa-share-square-o"></i>
                </a>

                <div class="open-new__share">
                    <a href="#" class="open-new__share__item">
                        <i class="fa fa-facebook"></i>
                    </a>
                    <a href="#" class="open-new__share__item">
                        <i class="fa fa-twitter"></i>
                    </a>
                    <a href="#" class="open-new__share__item">
                        <i class="fa fa-linkedin"></i>
                    </a>
                    <a href="#" class="open-new__share__item">
                        <i class="fa fa-pinterest"></i>
                    </a>
                    <a href="#" class="open-new__share__item">
                        <i class="fa fa-envelope"></i>
                    </a>

                </div>
            </div>

            <!-- Star rating sction -->
            <div class="star-rating__wrapper">
                <input type="text" class="kv-fa rating-loading" value="" dir="ltr" data-size="xs" title="">

                <p class="star-rating__votes">
                    <?php echo $obj[0]["rating"]["average"]; ?>
                </p>
            </div>
        </div>
    </div>

    <div class="info__wrapper">
        <div id="canvas-info" class="detail__info">
            <div  class="detail__info__img">
                <img class="img-responsive" src="https://vizologi-api-server.herokuapp.com/<?php echo $obj[0]["slug"]; ?>" />
            </div>

            <div class="detail__info__text">
                <div class="text__description">
                        <p class="text__description__main">
                          <?php echo $obj[0]["Description"]; ?>
                        </p>

                        <div class="text__description__tags">
                        	<?php $tags = explode(",",$obj[0]["Tags"]);
                                foreach($tags as $tag) { ?>
                                <a class="company-tags" href="<?php echo get_home_url().'/canvas/search?type=tag&term='.ltrim($tag);  ?>"><?php echo ltrim($tag); ?></a>
                               <?php } ?>
                        </div>

                        <a class="company-canvas" href="<?php echo $obj[0]["URL"]; ?>"> Visit website </a>
                </div>

                <div class="text__about">
                    <p class="text__about__title">
                        Country: <br/>
                        <span class="text__about__content"style="color:#a0a0a0;"> <?php echo $obj[0]["Area"]; ?> </span>
                    </p>
                    <p class="text__about__title">
                        Foundation date: <br/>
                        <span class="text__about__content"style="color:#a0a0a0;"> <?php echo $obj[0]["Company's Foundation Date"]; ?> </span>
                    </p>
                    <p class="text__about__title">
                        Type: <br/>
                        <span class="text__about__content"style="color:#a0a0a0;"> <?php echo $obj[0]["Sector"]; ?> </span>
                    </p>
                    <?php if($obj[0]["Category"] != "") { ?>
                    <p class="text__about__title">
                        Category: <br/>
                            <span class="text__about__content"style="color:#a0a0a0;"> <?php echo $obj[0]["Category"]; ?> </span>
                    </p>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
<?php } 


function _searchTemplate($arr) {
	
	foreach ($arr as $obj) {
?>
		<div class="feed__item">
                <div class="row hover-item">

                    <div id="logo-1" class="canvas-logo col-lg-12 color_1">
                        <img class="img-responsive" style="margin:0 auto;padding: 20px 0px;" src="<?php echo plugin_dir_url(__FILE__) . "images/dummy.png" ?>">
                    </div>
                    <div id="info-1" class="canvas-info col-lg-12"">
                        <h4 class="company-title"> <?php echo $obj["Company Name"]; ?> business model </h4>
                        <?php  
							$tags = explode(",",$obj["Tags"]);
							foreach($tags as $tag) { 
								echo '<a class="company-tags" href="'.get_home_url().'/canvas/search?type=tag&term='.ltrim($tag) .'" rel="tag">'.ltrim($tag).'</a>';
							} ?>
						<a class="company-canvas"  href="<?php get_home_url().'/canvas/?slug='.$obj["slug"].'&company='.$obj["slug"]; ?>">View Canvas</a>
                    </div>
                </div>
            </div>
<?php	
	}
}
?>
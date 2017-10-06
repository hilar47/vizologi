<?php
/*
* Plugin Name: Vizologi
* Description: Show new, trending and display company information.
* Version: 1.0
* Author: Aniket Betkikar
* Author URI: 
*/

function getResults($atts){
	$res = _curlTemplate('https://vizologi-api-server.herokuapp.com/getselections?selection='. $atts["type"]);
	return _canvasTemplate($res);
}

function getRelated() {
    $company = $_GET['slug'];
	$res = _curlTemplate("https://vizologi-api-server.herokuapp.com/getrelated?slug=" . rawurlencode($company) . "&pagen=1&pagel=6");
	return _canvasTemplateRecommended($res);
}

function getCompanyCanvas() {
	$company = $_GET['slug'];
	$res = _curlTemplate("https://vizologi-api-server.herokuapp.com/getcompany?slug=" . rawurlencode($company));
	return _singleCompanyTemplate($res);
}

function searchCompanies() {
	$type = $_GET['type'];
	$term = $_GET['term'];
	
	$url = "";
	
	if(isset($type) && isset($term)) {
		switch ($type) {
			case "tag":
				$url = "https://vizologi-api-server.herokuapp.com/searchcanvasbytag?tag=" . rawurlencode($term) . "&pagen=1&pagel=6";
				break;
			case "sector":
				if(rawurlencode($term) == "all%20sectors")
					$url = "https://vizologi-api-server.herokuapp.com/testDB?pagen=1&pagel=6";
				else
					$url = "https://vizologi-api-server.herokuapp.com/searchcanvasbysector?sector=". rawurlencode($term) ."&pagen=1&pagel=6";
				break;
			case "search":
				$url = "https://vizologi-api-server.herokuapp.com/searchcanvas?query=" . rawurlencode($term) . "&pagen=1&pagel=6";
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

// Collection of Canvases (homepage)
function _canvasTemplate($arr) {
	$html = "";
	foreach ($arr as $obj) {
		
		//related array has a nested company object.
		if($obj["Company Name"] == "")
			$obj = $obj["companyObject"];
		
		$desc = (strlen($obj["Description"]) > 13) ? substr($obj["Description"],0,180) .'...' : $obj["Description"];
		$logoName = _cleanFileName(strtolower($obj["Company Name"]));
		
         $html .= '<div class="col-sm-4"><div class="card"><div class="img-holder"><a href="'.get_home_url().'/canvas/?slug='.$obj["slug"].'"><img src="https://vizologi-api-server.herokuapp.com/logos/'. $logoName .'.png" class="attachment-medium size-medium wp-post-image" alt="" /></a></div>';
		$html .= '<div class="tags">';
		$tags = explode(",",$obj["Tags"]);
		foreach($tags as $tag) {
			$html .= '<a href="'.get_home_url().'/canvas/search?type=tag&term='.ltrim($tag) .'" rel="tag">'.ltrim($tag).'</a>';
		}
		$html .= '</div><h1><a href="'.get_home_url().'/canvas/?slug='.$obj["slug"].'">'. $obj["Company Name"] .'</a></h1><div class="entry-content">'.$desc.'</div><a href="'.get_home_url().'/canvas/?slug='.$obj["slug"].'" class="view-canvas">View Canvas</a></div></div>';
	}
	return $html;
}

// Related Canvases (single canvas page)
function _canvasTemplateRecommended($arr) {
	$html = "";
	foreach ($arr as $obj) {
		
		//related array has a nested company object.
		if($obj["Company Name"] == "")
			$obj = $obj["companyObject"];
		
		$desc = (strlen($obj["Description"]) > 13) ? substr($obj["Description"],0,180) .'...' : $obj["Description"];
	    $logoName = _cleanFileName(strtolower($obj["Company Name"]));
		
         $html .= '<div class="col-sm-4"><div class="card card-recommend"><div class="img-holder"><a href="'.get_home_url().'/canvas/?slug='.$obj["slug"].'&company='.$obj["slug"].'"><img src="https://vizologi-api-server.herokuapp.com/logos/'. $logoName .'.png" class="attachment-medium size-medium wp-post-image" alt="" /></a></div></div></div>';
	}
	return $html;
}


// Single Canvas
function _singleCompanyTemplate($obj) {
	
	//wp_register_style( 'materialCSS', 'https://storage.googleapis.com/code.getmdl.io/1.0.6/material.indigo-pink.min.css' );
    //wp_enqueue_style( 'materialCSS' );
	wp_register_style( 'viewer', plugin_dir_url(__FILE__) .'js/viewer/viewer.css' );
    wp_enqueue_style( 'viewer' );
	wp_register_script('materialJS', 'https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js');
	wp_enqueue_script( 'materialJS' );
	wp_register_script('viewer', plugin_dir_url(__FILE__) . 'js/viewer/viewer.js');
	wp_enqueue_script('viz', plugin_dir_url(__FILE__) . 'js/viz.js', array('viewer'), '4.8.1', true);
	
?>


    <section class="canvas-viewer">
        <div class="container">
            <img class="img-responsive center-block" id="canvas-company-image" src="<?php echo plugin_dir_url(__FILE__) . "images/vizo_canvas.png" ?>" />
        </div>
    </section>

    <section class="canvas-detail-bar">
        <div class="container">
            <div class="row">
                <div class="detail-bar-name col-sm-4">
                    <h4> <?php echo $obj[0]["Company Name"]; ?> </h4>
                </div>

                <div class="detail-bar-tools col-sm-8">
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

                    <div class="range-slider">
                        <input id="slider1" style="color:white;" class="mdl-slider mdl-js-slider" oninput="doZoom(this.value)" onchange="doZoom(this.value);" type="range" min="0" max="100" value="0" tabindex="0">
                    </div>

                    <div class="plus">
                        <a id="bt-canvas-plus" href="#">
                            <i class="fa fa-plus"></i>
                        </a>
                    </div>

                    <div class="full-screen">
                        <a id="bt-canvas-full" href="">
                            <i class="fa fa-compress"></i>
                        </a>
                    </div>

                    <div class="download">
                        <a href="/img/vizo-canvas.jpg" download="vizology-canvas-<?php echo $obj[0]["slug"]; ?>.jpg">
                            <i class="fa fa-download"></i>
                        </a>
                    </div>

                    <!-- <div class="open-new">
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
                    </div> -->

                    <!-- Star rating sction -->
                    <div class="star-rating__wrapper">
                        <!-- <input type="text" class="kv-fa rating-loading" value="" dir="ltr" data-size="xs" title=""> -->
                        <input id="input-2" name="input-2" class="rating rating-loading" data-min="0" data-max="5" data-step="0.1">

                        <!-- <p class="star-rating__votes">
                            <?php echo $obj[0]["rating"]["average"]; ?>
                        </p> -->
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="canvas-info">
        <div class="container">
            <div id="canvas-info" class="row">
                <div class="col-sm-8">
                    <!-- <img class="img-responsive" src="https://vizologi-api-server.herokuapp.com/<?php echo $obj[0]["slug"]; ?>" /> -->
                    <img class="img-responsive" src="http://localhost/vizologi-new/wp-content/themes/vizologi/images/airbnb-alt.png" />
                    <div class="text-description">
                            <p>
                                <?php echo $obj[0]["Description"]; ?>
                            </p>

                            <div class="text-description-tags">
                                <?php $tags = explode(",",$obj[0]["Tags"]);
                                    foreach($tags as $tag) { ?>
                                    <a class="company-tags" href="<?php echo get_home_url().'/canvas/search?type=tag&term='.ltrim($tag);  ?>"><?php echo ltrim($tag); ?></a>
                                <?php } ?>
                            </div>

                            <a class="company-url" target="_blank" href="<?php echo $obj[0]["URL"]; ?>"> Visit website </a>
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="text-about">
                            <p>
                                <b>Country:</b> <br/>
                                <span class="text__about__content"style="color:#a0a0a0;"> <?php echo $obj[0]["Area"]; ?> </span>
                            </p>
                            <p>
                                <b>Foundation date:</b> <br/>
                                <span class="text__about__content"style="color:#a0a0a0;"> <?php echo $obj[0]["Company's Foundation Date"]; ?> </span>
                            </p>
                            <p>
                                <b>Type:</b> <br/>
                                <span class="text__about__content"style="color:#a0a0a0;"> <?php echo $obj[0]["Sector"]; ?> </span>
                            </p>
                            <?php if($obj[0]["Category"] != "") { ?>
                            <p>
                                <b>Category:</b> <br/>
                                    <span class="text__about__content"style="color:#a0a0a0;"> <?php echo $obj[0]["Category"]; ?> </span>
                            </p>
                            <?php } ?>
                        </div>
                </div>
            </div>
        </div>
    </section>
<?php } 



// Search Canvas
function _searchTemplate($arr) {
?>
<section class="search-results">
		<div class="container feed-item">
                <div class="row hover-item">
                    <div class="col-xs-12">
                        <p>Your search for</p>
                        <h1><?php echo ucwords($_REQUEST["term"]); ?></h1>
                        <p>Resulted in <span><?php echo count($arr) ; ?> canvas</p>
                    </div>
                </div>
                <div class="row hover-item">
                    <?php echo _canvasTemplate($arr); ?>
                </div>
            </div>
</section>
<?php
}

function _cleanFileName($string) {
	$string = str_replace(' ', '-', $string); // Replaces all spaces with hyphens.

   return preg_replace('/[^A-Za-z0-9\-]/', '', $string); // Removes special chars.
}
?>
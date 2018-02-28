<?php
/*
* Plugin Name: Vizologi
* Description: Show new, trending and display company information.
* Version: 1.0
* Author: Aniket Betkikar
* Author URI: 
*/

$numberOfVotesRandom = rand(1000,1500);

function getResults($atts){
	$res = _curlTemplate('https://vizologi-api-server.herokuapp.com/getselections?selection='. $atts["type"]);
	return _canvasTemplate($res);
}

function getRelated() {
	$company = explode("-business-model-canvas",get_query_var('company',1));
	$res = _curlTemplate("https://vizologi-api-server.herokuapp.com/getrelated?slug=" . rawurlencode($company[0]) . "&pagen=1&pagel=6");
	return _canvasTemplateRecommended($res);
}

function getCompanyCanvas() {
	$company = explode("-business-model-canvas", get_query_var('company',1));
	$res = _curlTemplate("https://vizologi-api-server.herokuapp.com/getcompany?slug=" . rawurlencode($company[0]));
	return _singleCompanyTemplate($res);
}

function getCanvasArchive() {
	$res = _curlTemplate("https://vizologi-api-server.herokuapp.com/getallcompanies?pagen=1&pagel=15");
	return _canvasArchiveTemplate($res);
}

function searchCompanies() {
	$type = get_query_var('type',1);
	$term = urldecode(get_query_var('term',1));
	
	$url = "";
	
	if(isset($type) && isset($term)) {
		switch ($type) {
			case "tag":
				$url = "https://vizologi-api-server.herokuapp.com/searchcanvasbytag?tag=" . rawurlencode($term) . "&pagen=1&pagel=6";
				break;
			case "sector":
				if(rawurlencode($term) == "all%20sectors")
					$url = "https://vizologi-api-server.herokuapp.com/getallcompanies?pagen=1&pagel=6";
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
add_shortcode('vizologi_canvas_archive', 'getCanvasArchive');

function getTotalResult($type, $term) {
	switch ($type) {
			case "tag":
				$url = "https://vizologi-api-server.herokuapp.com/searchcanvasbytag?tag=" . rawurlencode($term) ."&count=true";
				break;
			case "sector":
				if(rawurlencode($term) == "all%20sectors")
					$url = "https://vizologi-api-server.herokuapp.com/getallcompanies?count=true";
				else
					$url = "https://vizologi-api-server.herokuapp.com/searchcanvasbysector?sector=". rawurlencode($term) ."&count=true";
				break;
			case "search":
				$url = "https://vizologi-api-server.herokuapp.com/searchcanvas?query=" . rawurlencode($term) . "&count=true";
				break;
			case "archive":
				$url = "https://vizologi-api-server.herokuapp.com/searchcanvas?query=" . rawurlencode($term) . "&count=true";
				break;
			default:
				echo "";
		}
		
		$a = _curlTemplate($url);
		
		echo $a;
}


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
		
		$desc = (strlen($obj["Description"]) > 150) ? substr($obj["Description"],0,150) .'...' : $obj["Description"];
		$logoName = _cleanFileName(strtolower($obj["slug"]));
		$html .= '<div class="col-sm-4 item"><div class="card"><div class="img-holder"><a href="'.get_home_url().'/business-strategy-canvas/'.$obj["slug"].'-business-model-canvas"><img src="https://vizologi-api-server.herokuapp.com/logos/'. $logoName .'.png" class="attachment-medium size-medium wp-post-image" alt="' . $obj["Company Name"] . ' business model | How does ' . $obj["Company Name"] . ' make money?" width="250" /></a></div>';
        
		$html .= '<div class="tags">';
		$tags = explode(",",$obj["Tags"]);
		foreach($tags as $tag) {
			$html .= '<a href="'.get_home_url().'/business-strategy/case-studies/tag/'.ltrim($tag) .'" rel="tag">'.ltrim($tag).'</a>';
		}
		$html .= '</div><h1><a href="'.get_home_url().'/business-strategy-canvas/'.$obj["slug"].'-business-model-canvas">'. $obj["Company Name"] .' Business Model</a></h1><div class="entry-content">'.$desc.'</div><a href="'.get_home_url().'/business-strategy-canvas/'.$obj["slug"].'-business-model-canvas" class="view-canvas">View Canvas</a></div></div>';
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
		
		$desc = (strlen($obj["Description"]) > 100) ? substr($obj["Description"],0,100) .'...' : $obj["Description"];
	    $logoName = _cleanFileName(strtolower($obj["slug"]));
$html .= '<div class="col-sm-4"><div class="card card-recommend"><div class="img-holder"><a href="'.get_home_url().'/business-strategy-canvas/'.$obj["slug"].'-business-model-canvas"><img src="https://vizologi-api-server.herokuapp.com/logos/'. $logoName .'.png" class="attachment-medium size-medium wp-post-image" alt="' . $obj["Company Name"] . ' business model | How does ' . $obj["Company Name"] . ' make money?" width="250" /></a></div></div></div>';  
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
	wp_enqueue_script('viz', plugin_dir_url(__FILE__) . 'js/viz.js', array('viewer'), time(), true);
	wp_enqueue_script('vizologi', plugin_dir_url(__FILE__) . 'js/viz_canvas.js', '', time());
	/*
	echo "<pre>";
	print_r($obj[0]);
	echo "</pre>";*/
	
	//we are accessing the global variable decalred at the top of this file.
	global $numberOfVotesRandom;
?>


    <section class="canvas-viewer">
        <!--<div class="overlay" onclick="style.pointerEvents='none'"></div>-->
        <div class="container">
            <img class="img-responsive center-block" id="canvas-company-image" src="<?php echo get_site_url() . '/wp-content/uploads/canvas/' . $obj[0]["slug"]; ?>-business-model-canvas.png" style="display:none;" alt="<?php echo $obj[0]["Company Name"]; ?> business model | How does <?php echo $obj[0]["Company Name"]; ?> make money?" title="<?php echo $obj[0]["slug"]; ?>-business-model-canvas" />
            </div>
    </section>
    <section class="canvas-detail-bar">
        <div class="container">
            <div class="row">
                <div class="detail-bar-name col-sm-4">
                    <h4> <?php echo $obj[0]["Company Name"]; ?> business model canvas </h4>
                </div>

                <div class="detail-bar-tools col-sm-8">
                    <div class="info">
                        <a id="bt-show-info" href="#">
                            <i class="lsf-icon" title="info"></i>
                        </a>
                    </div>

                    <div class="minus">
                        <a id="bt-canvas-minus" href="#">
                            <i class="lsf-icon" title="minus"></i>
                        </a>
                    </div>

                    <div class="range-slider">
                        <input id="slider1" style="color:white;" class="mdl-slider mdl-js-slider" oninput="doZoom(this.value)" onchange="doZoom(this.value);" type="range" min="0" max="100" value="0" tabindex="0">
                    </div>

                    <div class="plus">
                        <a id="bt-canvas-plus" href="#">
                            <i class="lsf-icon" title="plus"></i>
                        </a>
                    </div>

                    <div class="full-screen">
                        <a id="bt-canvas-full" href="">
                            <i class="lsf-icon" title="full"></i>
                        </a>
                    </div>

                    <div class="share open-new">
                        <a href="javascript:void(0);">
                            <i class="lsf-icon" title="share"></i>
                        </a>
                        <div class="open-new-share">
                              <?php  echo do_shortcode( '[addtoany url="'. get_site_url() . '/business-strategy-canvas/'.$obj[0]["slug"].'-business-model-canvas" title="'. $obj[0]["Company Name"] .' business model canvas"]' ); ?>
                           
                        </div>
                    </div>

                    <div class="download">
                        <!--<a id="btn-download" target="_blank" href="<?php echo plugin_dir_url(__FILE__) . 'download.php?downloadurl=' . get_site_url() . '/wp-content/uploads/canvas/' . $obj[0]["slug"] .'-business-model-canvas.png&name=' . $obj[0]["slug"] . '-business-model-canvas.png&ext=png'; ?>" download="<?php echo $obj[0]["slug"]; ?>-business-model-canvas.png"><i class="lsf-icon" title="download"></i>
                        </a>-->
                        <?php  echo do_shortcode( '[pwt_canvas canvas="' . $obj[0]["slug"] . '-business-model-canvas.png"]' ); ?>
                    </div>


                    <!-- Star rating sction -->
                    <input id="input-2" name="input-rating" type="number" class="rating" min="0" max="5" step="0.5"  />
                    <input type="hidden" id="rating-value" value="<?php echo $obj[0]['rating']['average']; ?>" />
                    <input type="hidden" id="user-rate" value="<?php echo  _didUserRate($obj[0]['rating']['records']); ?>" />
                </div>
            </div>
        </div>
    </section>
    <section class="canvas-info">
        <div class="container">
            <div id="canvas-info" class="row">
                <div class="col-sm-8">
                    <img class="img-responsive" src="https://vizologi-api-server.herokuapp.com/logos/<?php echo _cleanFileName(strtolower($obj[0]["slug"])); ?>.png" alt="<?php echo $obj[0]["Company Name"]; ?> business model | How does <?php echo $obj[0]["Company Name"]; ?> make money?" />
                    <div class="text-description">
                            <p>
                                <?php echo $obj[0]["Description"]; ?>
                            </p>

                            <div class="text-description-tags">
                                <?php $tags = explode(",",$obj[0]["Tags"]);
                                    foreach($tags as $tag) { ?>
                                    <a class="company-tags" href="<?php echo get_home_url().'/business-strategy/case-studies/tag/'.ltrim($tag);  ?>"><?php echo ltrim($tag); ?></a>
                                <?php } ?>
                            </div>

                            <a class="company-url" target="_blank" href="<?php echo _fixRedirectionURLs($obj[0]["URL"]); ?>"> Visit website </a>
                    </div>
                </div>

                <div class="col-sm-2 col-sm-offset-1">
                    <div class="text-about">
                            <p>
                                <b>Average rate:</b> <br/>
                                <span class="text__about__content"style="color:#a0a0a0;" id="rating-average"> <?php echo $obj[0]['rating']['average']; ?> </span>
                            </p>
                            <p>
                                <b>Number of votes:</b> <br/>
                                <span class="text__about__content"style="color:#a0a0a0;" id="number-of-votes"> <?php echo count($obj[0]['rating']['records']) + $numberOfVotesRandom; ?> </span>
                            </p>
                            <p>
                                <b>Digital maturity:</b> <br/>
                                <span class="text__about__content"style="color:#a0a0a0;"> <?php echo $obj[0]["Digital maturity"]; ?> </span>
                            </p>
                        </div>
                </div>
            </div>
        </div>
    </section>
<?php } 



// Search Canvas
function _searchTemplate($arr) {
	wp_enqueue_script('viz', plugin_dir_url(__FILE__) . 'js/viz_canvas.js');
	wp_localize_script( 'viz', 'search_params', array(
			'type' => get_query_var('type',1),
			'term' => get_query_var('term',1)
		)
	);
	
	
	/*echo "<pre>";
	print_r($arr);
	echo "</pre>";*/
?>
<section class="search-results">
		<div class="container feed-item">
                <div class="row hover-item">
                    <div class="col-xs-12">
                        <p>Your search for</p>
                        <h1><?php echo ucwords(urldecode(get_query_var('term',1))); ?></h1>
                        <p>Resulted in <span><?php getTotalResult(get_query_var('type',1), urldecode(get_query_var('term',1))) ; ?> canvas</p>
                    </div>
                </div>
                <div class="row hover-item" id="canvas-search-results">
                    <?php echo _canvasTemplate($arr); ?>
                </div>
                <div class="row load-more">
                	<input type="hidden" id="page-no" value="1" />
					<button id="viz-search-load-more" class="btn btn-black <?php echo  (count($arr) < 6) ? 'hide' : ''; ?>">Load more</button>
                </div>
            </div>
</section>
<?php
}

// Search Canvas
function _canvasArchiveTemplate($arr) {
	wp_enqueue_script('viz', plugin_dir_url(__FILE__) . 'js/viz_canvas.js');
?>
<section class="recommended canvas-archive">
		<div class="container feed-item">
                <div class="row hover-item">
                    <div class="col-xs-12">
                        <p>So you <b>want</b> to see our</p>
                        <h1>Business Model Canvas Archive</h1>
                        <p>Resulted in <span><?php getTotalResult("archive", "") ; ?> canvas</p>
                    </div>
                </div>
                <div class="row hover-item" id="canvas-archive-results">
                    <?php echo _canvasTemplateRecommended($arr); ?>
                </div>
                <div class="row load-more">
                	<input type="hidden" id="page-no" value="1" />
					<button id="viz-archive-load-more" class="btn btn-black <?php echo  (count($arr) < 6) ? 'hide' : ''; ?>">Load more</button>
                </div>
            </div>
</section>
<?php
}

function _cleanFileName($string) {
	//$string = str_replace(' ', '-', $string); //not the same as blank space. this is a different space.
	$string = str_replace(' ', '-', $string); // Replaces all spaces with hyphens.

   return preg_replace('/[^A-Za-z0-9\-]/', '', $string); // Removes special chars.
}

function _fixRedirectionURLs($string) {
	if(substr($string, 0, 3) == 'www') {
		return "http://" . $string;
	}else{
		return $string;
	}
}

function _didUserRate($records) {
	$userID = $_COOKIE["vizologi_user"];
	foreach($records as $rec) {
		if($rec["userID"] == $userID) {
			return $rec["userRate"];
		}
	}
	return 0;
}

add_action('wp_head', 'wpse_43672_wp_head');

function wpse_43672_wp_head(){
	if(get_the_title() == "Canvas") {
		$company = explode("-business-model-canvas", get_query_var('company',1));
		$res = _curlTemplate("https://vizologi-api-server.herokuapp.com/getcompany?slug=" . rawurlencode($company[0]));
		?>
		
        <title>What is <?php echo $res[0]["Company Name"]; ?>'s business model? | <?php echo $res[0]["Company Name"]; ?> business model canvas explained - Vizologi</title>
	    <meta name="description" content="<?php echo $res[0]["Description"]; ?>" />
        <!-- Twitter Card data -->
		<meta name="twitter:card" content="summary"/>
		<meta name="twitter:site" content="@vizologi"/>
		<meta name="twitter:title" content="<?php echo $res[0]["Company Name"]; ?> business model canvas"/>
		<meta name="twitter:description" content="<?php echo $res[0]["Description"]; ?>"/>
		<meta name="twitter:image" content="<?php echo get_site_url() . '/wp-content/uploads/canvas/' . $res[0]["slug"]; ?>-business-model-canvas.png"/>
		<meta name="twitter:url" content="<?php echo 'http://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'] ?>" />
	
		<meta property="og:type" content="article" />
		<meta property="og:image" content="<?php echo get_site_url() . '/wp-content/uploads/canvas/' . $res[0]["slug"]; ?>-business-model-canvas.png"/>
		<meta property="og:image:width" content="1000" />
		<meta property="og:image:height" content="1000" />
		<meta property="og:title" content="<?php echo $res[0]["Company Name"]; ?> business model canvas"/>
		<meta property="og:url" content="<?php echo 'http://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'] ?>"/>
		<meta property="og:site_name" content="Vizologi | rethinking business model design"/>
		<meta property="og:description" content="<?php  echo $res[0]["Description"]; ?>" />
        
        <?php
		   // let it know that we are accessing the global variable declared at the top of this file
        	global $numberOfVotesRandom;
		?>
        <script type="application/ld+json">
			{
			  //"@context": "http://schema.org/Review",
			  "@type":" Review",
			  "name": "<?php echo $res[0]["Company Name"]; ?> business model canvas",
			  "image": "<?php echo get_site_url() . '/wp-content/uploads/canvas/' . $res[0]["slug"]; ?>-business-model-canvas.png",
			  "url": "<?php echo 'http://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'] ?>",
			  "description": "<?php  echo $res[0]["Description"]; ?>",
			  "aggregateRating": {
				"@type": "AggregateRating",
				"ratingValue": "<?php echo $res[0]['rating']['average']; ?>",
				"reviewCount": "<?php echo count($res[0]['rating']['records']) + $numberOfVotesRandom; ?>"
			  },
			
			  "digitalMaturity": "<?php echo $res[0]["Digital maturity"]; ?>",
			  "tags": <?php echo json_encode(explode(",",$res[0]["Tags"])); ?>
			}
			</script>
    <?php 
	}
	else if(get_the_title() == "Business Strategy") {
		$q = get_query_var('type',1) ;
		?>
        
        <title><?php echo ucwords(rawurldecode(get_query_var('term',1))); ?> Business Models | Canvas Examples & Business Strategy - Vizologi</title>
	    <meta name="description" content="<?php echo $res[0]["Description"]; ?>" />
        
        <?php
		if($q == "sector") {
			$url = "";
	    	if(get_query_var('term',1) == "all%20sectors") {
					$url = "https://vizologi-api-server.herokuapp.com/getallcompanies?pagen=1&pagel=1";
			} else {
					$url = "https://vizologi-api-server.herokuapp.com/searchcanvasbysector?sector=". get_query_var('term',1) ."&pagen=1&pagel=1";
			}
			
			$res = _curlTemplate($url);
		?>
        <script type="application/ld+json">
			{
			
			  //"@context": "http://schema.org/Review",
			
			  "@type": "Review",
			
			  "name": "<?php echo rawurldecode(get_query_var('term',1)) ?>",
			
			  "image": "https://vizologi-api-server.herokuapp.com/logos/<?php echo $res[0]['slug']; ?>.png",
			
			  "url": "<?php echo $res[0]['URL']; ?>",
			
			  "description": "<?php echo $res[0]['Description']; ?>",
			
			  "resultNumber": "<?php echo getTotalResult($q, rawurldecode(get_query_var('term',1))); ?>"
			
			}
			
			</script>
        <?php
		}
		else if($q == "search") {
			$res = _curlTemplate("https://vizologi-api-server.herokuapp.com/searchcanvas?query=" . get_query_var('term',1) . "&pagen=1&pagel=1");
		?>
        <script type="application/ld+json">
			{
			
			 // "@context": "http://schema.org/Review",
			
			  "@type": "Review",
			
			  "name": "<?php echo rawurldecode(get_query_var('term',1)) ?>",
			
			  "image": "https://vizologi-api-server.herokuapp.com/logos/<?php echo $res[0]['slug']; ?>.png",
			
			  "url": "<?php echo $res[0]['URL']; ?>",
			
			  "description": "<?php echo $res[0]['Description']; ?>",
			
			  "resultNumber": "<?php echo getTotalResult($q, rawurldecode(get_query_var('term',1))); ?>"
			
			}
			
			</script>
        <?php
		}
		else if($q == "tag") {
			$res = _curlTemplate("https://vizologi-api-server.herokuapp.com/searchcanvasbytag?tag=" . get_query_var('term',1) . "&pagen=1&pagel=1");
		?>
        <script type="application/ld+json">
			{
			
			  //"@context": "http://schema.org/Review",
			
			  "@type": "Review",
			
			  "name": "<?php echo rawurldecode(get_query_var('term',1)) ?>",
			
			  "image": "https://vizologi-api-server.herokuapp.com/logos/<?php echo $res[0]['slug']; ?>.png",
			
			  "url": "<?php echo $res[0]['URL']; ?>",
			
			  "description": "<?php echo $res[0]['Description']; ?>",
			
			  "resultNumber": "<?php echo getTotalResult($q, rawurldecode(get_query_var('term',1))); ?>"
			
			}
			
			</script>
        <?php
		}
	 }
}
?>
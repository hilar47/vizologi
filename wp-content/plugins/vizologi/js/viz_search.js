/*// JavaScript Document

var viz = (function() {
	var searchCompanies = function() {
		var pageNo = Number($('#page-no').val());
		pageNo = Number(pageNo + 1);
		
		var url = "";
		
		switch(getParameterByName('type')) {
			case "tag":
				url = "https://vizologi-api-server.herokuapp.com/searchcanvasbytag?tag=" + getParameterByName('term') + "&pagen="+pageNo+"&pagel=6";
				break;
			case "sector":
				break;
			case "search":
				url = "https://vizologi-api-server.herokuapp.com/searchcanvas?query=" + getParameterByName('term') + "&pagen=" + pageNo + "&pagel=6";
				break;
			default:
			   break;
		}
		
			jQuery.ajax({
				type: "POST",
				url: url,
				dataType: 'jsonp'
			}).done(function(data) {
				$.each(data, function() {
					
					
				});
				
				
				foreach ($arr as $obj) {
		
		//related array has a nested company object.
		if($obj["Company Name"] == "")
			$obj = $obj["companyObject"];
		
		$desc = (strlen($obj["Description"]) > 13) ? substr($obj["Description"],0,180) .'...' : $obj["Description"];
		$logoName = _cleanFileName(strtolower($obj["Company Name"]));
		
	 	$html .= '<div class="col-sm-4"><div class="card"><img src="https://vizologi-api-server.herokuapp.com/logos/'. $logoName .'.png" class="attachment-medium size-medium wp-post-image" alt="" />';
		$html .= '<div class="tags">';
		$tags = explode(",",$obj["Tags"]);
		foreach($tags as $tag) {
			$html .= '<a href="'.get_home_url().'/canvas/search?type=tag&term='.ltrim($tag) .'" rel="tag">'.ltrim($tag).'</a>';
		}
		$html .= '</div><h1>'. $obj["Company Name"] .'</h1><div class="entry-content">'.$desc.'</div><a href="'.get_home_url().'/canvas/?slug='.$obj["slug"].'">View Canvas</a></div></div>';
				
				$('#page-no').val(pageNo);
				
			}).fail(function(jqXHR, textStatus) {
				console.log(textStatus);
			});
		}
		
		return  {
			searchCompanies: searchCompanies
		}
})();

function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

$(document).ready(function() {
	$('#viz-search-load-more').click(function() {
		
	});
});*/
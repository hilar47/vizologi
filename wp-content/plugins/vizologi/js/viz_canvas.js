var vizologi = (function() {

    var server = "https://vizologi-api-server.herokuapp.com/";
    var baseURL = "http://vizologi.com/";
    var pageLength = 6;

    var getCompanies = function(bindingElement) {

        var type = search_params.type;
        var term = search_params.term;
        var page = Number($('#page-no').val()) + 1;

        if (type.length > 0 && term.length > 0) {

            var url = "";

            switch (type) {
                case "tag":
                    url = "searchcanvasbytag?tag=" + term + "&pagen=" + page + "&pagel=" + pageLength;
                    break;
                case "sector":
                    if (term == "all%20sectors")
                        url = "getallcompanies?pagen=" + page + "&pagel=" + pageLength;
                    else
                        url = "searchcanvasbysector?sector=" + term + "&pagen=" + page + "&pagel=" + pageLength;
                    break;
                case "search":
                    url = "searchcanvas?query=" + term + "&pagen=" + page + "&pagel=" + pageLength;
                    break;
                default:

            }

            var a = $.ajax({
                method: "GET",
                url: server + url
            }).done(function(msg) {
                var content = _templateSearch(msg);
                $(bindingElement).append(content);
                $('#page-no').val(page);
            });
        }
    }

    var getCanvasArchive = function(bindingElement) {
        var page = Number($('#page-no').val()) + 1;

        var a = $.ajax({
            method: "GET",
            url: server + "getallcompanies?pagen=" + page + "&pagel=15"
        }).done(function(msg) {
            var content = _templateArchive(msg);
            $(bindingElement).append(content);
            $('#page-no').val(page);
        });
    }

    var checkRating = function(user, slug, userrate) {
        var a = $.ajax({
            method: "GET",
            url: server + "findUserId?userid=" + user + "&slug=" + slug
        }).done(function(msg) {
            if (!msg.userExists) {
                setRating(user, slug, userrate);
            }
        });
    }


    var setRating = function(user, slug, userrate) {
        var a = $.ajax({
            method: "GET",
            url: server + "setRate?userid=" + user + "&slug=" + slug + "&userrate=" + userrate
        }).done(function(msg) {
			$('#rating-average').text(Number(msg[0].rating.average));
            $('#number-of-votes').text(Number($('#number-of-votes').text()) + 1);
			$('#input-2').rating('refresh',{displayOnly: true, showCaption: true});
        });
    }

    var paginateBlogPosts = function(page, ajaxURL) {
        var data = {
            action: 'blog_pagination',
            page_no: page
        };

        jQuery.post(ajaxURL, data, function(response) {
            alert('Got this from the server: ' + response);
            console.log(response);
        });
    }

    var _templateSearch = function(data) {
        var html = "";

        if (data.length < pageLength)
            $("#viz-search-load-more").hide();

        $.each(data, function(i, e) {

            var logoName = _cleanFileName(e.slug);

            html += '<div class="col-sm-4"><div class="card"><div class="img-holder"><a href="' + baseURL + 'canvas/' + e.slug + '-business-model-canvas">';
            html += '<img src="' + server + 'logos/' + logoName + '.png" class="attachment-medium size-medium wp-post-image" alt="" width="250"></a></div>';
            html += '<div class="tags">';

            var tags = e.Tags.split(",");
            var desc = e.Description.substring(0, 150) + "...";

            $.each(tags, function(k, t) {
                var tag = t.replace(/^\s+|\s+$/g, '');
                html += '<a href="' + baseURL + 'business-strategy/case-studies/tag/' + tag + '" rel="tag">' + tag + '</a>';
            });

            html += '</div><h1><a href="' + baseURL + 'canvas/' + e.slug + '-business-model-canvas">' + e["Company Name"] + '</a></h1>';
            html += '<div class="entry-content">' + desc + '</div><a href="' + baseURL + 'canvas/' + e.slug + '-business-model-canvas" class="view-canvas">View Canvas</a></div></div >';
        });

        return html;
    }

    var _templateArchive = function(data) {
        var html = "";

        if (data.length < 15)
            $("#viz-archive-load-more").hide();


        $.each(data, function(i, e) {
            var logoName = _cleanFileName(e.slug);
            html += '<div class="col-sm-4"><div class="card card-recommend"><div class="img-holder"><a href="' + baseURL + 'canvas/' + e.slug + '-business-model-canvas">';
            html += '<img src="' + server + 'logos/' + logoName + '.png" class="attachment-medium size-medium wp-post-image" alt="" width=""></a></div ></div ></div > ';
        });

        return html;
    }

    var _getParameterByName = function(name, url) {
        if (!url) url = window.location.href;
        name = name.replace(/[\[\]]/g, "\\$&");
        var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
            results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, " "));
    }

    var _cleanFileName = function(val) {
        	var a = val.toString().replace(/\s\s+/g, ' ').replace(/ /g, '-').replace(/[^A-Za-z0-9\-]/g, '').toLowerCase();
			return a;
    }

    return {
        getCompanies: getCompanies,
        getCanvasArchive: getCanvasArchive,
        paginateBlogPosts: paginateBlogPosts,
        checkRating: checkRating
    }
})();
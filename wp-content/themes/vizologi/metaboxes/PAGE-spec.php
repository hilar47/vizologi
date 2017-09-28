<?php

//DEFINE VARIABLE TO STORE THE METABOX
$dir_path = get_stylesheet_directory().'/metaboxes/';


$content_home_meta = new WPAlchemy_MetaBox(array
(
	//'title' => $title,
	'id' => '_content_home_meta',		//UNIQUE ID FOR THIS META BOX
	'types' => array('page'), 		//POST TYPES
	'template' => $dir_path . 'PAGE-meta.php',	//WHERE THE METABOX TEMPLATE IS FOR THIS METABOX
));


$content_blog_meta = new WPAlchemy_MetaBox(array
(
	//'title' => $title,
	'id' => '_content_blog_meta',		//UNIQUE ID FOR THIS META BOX
	'types' => array('blog'), 		//POST TYPES
	'template' => $dir_path . 'BLOG-meta.php',	//WHERE THE METABOX TEMPLATE IS FOR THIS METABOX
));

<?php
/**
 * Vizology functions and definitions
 *
 * @link https://developer.wordpress.org/themes/basics/theme-functions/
 *
 * @package Vizology
 */

if ( ! function_exists( 'vizology_setup' ) ) :
	/**
	 * Sets up theme defaults and registers support for various WordPress features.
	 *
	 * Note that this function is hooked into the after_setup_theme hook, which
	 * runs before the init hook. The init hook is too late for some features, such
	 * as indicating support for post thumbnails.
	 */
	function vizology_setup() {
		/*
		 * Make theme available for translation.
		 * Translations can be filed in the /languages/ directory.
		 * If you're building a theme based on Vizology, use a find and replace
		 * to change 'vizology' to the name of your theme in all the template files.
		 */
		load_theme_textdomain( 'vizology', get_template_directory() . '/languages' );

		// Add default posts and comments RSS feed links to head.
		add_theme_support( 'automatic-feed-links' );

		/*
		 * Let WordPress manage the document title.
		 * By adding theme support, we declare that this theme does not use a
		 * hard-coded <title> tag in the document head, and expect WordPress to
		 * provide it for us.
		 */
		//add_theme_support( 'title-tag' );

		/*
		 * Enable support for Post Thumbnails on posts and pages.
		 *
		 * @link https://developer.wordpress.org/themes/functionality/featured-images-post-thumbnails/
		 */
		add_theme_support( 'post-thumbnails' );

		// This theme uses wp_nav_menu() in one location.
		register_nav_menus( array(
			'menu-1' => esc_html__( 'Primary', 'vizology' ),
		) );

		/*
		 * Switch default core markup for search form, comment form, and comments
		 * to output valid HTML5.
		 */
		add_theme_support( 'html5', array(
			'search-form',
			'comment-form',
			'comment-list',
			'gallery',
			'caption',
		) );

		// Set up the WordPress core custom background feature.
		add_theme_support( 'custom-background', apply_filters( 'vizology_custom_background_args', array(
			'default-color' => 'ffffff',
			'default-image' => '',
		) ) );

		// Add theme support for selective refresh for widgets.
		add_theme_support( 'customize-selective-refresh-widgets' );

		/**
		 * Add support for core custom logo.
		 *
		 * @link https://codex.wordpress.org/Theme_Logo
		 */
		add_theme_support( 'custom-logo', array(
			'height'      => 250,
			'width'       => 250,
			'flex-width'  => true,
			'flex-height' => true,
		) );
	}
endif;
add_action( 'after_setup_theme', 'vizology_setup' );

/**
 * Set the content width in pixels, based on the theme's design and stylesheet.
 *
 * Priority 0 to make it available to lower priority callbacks.
 *
 * @global int $content_width
 */
function vizology_content_width() {
	$GLOBALS['content_width'] = apply_filters( 'vizology_content_width', 640 );
}
add_action( 'after_setup_theme', 'vizology_content_width', 0 );

/**
 * Register widget area.
 *
 * @link https://developer.wordpress.org/themes/functionality/sidebars/#registering-a-sidebar
 */
function vizology_widgets_init() {
	register_sidebar( array(
		'name'          => esc_html__( 'Sidebar', 'vizology' ),
		'id'            => 'sidebar-1',
		'description'   => esc_html__( 'Add widgets here.', 'vizology' ),
		'before_widget' => '<section id="%1$s" class="widget %2$s">',
		'after_widget'  => '</section>',
		'before_title'  => '<h2 class="widget-title">',
		'after_title'   => '</h2>',
	) );
}
add_action( 'widgets_init', 'vizology_widgets_init' );

/**
 * Enqueue scripts and styles.
 */
function vizology_scripts() {
	wp_enqueue_style( 'vizology-style', get_stylesheet_uri() );

	/* wp_enqueue_script( 'vizology-navigation', get_template_directory_uri() . '/js/navigation.js', array(), '20151215', true );

	wp_enqueue_script( 'vizology-skip-link-focus-fix', get_template_directory_uri() . '/js/skip-link-focus-fix.js', array(), '20151215', true );

	if ( is_singular() && comments_open() && get_option( 'thread_comments' ) ) {
		wp_enqueue_script( 'comment-reply' );
	} */
}
add_action( 'wp_enqueue_scripts', 'vizology_scripts' );

/**
 * Implement the Custom Header feature.
 */
require get_template_directory() . '/inc/custom-header.php';

/**
 * Custom template tags for this theme.
 */
require get_template_directory() . '/inc/template-tags.php';

/**
 * Functions which enhance the theme by hooking into WordPress.
 */
require get_template_directory() . '/inc/template-functions.php';

/**
 * Customizer additions.
 */
require get_template_directory() . '/inc/customizer.php';

/**
 * Load Jetpack compatibility file.
 */
if ( defined( 'JETPACK__VERSION' ) ) {
	require get_template_directory() . '/inc/jetpack.php';
}


//Main Menu
register_nav_menu('in_header','Header Menu');

//Dropdown Menu
register_nav_menu('dropdown_menu','Dropdown Menu');

//Footer Menus
register_nav_menu('in_footer','Footer Menu 1');
register_nav_menu('in_footer2','Footer Menu 2');

//Side Menus
register_nav_menu('sidebar','Side Menu');

//custom post type CANVAS
/* register_post_type( 'canvas',
array(
//LABELS FOR USE IN THE ADMIN
'labels' => array(
'name' => __( 'Canvas' ),
'singular_name' => __( 'Canvas' ),
'add_new_item' => __( 'Add New Canvas' ),
),
'exclude_from_search' => false,
'public' => true,
'has_archive' => true,
'supports' => array('title', 'editor',  'thumbnail', 'excerpt',  'revisions', 'page-attributes'),
'rewrite' => array('slug' => 'canvas'),
)
);

add_action( 'init', 'create_tag_taxonomies', 0 );


//Canvas CUSTOM TAXONOMY Category FOR USE IN THE ADMIN
$labels = array(
'name'              => _x( 'Categories', 'taxonomy general name' ),
'singular_name'     => _x( 'Category', 'taxonomy singular name' ),
'search_items'      => __( 'Search all Categories' ),
'all_items'         => __( 'All Categories' ),
'parent_item'       => __( 'Parent Category' ),
'parent_item_colon' => __( 'Parent Category:' ),
'edit_item'         => __( 'Edit Category' ),
'update_item'       => __( 'Update Category' ),
'add_new_item'      => __( 'Add New Category' ),
'new_item_name'     => __( 'New Category Name' ),
'menu_name'         => __( 'Categories' ),
);

//OPTIONS FOR THE TAXONOMY
$args = array(
'hierarchical'      => true,
'labels'            => $labels,
'show_ui'           => true,
'show_admin_column' => true,
'query_var'         => true,
'rewrite'           => array( 'slug' => 'canvas_category' ),
);

//REGISTER THE TAXONOMY WITH WORDPRESS
register_taxonomy( 'canvas_category', array( 'canvas' ), $args );



//create two taxonomies, genres and tags for the post type "canvas"
function create_tag_taxonomies() 
{
  // Add new taxonomy, NOT hierarchical (like tags)
  $labels = array(
    'name' => _x( 'Tags', 'taxonomy general name' ),
    'singular_name' => _x( 'Tag', 'taxonomy singular name' ),
    'search_items' =>  __( 'Search Tags' ),
    'popular_items' => __( 'Popular Tags' ),
    'all_items' => __( 'All Tags' ),
    'parent_item' => null,
    'parent_item_colon' => null,
    'edit_item' => __( 'Edit Tag' ), 
    'update_item' => __( 'Update Tag' ),
    'add_new_item' => __( 'Add New Tag' ),
    'new_item_name' => __( 'New Tag Name' ),
    'separate_items_with_commas' => __( 'Separate tags with commas' ),
    'add_or_remove_items' => __( 'Add or remove tags' ),
    'choose_from_most_used' => __( 'Choose from the most used tags' ),
    'menu_name' => __( 'Tags' ),
  ); 

  register_taxonomy('tag','canvas',array(
    'hierarchical' => false,
    'labels' => $labels,
    'show_ui' => true,
    'update_count_callback' => '_update_post_term_count',
    'query_var' => true,
    'rewrite' => array( 'slug' => 'tag' ),
  ));
}
 */


/* BLOG */
/* register_post_type( 'blog',
	array(
	//LABELS FOR USE IN THE ADMIN
	'labels' => array(
	'name' => __( 'Blog' ),
	'singular_name' => __( 'Blog' ),
	'add_new_item' => __( 'Add New Blog' ),
	),
	'exclude_from_search' => false,
	'public' => true,
	'has_archive' => true,
	'supports' => array('title', 'editor',  'thumbnail', 'excerpt',  'revisions', 'page-attributes'),
	'rewrite' => array('slug' => 'blog'),
	)
);

add_action( 'init', 'create_blog_tag_taxonomies', 0 );


//Blog CUSTOM TAXONOMY Category FOR USE IN THE ADMIN
$labels = array(
'name'              => _x( 'Blog Categories', 'taxonomy general name' ),
'singular_name'     => _x( 'Blog Category', 'taxonomy singular name' ),
'search_items'      => __( 'Search all Blog Categories' ),
'all_items'         => __( 'All Blog Categories' ),
'parent_item'       => __( 'Parent Blog Category' ),
'parent_item_colon' => __( 'Parent Blog Category:' ),
'edit_item'         => __( 'Edit Blog Category' ),
'update_item'       => __( 'Update Blog Category' ),
'add_new_item'      => __( 'Add New Blog Category' ),
'new_item_name'     => __( 'New Blog Category Name' ),
'menu_name'         => __( 'Blog Categories' ),
);

//OPTIONS FOR THE TAXONOMY
$args = array(
'hierarchical'      => true,
'labels'            => $labels,
'show_ui'           => true,
'show_admin_column' => true,
'query_var'         => true,
'rewrite'           => array( 'slug' => 'blog_category' ),
);

//REGISTER THE TAXONOMY WITH WORDPRESS
register_taxonomy( 'blog_category', array( 'blog' ), $args );



//create two taxonomies, genres and tags for the post type "blog"
function create_blog_tag_taxonomies() 
{
  // Add new taxonomy, NOT hierarchical (like tags)
  $labels = array(
    'name' => _x( 'Blog Tags', 'taxonomy general name' ),
    'singular_name' => _x( 'Blog Tag', 'taxonomy singular name' ),
    'search_items' =>  __( 'Search Blog Tags' ),
    'popular_items' => __( 'Popular Blog Tags' ),
    'all_items' => __( 'All Blog Tags' ),
    'parent_item' => null,
    'parent_item_colon' => null,
    'edit_item' => __( 'Edit Blog Tag' ), 
    'update_item' => __( 'Update Blog Tag' ),
    'add_new_item' => __( 'Add New Blog Tag' ),
    'new_item_name' => __( 'New Blog Tag Name' ),
    'separate_items_with_commas' => __( 'Separate blog tags with commas' ),
    'add_or_remove_items' => __( 'Add or remove blog tags' ),
    'choose_from_most_used' => __( 'Choose from the most used blog tags' ),
    'menu_name' => __( 'Blog Tags' ),
  ); 

  register_taxonomy('blog_tag','blog',array(
    'hierarchical' => false,
    'labels' => $labels,
    'show_ui' => true,
    'update_count_callback' => '_update_post_term_count',
    'query_var' => true,
    'rewrite' => array( 'slug' => 'blog_tag' ),
  ));
} */


// REMOVE IMAGE DIMENSIONS

add_filter( 'post_thumbnail_html', 'remove_thumbnail_dimensions', 10 );
add_filter( 'image_send_to_editor', 'remove_thumbnail_dimensions', 10 );

function remove_thumbnail_dimensions( $html ) {
    $html = preg_replace( '/(width|height)=\"\d*\"\s/', "", $html );
    return $html;
}


/* Metaboxes */
include_once 'metaboxes/setup.php';
include_once 'metaboxes/post-spec.php';


// Search redirect to a custom link/keyword
function change_search_url_rewrite() {
	if ( is_search() && ! empty( $_GET['s'] ) ) {
		wp_redirect( home_url( "/search/?type=search&term=" ) . urlencode( get_query_var( 's' ) ) );
		exit();
	}	
}
add_action( 'template_redirect', 'change_search_url_rewrite' );



//Pagination for blog posts
/* function wp_blog_pagination()  
{  
    $paged  = $_POST['page_no'];  
	 
    $blog_query = new WP_Query( 'showposts=6&post_type=post&post_status=publish&paged=' . $paged );  
                          
    if ( $blog_query->have_posts() ) :   
                  
        while ( $blog_query->have_posts() ) :  
		
            $blog_query->the_post();  
                
           get_template_part( 'blog' );  
                      
        endwhile;  
          
    endif;  
                                  
    // Reset Post Data  
    wp_reset_postdata();  
      
    exit;  
}  
add_action('wp_ajax_blog_pagination', 'wp_blog_pagination'); // for logged in user  
add_action('wp_ajax_nopriv_blog_pagination', 'wp_blog_pagination'); // if user not logged in  */

function myStartSession() {
    if(!session_id()) {
        session_start();
		
		$cookie_name = "vizologi_user";
		
		if(!isset($_COOKIE[$cookie_name])) {
				setcookie($cookie_name, $_COOKIE["PHPSESSID"],time()+31556926, "/");
		} 
    }
}

add_action('init', 'myStartSession', 1);

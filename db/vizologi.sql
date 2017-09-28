-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2017 at 06:53 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vizologi`
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_alm`
--

CREATE TABLE `wp_alm` (
  `id` mediumint(9) NOT NULL,
  `name` text NOT NULL,
  `repeaterDefault` longtext NOT NULL,
  `repeaterType` text NOT NULL,
  `pluginVersion` text NOT NULL
) ;

--
-- Dumping data for table `wp_alm`
--

INSERT INTO `wp_alm` (`id`, `name`, `repeaterDefault`, `repeaterType`, `pluginVersion`) VALUES
(1, 'default', '<li <?php if (!has_post_thumbnail()) { ?> class=\"no-img\"<?php } ?>><?php if ( has_post_thumbnail() ) { the_post_thumbnail(\'alm-thumbnail\');}?><h3><a href=\"<?php the_permalink(); ?>\" title=\"<?php the_title(); ?>\"><?php the_title(); ?></a></h3><p class=\"entry-meta\"><?php the_time(\"F d, Y\"); ?></p><?php the_excerpt(); ?></li>', 'default', '3.2.0');

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext
) ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2017-09-12 11:46:55', '2017-09-12 11:46:55', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.', 0, 'post-trashed', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT ''
) ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes'
) ;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/vizologi', 'yes'),
(2, 'home', 'http://localhost/vizologi', 'yes'),
(3, 'blogname', 'Vizology Web', 'yes'),
(4, 'blogdescription', '', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'hilariogoes47@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:87:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=5&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:0:{}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'vizologi', 'yes'),
(41, 'stylesheet', 'vizologi', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '38590', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'page', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:0:{}', 'yes'),
(80, 'widget_rss', 'a:0:{}', 'yes'),
(81, 'uninstall_plugins', 'a:0:{}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '5', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'initial_db_version', '38590', 'yes'),
(92, 'wp_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(93, 'fresh_site', '0', 'yes'),
(94, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(95, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(96, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(97, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(98, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'sidebars_widgets', 'a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}', 'yes'),
(100, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'cron', 'a:4:{i:1506599215;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1506599315;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1506605657;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(109, 'nonce_key', 'CnB}xY#Z:gsgLCE^vFI`,FRD:=iE@TBa$*1aEdLvJ39i:<|vJqz`C/M47Y2>9k$5', 'no'),
(110, 'nonce_salt', '=@&8sF**`}Joc;v}.S1CS`@g>@t-+YCdxlJ@|sw);~$q{S_g12d,]fWiTQMd?;1f', 'no'),
(111, 'theme_mods_twentyseventeen', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1505216937;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}', 'yes'),
(113, '_transient_twentyseventeen_categories', '1', 'yes'),
(115, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:2:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.8.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.8.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.8.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.8.2-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-4.8.2-partial-1.zip\";s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.8.2\";s:7:\"version\";s:5:\"4.8.2\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:5:\"4.8.1\";}i:1;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.8.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.8.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.8.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.8.2-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-4.8.2-partial-1.zip\";s:8:\"rollback\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.8.2-rollback-1.zip\";}s:7:\"current\";s:5:\"4.8.2\";s:7:\"version\";s:5:\"4.8.2\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:5:\"4.8.1\";s:9:\"new_files\";s:0:\"\";}}s:12:\"last_checked\";i:1506572683;s:15:\"version_checked\";s:5:\"4.8.1\";s:12:\"translations\";a:0:{}}', 'no'),
(120, '_site_transient_update_themes', 'O:8:\"stdClass\":2:{s:12:\"last_checked\";i:1506572707;s:7:\"checked\";a:1:{s:8:\"vizologi\";s:0:\"\";}}', 'no'),
(122, 'auth_key', 's$NbW(n3G1rvt1:uB+f?Z{J$ZDKxpe-FcmZ3{~V)>#wjw&{5![?L(x7@8SR-x1,<', 'no'),
(123, 'auth_salt', 'AsB%,1L=>La#!:,1BIJ!F0wD)];S3|Dp7/y9z1fnzqy&tTZPCrD0kYeNdw ,j1bd', 'no'),
(124, 'logged_in_key', 'r~0n>U5(Plsam5==@Ta99h*|dxNV2DD#7!q vD/&>9_MU_KTcn2=|W(8>Lo)zB_t', 'no'),
(125, 'logged_in_salt', 'ts*SU}|=!T4?%$=H=}3S$Z&-o:mq{wlemW1U</fUKh%.UJbvaGc^v)f%S-M8<_RH', 'no'),
(126, '_site_transient_timeout_browser_8acc60d954a1a6cb1b1c28597ffefcf6', '1505821716', 'no'),
(127, '_site_transient_browser_8acc60d954a1a6cb1b1c28597ffefcf6', 'a:9:{s:8:\"platform\";s:9:\"Macintosh\";s:4:\"name\";s:7:\"Firefox\";s:7:\"version\";s:4:\"55.0\";s:10:\"update_url\";s:23:\"http://www.firefox.com/\";s:7:\"img_src\";s:50:\"http://s.wordpress.org/images/browsers/firefox.png\";s:11:\"img_src_ssl\";s:49:\"https://wordpress.org/images/browsers/firefox.png\";s:15:\"current_version\";s:2:\"16\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;}', 'no'),
(129, 'can_compress_scripts', '1', 'no'),
(130, '_site_transient_timeout_community-events-1aecf33ab8525ff212ebdffbb438372e', '1505260119', 'no'),
(131, '_site_transient_community-events-1aecf33ab8525ff212ebdffbb438372e', 'a:2:{s:8:\"location\";a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}s:6:\"events\";a:0:{}}', 'no'),
(142, 'current_theme', '', 'yes'),
(143, 'theme_mods_vizology', 'a:3:{i:0;b:0;s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1505220817;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}', 'yes'),
(144, 'theme_switched', '', 'yes'),
(148, 'theme_mods_vizologi', 'a:3:{i:0;b:0;s:18:\"custom_css_post_id\";i:-1;s:18:\"nav_menu_locations\";a:5:{s:9:\"in_header\";i:2;s:13:\"dropdown_menu\";i:3;s:9:\"in_footer\";i:4;s:10:\"in_footer2\";i:5;s:7:\"sidebar\";i:12;}}', 'yes'),
(168, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(220, 'canvas_category_children', 'a:0:{}', 'yes'),
(312, 'blog_category_children', 'a:0:{}', 'yes'),
(322, 'core_updater.lock', '1506157733', 'no'),
(327, '_transient_timeout_plugin_slugs', '1506623440', 'no'),
(328, '_transient_plugin_slugs', 'a:1:{i:0;s:33:\"ajax-load-more/ajax-load-more.php\";}', 'no'),
(329, 'recently_activated', 'a:1:{s:33:\"ajax-load-more/ajax-load-more.php\";i:1506537040;}', 'yes'),
(330, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1506181789', 'no'),
(331, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'O:8:\"stdClass\":100:{s:6:\"widget\";a:3:{s:4:\"name\";s:6:\"widget\";s:4:\"slug\";s:6:\"widget\";s:5:\"count\";i:4378;}s:4:\"post\";a:3:{s:4:\"name\";s:4:\"post\";s:4:\"slug\";s:4:\"post\";s:5:\"count\";i:2504;}s:5:\"admin\";a:3:{s:4:\"name\";s:5:\"admin\";s:4:\"slug\";s:5:\"admin\";s:5:\"count\";i:2375;}s:11:\"woocommerce\";a:3:{s:4:\"name\";s:11:\"woocommerce\";s:4:\"slug\";s:11:\"woocommerce\";s:5:\"count\";i:2311;}s:5:\"posts\";a:3:{s:4:\"name\";s:5:\"posts\";s:4:\"slug\";s:5:\"posts\";s:5:\"count\";i:1833;}s:8:\"comments\";a:3:{s:4:\"name\";s:8:\"comments\";s:4:\"slug\";s:8:\"comments\";s:5:\"count\";i:1604;}s:9:\"shortcode\";a:3:{s:4:\"name\";s:9:\"shortcode\";s:4:\"slug\";s:9:\"shortcode\";s:5:\"count\";i:1593;}s:7:\"twitter\";a:3:{s:4:\"name\";s:7:\"twitter\";s:4:\"slug\";s:7:\"twitter\";s:5:\"count\";i:1440;}s:6:\"google\";a:3:{s:4:\"name\";s:6:\"google\";s:4:\"slug\";s:6:\"google\";s:5:\"count\";i:1357;}s:6:\"images\";a:3:{s:4:\"name\";s:6:\"images\";s:4:\"slug\";s:6:\"images\";s:5:\"count\";i:1353;}s:8:\"facebook\";a:3:{s:4:\"name\";s:8:\"facebook\";s:4:\"slug\";s:8:\"facebook\";s:5:\"count\";i:1345;}s:5:\"image\";a:3:{s:4:\"name\";s:5:\"image\";s:4:\"slug\";s:5:\"image\";s:5:\"count\";i:1279;}s:7:\"sidebar\";a:3:{s:4:\"name\";s:7:\"sidebar\";s:4:\"slug\";s:7:\"sidebar\";s:5:\"count\";i:1273;}s:3:\"seo\";a:3:{s:4:\"name\";s:3:\"seo\";s:4:\"slug\";s:3:\"seo\";s:5:\"count\";i:1136;}s:7:\"gallery\";a:3:{s:4:\"name\";s:7:\"gallery\";s:4:\"slug\";s:7:\"gallery\";s:5:\"count\";i:1058;}s:4:\"page\";a:3:{s:4:\"name\";s:4:\"page\";s:4:\"slug\";s:4:\"page\";s:5:\"count\";i:1050;}s:6:\"social\";a:3:{s:4:\"name\";s:6:\"social\";s:4:\"slug\";s:6:\"social\";s:5:\"count\";i:998;}s:5:\"email\";a:3:{s:4:\"name\";s:5:\"email\";s:4:\"slug\";s:5:\"email\";s:5:\"count\";i:946;}s:5:\"login\";a:3:{s:4:\"name\";s:5:\"login\";s:4:\"slug\";s:5:\"login\";s:5:\"count\";i:817;}s:5:\"links\";a:3:{s:4:\"name\";s:5:\"links\";s:4:\"slug\";s:5:\"links\";s:5:\"count\";i:815;}s:9:\"ecommerce\";a:3:{s:4:\"name\";s:9:\"ecommerce\";s:4:\"slug\";s:9:\"ecommerce\";s:5:\"count\";i:812;}s:7:\"widgets\";a:3:{s:4:\"name\";s:7:\"widgets\";s:4:\"slug\";s:7:\"widgets\";s:5:\"count\";i:774;}s:5:\"video\";a:3:{s:4:\"name\";s:5:\"video\";s:4:\"slug\";s:5:\"video\";s:5:\"count\";i:772;}s:7:\"content\";a:3:{s:4:\"name\";s:7:\"content\";s:4:\"slug\";s:7:\"content\";s:5:\"count\";i:670;}s:3:\"rss\";a:3:{s:4:\"name\";s:3:\"rss\";s:4:\"slug\";s:3:\"rss\";s:5:\"count\";i:669;}s:10:\"buddypress\";a:3:{s:4:\"name\";s:10:\"buddypress\";s:4:\"slug\";s:10:\"buddypress\";s:5:\"count\";i:664;}s:4:\"spam\";a:3:{s:4:\"name\";s:4:\"spam\";s:4:\"slug\";s:4:\"spam\";s:5:\"count\";i:655;}s:8:\"security\";a:3:{s:4:\"name\";s:8:\"security\";s:4:\"slug\";s:8:\"security\";s:5:\"count\";i:647;}s:5:\"pages\";a:3:{s:4:\"name\";s:5:\"pages\";s:4:\"slug\";s:5:\"pages\";s:5:\"count\";i:645;}s:6:\"jquery\";a:3:{s:4:\"name\";s:6:\"jquery\";s:4:\"slug\";s:6:\"jquery\";s:5:\"count\";i:637;}s:6:\"slider\";a:3:{s:4:\"name\";s:6:\"slider\";s:4:\"slug\";s:6:\"slider\";s:5:\"count\";i:625;}s:5:\"media\";a:3:{s:4:\"name\";s:5:\"media\";s:4:\"slug\";s:5:\"media\";s:5:\"count\";i:611;}s:9:\"analytics\";a:3:{s:4:\"name\";s:9:\"analytics\";s:4:\"slug\";s:9:\"analytics\";s:5:\"count\";i:596;}s:4:\"ajax\";a:3:{s:4:\"name\";s:4:\"ajax\";s:4:\"slug\";s:4:\"ajax\";s:5:\"count\";i:594;}s:4:\"feed\";a:3:{s:4:\"name\";s:4:\"feed\";s:4:\"slug\";s:4:\"feed\";s:5:\"count\";i:589;}s:6:\"search\";a:3:{s:4:\"name\";s:6:\"search\";s:4:\"slug\";s:6:\"search\";s:5:\"count\";i:584;}s:10:\"e-commerce\";a:3:{s:4:\"name\";s:10:\"e-commerce\";s:4:\"slug\";s:10:\"e-commerce\";s:5:\"count\";i:577;}s:8:\"category\";a:3:{s:4:\"name\";s:8:\"category\";s:4:\"slug\";s:8:\"category\";s:5:\"count\";i:576;}s:4:\"menu\";a:3:{s:4:\"name\";s:4:\"menu\";s:4:\"slug\";s:4:\"menu\";s:5:\"count\";i:561;}s:4:\"form\";a:3:{s:4:\"name\";s:4:\"form\";s:4:\"slug\";s:4:\"form\";s:5:\"count\";i:557;}s:5:\"embed\";a:3:{s:4:\"name\";s:5:\"embed\";s:4:\"slug\";s:5:\"embed\";s:5:\"count\";i:543;}s:10:\"javascript\";a:3:{s:4:\"name\";s:10:\"javascript\";s:4:\"slug\";s:10:\"javascript\";s:5:\"count\";i:535;}s:4:\"link\";a:3:{s:4:\"name\";s:4:\"link\";s:4:\"slug\";s:4:\"link\";s:5:\"count\";i:525;}s:3:\"css\";a:3:{s:4:\"name\";s:3:\"css\";s:4:\"slug\";s:3:\"css\";s:5:\"count\";i:519;}s:5:\"share\";a:3:{s:4:\"name\";s:5:\"share\";s:4:\"slug\";s:5:\"share\";s:5:\"count\";i:505;}s:7:\"youtube\";a:3:{s:4:\"name\";s:7:\"youtube\";s:4:\"slug\";s:7:\"youtube\";s:5:\"count\";i:502;}s:7:\"comment\";a:3:{s:4:\"name\";s:7:\"comment\";s:4:\"slug\";s:7:\"comment\";s:5:\"count\";i:496;}s:5:\"theme\";a:3:{s:4:\"name\";s:5:\"theme\";s:4:\"slug\";s:5:\"theme\";s:5:\"count\";i:488;}s:9:\"dashboard\";a:3:{s:4:\"name\";s:9:\"dashboard\";s:4:\"slug\";s:9:\"dashboard\";s:5:\"count\";i:477;}s:6:\"custom\";a:3:{s:4:\"name\";s:6:\"custom\";s:4:\"slug\";s:6:\"custom\";s:5:\"count\";i:475;}s:10:\"categories\";a:3:{s:4:\"name\";s:10:\"categories\";s:4:\"slug\";s:10:\"categories\";s:5:\"count\";i:474;}s:10:\"responsive\";a:3:{s:4:\"name\";s:10:\"responsive\";s:4:\"slug\";s:10:\"responsive\";s:5:\"count\";i:470;}s:3:\"ads\";a:3:{s:4:\"name\";s:3:\"ads\";s:4:\"slug\";s:3:\"ads\";s:5:\"count\";i:449;}s:6:\"editor\";a:3:{s:4:\"name\";s:6:\"editor\";s:4:\"slug\";s:6:\"editor\";s:5:\"count\";i:447;}s:9:\"affiliate\";a:3:{s:4:\"name\";s:9:\"affiliate\";s:4:\"slug\";s:9:\"affiliate\";s:5:\"count\";i:442;}s:6:\"button\";a:3:{s:4:\"name\";s:6:\"button\";s:4:\"slug\";s:6:\"button\";s:5:\"count\";i:440;}s:4:\"tags\";a:3:{s:4:\"name\";s:4:\"tags\";s:4:\"slug\";s:4:\"tags\";s:5:\"count\";i:440;}s:12:\"contact-form\";a:3:{s:4:\"name\";s:12:\"contact form\";s:4:\"slug\";s:12:\"contact-form\";s:5:\"count\";i:436;}s:4:\"user\";a:3:{s:4:\"name\";s:4:\"user\";s:4:\"slug\";s:4:\"user\";s:5:\"count\";i:421;}s:5:\"photo\";a:3:{s:4:\"name\";s:5:\"photo\";s:4:\"slug\";s:5:\"photo\";s:5:\"count\";i:417;}s:6:\"mobile\";a:3:{s:4:\"name\";s:6:\"mobile\";s:4:\"slug\";s:6:\"mobile\";s:5:\"count\";i:410;}s:5:\"users\";a:3:{s:4:\"name\";s:5:\"users\";s:4:\"slug\";s:5:\"users\";s:5:\"count\";i:407;}s:9:\"slideshow\";a:3:{s:4:\"name\";s:9:\"slideshow\";s:4:\"slug\";s:9:\"slideshow\";s:5:\"count\";i:405;}s:7:\"contact\";a:3:{s:4:\"name\";s:7:\"contact\";s:4:\"slug\";s:7:\"contact\";s:5:\"count\";i:405;}s:5:\"stats\";a:3:{s:4:\"name\";s:5:\"stats\";s:4:\"slug\";s:5:\"stats\";s:5:\"count\";i:401;}s:6:\"photos\";a:3:{s:4:\"name\";s:6:\"photos\";s:4:\"slug\";s:6:\"photos\";s:5:\"count\";i:396;}s:3:\"api\";a:3:{s:4:\"name\";s:3:\"api\";s:4:\"slug\";s:3:\"api\";s:5:\"count\";i:386;}s:10:\"statistics\";a:3:{s:4:\"name\";s:10:\"statistics\";s:4:\"slug\";s:10:\"statistics\";s:5:\"count\";i:383;}s:6:\"events\";a:3:{s:4:\"name\";s:6:\"events\";s:4:\"slug\";s:6:\"events\";s:5:\"count\";i:381;}s:10:\"navigation\";a:3:{s:4:\"name\";s:10:\"navigation\";s:4:\"slug\";s:10:\"navigation\";s:5:\"count\";i:370;}s:4:\"news\";a:3:{s:4:\"name\";s:4:\"news\";s:4:\"slug\";s:4:\"news\";s:5:\"count\";i:353;}s:8:\"calendar\";a:3:{s:4:\"name\";s:8:\"calendar\";s:4:\"slug\";s:8:\"calendar\";s:5:\"count\";i:344;}s:7:\"payment\";a:3:{s:4:\"name\";s:7:\"payment\";s:4:\"slug\";s:7:\"payment\";s:5:\"count\";i:340;}s:9:\"multisite\";a:3:{s:4:\"name\";s:9:\"multisite\";s:4:\"slug\";s:9:\"multisite\";s:5:\"count\";i:332;}s:7:\"plugins\";a:3:{s:4:\"name\";s:7:\"plugins\";s:4:\"slug\";s:7:\"plugins\";s:5:\"count\";i:332;}s:10:\"newsletter\";a:3:{s:4:\"name\";s:10:\"newsletter\";s:4:\"slug\";s:10:\"newsletter\";s:5:\"count\";i:331;}s:12:\"social-media\";a:3:{s:4:\"name\";s:12:\"social media\";s:4:\"slug\";s:12:\"social-media\";s:5:\"count\";i:330;}s:10:\"shortcodes\";a:3:{s:4:\"name\";s:10:\"shortcodes\";s:4:\"slug\";s:10:\"shortcodes\";s:5:\"count\";i:330;}s:5:\"popup\";a:3:{s:4:\"name\";s:5:\"popup\";s:4:\"slug\";s:5:\"popup\";s:5:\"count\";i:327;}s:4:\"code\";a:3:{s:4:\"name\";s:4:\"code\";s:4:\"slug\";s:4:\"code\";s:5:\"count\";i:326;}s:4:\"meta\";a:3:{s:4:\"name\";s:4:\"meta\";s:4:\"slug\";s:4:\"meta\";s:5:\"count\";i:323;}s:4:\"list\";a:3:{s:4:\"name\";s:4:\"list\";s:4:\"slug\";s:4:\"list\";s:5:\"count\";i:321;}s:3:\"url\";a:3:{s:4:\"name\";s:3:\"url\";s:4:\"slug\";s:3:\"url\";s:5:\"count\";i:321;}s:9:\"marketing\";a:3:{s:4:\"name\";s:9:\"marketing\";s:4:\"slug\";s:9:\"marketing\";s:5:\"count\";i:314;}s:4:\"chat\";a:3:{s:4:\"name\";s:4:\"chat\";s:4:\"slug\";s:4:\"chat\";s:5:\"count\";i:303;}s:8:\"redirect\";a:3:{s:4:\"name\";s:8:\"redirect\";s:4:\"slug\";s:8:\"redirect\";s:5:\"count\";i:300;}s:6:\"simple\";a:3:{s:4:\"name\";s:6:\"simple\";s:4:\"slug\";s:6:\"simple\";s:5:\"count\";i:300;}s:16:\"custom-post-type\";a:3:{s:4:\"name\";s:16:\"custom post type\";s:4:\"slug\";s:16:\"custom-post-type\";s:5:\"count\";i:293;}s:15:\"payment-gateway\";a:3:{s:4:\"name\";s:15:\"payment gateway\";s:4:\"slug\";s:15:\"payment-gateway\";s:5:\"count\";i:293;}s:3:\"tag\";a:3:{s:4:\"name\";s:3:\"tag\";s:4:\"slug\";s:3:\"tag\";s:5:\"count\";i:292;}s:5:\"forms\";a:3:{s:4:\"name\";s:5:\"forms\";s:4:\"slug\";s:5:\"forms\";s:5:\"count\";i:287;}s:11:\"advertising\";a:3:{s:4:\"name\";s:11:\"advertising\";s:4:\"slug\";s:11:\"advertising\";s:5:\"count\";i:286;}s:7:\"adsense\";a:3:{s:4:\"name\";s:7:\"adsense\";s:4:\"slug\";s:7:\"adsense\";s:5:\"count\";i:284;}s:6:\"author\";a:3:{s:4:\"name\";s:6:\"author\";s:4:\"slug\";s:6:\"author\";s:5:\"count\";i:283;}s:4:\"html\";a:3:{s:4:\"name\";s:4:\"html\";s:4:\"slug\";s:4:\"html\";s:5:\"count\";i:279;}s:8:\"lightbox\";a:3:{s:4:\"name\";s:8:\"lightbox\";s:4:\"slug\";s:8:\"lightbox\";s:5:\"count\";i:277;}s:8:\"tracking\";a:3:{s:4:\"name\";s:8:\"tracking\";s:4:\"slug\";s:8:\"tracking\";s:5:\"count\";i:274;}s:12:\"notification\";a:3:{s:4:\"name\";s:12:\"notification\";s:4:\"slug\";s:12:\"notification\";s:5:\"count\";i:274;}s:7:\"tinymce\";a:3:{s:4:\"name\";s:7:\"tinyMCE\";s:4:\"slug\";s:7:\"tinymce\";s:5:\"count\";i:272;}s:7:\"captcha\";a:3:{s:4:\"name\";s:7:\"captcha\";s:4:\"slug\";s:7:\"captcha\";s:5:\"count\";i:271;}}', 'no'),
(335, '_site_transient_update_plugins', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1506572695;s:8:\"response\";N;s:12:\"translations\";N;s:9:\"no_update\";N;}', 'no'),
(336, 'alm_version', '3.2.0', 'yes'),
(337, 'alm_settings', 'a:10:{s:19:\"_alm_container_type\";s:1:\"2\";s:14:\"_alm_classname\";s:0:\"\";s:16:\"_alm_disable_css\";s:1:\"1\";s:14:\"_alm_btn_color\";s:7:\"default\";s:18:\"_alm_btn_classname\";s:13:\"load-more-btn\";s:19:\"_alm_nonce_security\";s:1:\"1\";s:15:\"_alm_scroll_top\";s:1:\"1\";s:20:\"_alm_disable_dynamic\";s:1:\"0\";s:13:\"_alm_hide_btn\";s:1:\"1\";s:18:\"_alm_error_notices\";s:1:\"1\";}', 'yes'),
(355, '_site_transient_timeout_browser_2b4bfa48262a79b6d8fe0f2344cb5695', '1507043658', 'no'),
(356, '_site_transient_browser_2b4bfa48262a79b6d8fe0f2344cb5695', 'a:9:{s:4:\"name\";s:7:\"Firefox\";s:7:\"version\";s:4:\"56.0\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:24:\"https://www.firefox.com/\";s:7:\"img_src\";s:44:\"http://s.w.org/images/browsers/firefox.png?1\";s:11:\"img_src_ssl\";s:45:\"https://s.w.org/images/browsers/firefox.png?1\";s:15:\"current_version\";s:2:\"16\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;}', 'no'),
(373, '_site_transient_timeout_browser_f4b342427dc93e6e5fd5c14ef1fb74ec', '1507140757', 'no'),
(374, '_site_transient_browser_f4b342427dc93e6e5fd5c14ef1fb74ec', 'a:10:{s:4:\"name\";s:7:\"Firefox\";s:7:\"version\";s:4:\"57.0\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:24:\"https://www.firefox.com/\";s:7:\"img_src\";s:44:\"http://s.w.org/images/browsers/firefox.png?1\";s:11:\"img_src_ssl\";s:45:\"https://s.w.org/images/browsers/firefox.png?1\";s:15:\"current_version\";s:2:\"16\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(375, '_site_transient_timeout_community-events-4501c091b0366d76ea3218b6cfdd8097', '1506579163', 'no'),
(376, '_site_transient_community-events-4501c091b0366d76ea3218b6cfdd8097', 'a:2:{s:8:\"location\";a:1:{s:2:\"ip\";s:2:\"::\";}s:6:\"events\";a:1:{i:0;a:7:{s:4:\"type\";s:6:\"meetup\";s:5:\"title\";s:46:\"Global Translation Day and discuss Open Source\";s:3:\"url\";s:53:\"https://www.meetup.com/WordPressGoa/events/242587347/\";s:6:\"meetup\";s:13:\"WordPress Goa\";s:10:\"meetup_url\";s:36:\"https://www.meetup.com/WordPressGoa/\";s:4:\"date\";s:19:\"2017-09-30 11:00:00\";s:8:\"location\";a:4:{s:8:\"location\";s:13:\"Panaji, India\";s:7:\"country\";s:2:\"in\";s:8:\"latitude\";d:15.5;s:9:\"longitude\";d:73.809997558594006;}}}}', 'no'),
(377, '_transient_timeout_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1506579165', 'no'),
(378, '_transient_timeout_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1506579166', 'no'),
(379, '_transient_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1506535966', 'no'),
(380, '_transient_timeout_feed_d117b5738fbd35bd8c0391cda1f2b5d9', '1506579168', 'no'),
(381, '_transient_timeout_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1506579168', 'no'),
(382, '_transient_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1506535968', 'no'),
(383, '_transient_timeout_dash_v2_88ae138922fe95674369b1cb3d215a2b', '1506579168', 'no'),
(384, '_transient_dash_v2_88ae138922fe95674369b1cb3d215a2b', '<div class=\"rss-widget\"><ul><li><a class=\'rsswidget\' href=\'https://wordpress.org/news/2017/09/global-wordpress-translation-day-3/\'>Global WordPress Translation Day 3</a></li></ul></div><div class=\"rss-widget\"><ul><li><a class=\'rsswidget\' href=\'https://wordpress.org/news/2017/09/global-wordpress-translation-day-3/\'>Dev Blog: Global WordPress Translation Day 3</a></li><li><a class=\'rsswidget\' href=\'https://heropress.com/essays/challenge-gladly-accepted/#utm_source=rss&#038;utm_medium=rss&#038;utm_campaign=challenge-gladly-accepted\'>HeroPress: Challenge Gladly Accepted</a></li><li><a class=\'rsswidget\' href=\'https://wptavern.com/wordpress-core-javascript-framework-selection-discussion-continues-with-input-from-open-source-community-leaders\'>WPTavern: WordPress Core JavaScript Framework Selection Discussion Continues with Input from Open Source Community Leaders</a></li></ul></div>', 'no'),
(386, 'category_children', 'a:0:{}', 'yes'),
(403, '_transient_doing_cron', '1506572672.8307220935821533203125', 'yes'),
(404, '_site_transient_timeout_theme_roots', '1506574507', 'no'),
(405, '_site_transient_theme_roots', 'a:1:{s:8:\"vizologi\";s:7:\"/themes\";}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext
) ;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 2, '_wp_trash_meta_status', 'publish'),
(3, 2, '_wp_trash_meta_time', '1505217453'),
(4, 2, '_wp_desired_post_slug', 'sample-page'),
(5, 5, '_edit_last', '1'),
(6, 5, '_edit_lock', '1506536121:1'),
(7, 5, '_wp_page_template', 'templates/template-homepage.php'),
(8, 7, '_edit_last', '1'),
(9, 7, '_edit_lock', '1506536540:1'),
(10, 7, '_wp_page_template', 'templates/template-blog.php'),
(11, 8, '_edit_last', '1'),
(12, 8, '_edit_lock', '1505937403:1'),
(13, 8, '_wp_page_template', 'templates/template-about.php'),
(14, 9, '_edit_last', '1'),
(15, 9, '_edit_lock', '1506030144:1'),
(16, 9, '_wp_page_template', 'templates/template-inner-no-title.php'),
(17, 13, '_menu_item_type', 'post_type'),
(18, 13, '_menu_item_menu_item_parent', '0'),
(19, 13, '_menu_item_object_id', '9'),
(20, 13, '_menu_item_object', 'page'),
(21, 13, '_menu_item_target', ''),
(22, 13, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(23, 13, '_menu_item_xfn', ''),
(24, 13, '_menu_item_url', ''),
(26, 14, '_menu_item_type', 'post_type'),
(27, 14, '_menu_item_menu_item_parent', '0'),
(28, 14, '_menu_item_object_id', '8'),
(29, 14, '_menu_item_object', 'page'),
(30, 14, '_menu_item_target', ''),
(31, 14, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(32, 14, '_menu_item_xfn', ''),
(33, 14, '_menu_item_url', ''),
(35, 15, '_menu_item_type', 'post_type'),
(36, 15, '_menu_item_menu_item_parent', '0'),
(37, 15, '_menu_item_object_id', '7'),
(38, 15, '_menu_item_object', 'page'),
(39, 15, '_menu_item_target', ''),
(40, 15, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(41, 15, '_menu_item_xfn', ''),
(42, 15, '_menu_item_url', ''),
(43, 17, '_edit_last', '1'),
(44, 17, '_edit_lock', '1505677853:1'),
(45, 17, '_wp_page_template', 'templates/template-terms.php'),
(46, 18, '_edit_last', '1'),
(47, 18, '_edit_lock', '1505677851:1'),
(48, 18, '_wp_page_template', 'templates/template-terms.php'),
(49, 19, '_edit_last', '1'),
(50, 19, '_edit_lock', '1505470446:1'),
(51, 19, '_wp_page_template', 'templates/template-inner.php'),
(52, 20, '_edit_last', '1'),
(53, 20, '_edit_lock', '1506529210:1'),
(54, 20, '_wp_page_template', 'templates/template-inner.php'),
(55, 21, '_edit_last', '1'),
(56, 21, '_edit_lock', '1505677852:1'),
(57, 21, '_wp_page_template', 'templates/template-terms.php'),
(58, 32, '_menu_item_type', 'post_type'),
(59, 32, '_menu_item_menu_item_parent', '0'),
(60, 32, '_menu_item_object_id', '21'),
(61, 32, '_menu_item_object', 'page'),
(62, 32, '_menu_item_target', ''),
(63, 32, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(64, 32, '_menu_item_xfn', ''),
(65, 32, '_menu_item_url', ''),
(67, 33, '_menu_item_type', 'post_type'),
(68, 33, '_menu_item_menu_item_parent', '0'),
(69, 33, '_menu_item_object_id', '20'),
(70, 33, '_menu_item_object', 'page'),
(71, 33, '_menu_item_target', ''),
(72, 33, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(73, 33, '_menu_item_xfn', ''),
(74, 33, '_menu_item_url', ''),
(76, 34, '_menu_item_type', 'post_type'),
(77, 34, '_menu_item_menu_item_parent', '0'),
(78, 34, '_menu_item_object_id', '19'),
(79, 34, '_menu_item_object', 'page'),
(80, 34, '_menu_item_target', ''),
(81, 34, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(82, 34, '_menu_item_xfn', ''),
(83, 34, '_menu_item_url', ''),
(85, 35, '_menu_item_type', 'post_type'),
(86, 35, '_menu_item_menu_item_parent', '0'),
(87, 35, '_menu_item_object_id', '18'),
(88, 35, '_menu_item_object', 'page'),
(89, 35, '_menu_item_target', ''),
(90, 35, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(91, 35, '_menu_item_xfn', ''),
(92, 35, '_menu_item_url', ''),
(94, 36, '_menu_item_type', 'post_type'),
(95, 36, '_menu_item_menu_item_parent', '0'),
(96, 36, '_menu_item_object_id', '17'),
(97, 36, '_menu_item_object', 'page'),
(98, 36, '_menu_item_target', ''),
(99, 36, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(100, 36, '_menu_item_xfn', ''),
(101, 36, '_menu_item_url', ''),
(103, 37, '_menu_item_type', 'post_type'),
(104, 37, '_menu_item_menu_item_parent', '0'),
(105, 37, '_menu_item_object_id', '21'),
(106, 37, '_menu_item_object', 'page'),
(107, 37, '_menu_item_target', ''),
(108, 37, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(109, 37, '_menu_item_xfn', ''),
(110, 37, '_menu_item_url', ''),
(112, 38, '_menu_item_type', 'post_type'),
(113, 38, '_menu_item_menu_item_parent', '0'),
(114, 38, '_menu_item_object_id', '20'),
(115, 38, '_menu_item_object', 'page'),
(116, 38, '_menu_item_target', ''),
(117, 38, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(118, 38, '_menu_item_xfn', ''),
(119, 38, '_menu_item_url', ''),
(121, 39, '_menu_item_type', 'post_type'),
(122, 39, '_menu_item_menu_item_parent', '0'),
(123, 39, '_menu_item_object_id', '19'),
(124, 39, '_menu_item_object', 'page'),
(125, 39, '_menu_item_target', ''),
(126, 39, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(127, 39, '_menu_item_xfn', ''),
(128, 39, '_menu_item_url', ''),
(130, 40, '_menu_item_type', 'post_type'),
(131, 40, '_menu_item_menu_item_parent', '0'),
(132, 40, '_menu_item_object_id', '9'),
(133, 40, '_menu_item_object', 'page'),
(134, 40, '_menu_item_target', ''),
(135, 40, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(136, 40, '_menu_item_xfn', ''),
(137, 40, '_menu_item_url', ''),
(139, 41, '_menu_item_type', 'post_type'),
(140, 41, '_menu_item_menu_item_parent', '0'),
(141, 41, '_menu_item_object_id', '8'),
(142, 41, '_menu_item_object', 'page'),
(143, 41, '_menu_item_target', ''),
(144, 41, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(145, 41, '_menu_item_xfn', ''),
(146, 41, '_menu_item_url', ''),
(148, 42, '_menu_item_type', 'post_type'),
(149, 42, '_menu_item_menu_item_parent', '0'),
(150, 42, '_menu_item_object_id', '7'),
(151, 42, '_menu_item_object', 'page'),
(152, 42, '_menu_item_target', ''),
(153, 42, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(154, 42, '_menu_item_xfn', ''),
(155, 42, '_menu_item_url', ''),
(157, 43, '_menu_item_type', 'post_type'),
(158, 43, '_menu_item_menu_item_parent', '0'),
(159, 43, '_menu_item_object_id', '5'),
(160, 43, '_menu_item_object', 'page'),
(161, 43, '_menu_item_target', ''),
(162, 43, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(163, 43, '_menu_item_xfn', ''),
(164, 43, '_menu_item_url', ''),
(166, 44, '_menu_item_type', 'post_type'),
(167, 44, '_menu_item_menu_item_parent', '0'),
(168, 44, '_menu_item_object_id', '18'),
(169, 44, '_menu_item_object', 'page'),
(170, 44, '_menu_item_target', ''),
(171, 44, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(172, 44, '_menu_item_xfn', ''),
(173, 44, '_menu_item_url', ''),
(175, 45, '_menu_item_type', 'post_type'),
(176, 45, '_menu_item_menu_item_parent', '0'),
(177, 45, '_menu_item_object_id', '17'),
(178, 45, '_menu_item_object', 'page'),
(179, 45, '_menu_item_target', ''),
(180, 45, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(181, 45, '_menu_item_xfn', ''),
(182, 45, '_menu_item_url', ''),
(184, 46, '_menu_item_type', 'custom'),
(185, 46, '_menu_item_menu_item_parent', '0'),
(186, 46, '_menu_item_object_id', '46'),
(187, 46, '_menu_item_object', 'custom'),
(188, 46, '_menu_item_target', ''),
(189, 46, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(190, 46, '_menu_item_xfn', ''),
(191, 46, '_menu_item_url', 'mailto:contact@vizologi.com'),
(193, 51, '_edit_last', '1'),
(194, 51, '_edit_lock', '1505561005:1'),
(195, 52, '_edit_last', '1'),
(196, 52, '_edit_lock', '1505557065:1'),
(197, 53, '_edit_last', '1'),
(198, 53, '_edit_lock', '1505552026:1'),
(199, 54, '_edit_last', '1'),
(200, 54, '_edit_lock', '1505552019:1'),
(201, 55, '_wp_attached_file', '2017/09/001-viz-home_03.jpg'),
(202, 55, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:380;s:6:\"height\";i:229;s:4:\"file\";s:27:\"2017/09/001-viz-home_03.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:27:\"001-viz-home_03-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:27:\"001-viz-home_03-300x181.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:181;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(203, 56, '_wp_attached_file', '2017/09/001-viz-home_03-05.jpg'),
(204, 56, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:380;s:6:\"height\";i:229;s:4:\"file\";s:30:\"2017/09/001-viz-home_03-05.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:30:\"001-viz-home_03-05-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:30:\"001-viz-home_03-05-300x181.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:181;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(205, 57, '_wp_attached_file', '2017/09/001-viz-home_03-07.jpg'),
(206, 57, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:380;s:6:\"height\";i:229;s:4:\"file\";s:30:\"2017/09/001-viz-home_03-07.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:30:\"001-viz-home_03-07-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:30:\"001-viz-home_03-07-300x181.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:181;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(207, 58, '_wp_attached_file', '2017/09/001-viz-home_03-12.jpg'),
(208, 58, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:380;s:6:\"height\";i:229;s:4:\"file\";s:30:\"2017/09/001-viz-home_03-12.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:30:\"001-viz-home_03-12-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:30:\"001-viz-home_03-12-300x181.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:181;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(209, 51, '_thumbnail_id', '55'),
(210, 52, '_thumbnail_id', '56'),
(211, 53, '_thumbnail_id', '57'),
(212, 54, '_thumbnail_id', '58'),
(213, 63, '_edit_last', '1'),
(214, 63, '_edit_lock', '1505573576:1'),
(215, 64, '_edit_last', '1'),
(216, 64, '_edit_lock', '1505573577:1'),
(217, 65, '_edit_last', '1'),
(218, 65, '_edit_lock', '1505573579:1'),
(219, 63, '_wp_trash_meta_status', 'publish'),
(220, 63, '_wp_trash_meta_time', '1505573717'),
(221, 63, '_wp_desired_post_slug', 'qwfqwasf'),
(222, 64, '_wp_trash_meta_status', 'publish'),
(223, 64, '_wp_trash_meta_time', '1505573719'),
(224, 64, '_wp_desired_post_slug', 'af'),
(225, 65, '_wp_trash_meta_status', 'publish'),
(226, 65, '_wp_trash_meta_time', '1505573722'),
(227, 65, '_wp_desired_post_slug', 'ehdfb'),
(228, 70, '_menu_item_type', 'post_type'),
(229, 70, '_menu_item_menu_item_parent', '0'),
(230, 70, '_menu_item_object_id', '21'),
(231, 70, '_menu_item_object', 'page'),
(232, 70, '_menu_item_target', ''),
(233, 70, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(234, 70, '_menu_item_xfn', ''),
(235, 70, '_menu_item_url', ''),
(237, 71, '_menu_item_type', 'post_type'),
(238, 71, '_menu_item_menu_item_parent', '0'),
(239, 71, '_menu_item_object_id', '18'),
(240, 71, '_menu_item_object', 'page'),
(241, 71, '_menu_item_target', ''),
(242, 71, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(243, 71, '_menu_item_xfn', ''),
(244, 71, '_menu_item_url', ''),
(246, 72, '_menu_item_type', 'post_type'),
(247, 72, '_menu_item_menu_item_parent', '0'),
(248, 72, '_menu_item_object_id', '17'),
(249, 72, '_menu_item_object', 'page'),
(250, 72, '_menu_item_target', ''),
(251, 72, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(252, 72, '_menu_item_xfn', ''),
(253, 72, '_menu_item_url', ''),
(254, 77, '_wp_attached_file', '2017/09/about-2.png'),
(255, 77, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:201;s:6:\"height\";i:201;s:4:\"file\";s:19:\"2017/09/about-2.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"about-2-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(256, 78, '_wp_attached_file', '2017/09/about-3.png'),
(257, 78, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:408;s:6:\"height\";i:314;s:4:\"file\";s:19:\"2017/09/about-3.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"about-3-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:19:\"about-3-300x231.png\";s:5:\"width\";i:300;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(258, 79, '_wp_attached_file', '2017/09/about-4.png'),
(259, 79, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:198;s:6:\"height\";i:198;s:4:\"file\";s:19:\"2017/09/about-4.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"about-4-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(260, 93, '_wp_attached_file', '2017/09/about-5.jpg'),
(261, 93, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:176;s:6:\"height\";i:175;s:4:\"file\";s:19:\"2017/09/about-5.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"about-5-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(262, 105, '_edit_last', '1'),
(263, 105, '_edit_lock', '1506536388:1'),
(264, 106, '_edit_last', '1'),
(265, 106, '_edit_lock', '1506536380:1'),
(266, 107, '_edit_last', '1'),
(267, 107, '_edit_lock', '1506536334:1'),
(268, 108, '_edit_last', '1'),
(269, 108, '_edit_lock', '1506536296:1'),
(270, 109, '_edit_last', '1'),
(271, 109, '_edit_lock', '1506536279:1'),
(272, 110, '_edit_last', '1'),
(273, 110, '_edit_lock', '1506536226:1'),
(274, 117, '_wp_attached_file', '2017/09/004-viz-blog_03.jpg'),
(275, 117, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:380;s:6:\"height\";i:265;s:4:\"file\";s:27:\"2017/09/004-viz-blog_03.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:27:\"004-viz-blog_03-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:27:\"004-viz-blog_03-300x209.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:209;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(276, 107, '_thumbnail_id', '117'),
(279, 1, '_wp_trash_meta_status', 'publish'),
(280, 1, '_wp_trash_meta_time', '1506536283'),
(281, 1, '_wp_desired_post_slug', 'hello-world'),
(282, 1, '_wp_trash_meta_comments_status', 'a:1:{i:1;s:1:\"1\";}'),
(283, 128, '_edit_last', '1'),
(284, 128, '_edit_lock', '1506536249:1'),
(285, 110, '_wp_trash_meta_status', 'publish'),
(286, 110, '_wp_trash_meta_time', '1506536370'),
(287, 110, '_wp_desired_post_slug', 'nullam-gravida-sem-non-est-rhoncus-a-placerat-nibh-cursus-4'),
(292, 127, '_edit_last', '1'),
(295, 127, '_edit_lock', '1506536303:1'),
(296, 109, '_wp_trash_meta_status', 'publish'),
(297, 109, '_wp_trash_meta_time', '1506536421'),
(298, 109, '_wp_desired_post_slug', 'how-midcentury-modern-became-the-pumpkin-spice-letter-of-interior-design-modern-became-2'),
(301, 108, '_wp_trash_meta_status', 'publish'),
(302, 108, '_wp_trash_meta_time', '1506536440'),
(303, 108, '_wp_desired_post_slug', 'nullam-gravida-sem-non-est-rhoncus-a-placerat-nibh-cursus-3'),
(304, 126, '_edit_last', '1'),
(307, 126, '_edit_lock', '1506536319:1'),
(310, 125, '_edit_last', '1'),
(311, 125, '_edit_lock', '1506536359:1'),
(314, 107, '_wp_trash_meta_status', 'publish'),
(315, 107, '_wp_trash_meta_time', '1506536477'),
(316, 107, '_wp_desired_post_slug', 'nullam-gravida-sem-non-est-rhoncus-a-placerat-nibh-cursus-2'),
(319, 124, '_edit_last', '1'),
(322, 124, '_edit_lock', '1506536395:1'),
(323, 106, '_wp_trash_meta_status', 'publish'),
(324, 106, '_wp_trash_meta_time', '1506536507'),
(325, 106, '_wp_desired_post_slug', 'how-midcentury-modern-became-the-pumpkin-spice-letter-of-interior-design-modern-became'),
(328, 105, '_wp_trash_meta_status', 'publish'),
(329, 105, '_wp_trash_meta_time', '1506536532'),
(330, 105, '_wp_desired_post_slug', 'nullam-gravida-sem-non-est-rhoncus-a-placerat-nibh-cursus'),
(331, 123, '_edit_last', '1'),
(332, 123, '_edit_lock', '1506536438:1'),
(333, 123, '_thumbnail_id', '117'),
(338, 135, '_edit_last', '1'),
(339, 135, '_edit_lock', '1506536891:1'),
(340, 135, '_wp_page_template', 'templates/template-canvas.php');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(255) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2017-09-12 11:46:55', '2017-09-12 11:46:55', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'trash', 'open', 'open', '', 'hello-world__trashed', '', '', '2017-09-27 18:18:03', '2017-09-27 18:18:03', '', 0, 'http://localhost/vizologi/?p=1', 0, 'post', '', 1),
(2, 1, '2017-09-12 11:46:55', '2017-09-12 11:46:55', 'This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href=\"http://localhost/vizologi/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'trash', 'closed', 'open', '', 'sample-page__trashed', '', '', '2017-09-12 11:57:33', '2017-09-12 11:57:33', '', 0, 'http://localhost/vizologi/?page_id=2', 0, 'page', '', 0),
(4, 1, '2017-09-12 11:57:33', '2017-09-12 11:57:33', 'This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href=\"http://localhost/vizologi/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2017-09-12 11:57:33', '2017-09-12 11:57:33', '', 2, 'http://localhost/vizologi/2017/09/12/2-revision-v1/', 0, 'revision', '', 0),
(5, 1, '2017-09-12 13:34:22', '2017-09-12 13:34:22', '<section class=\"trending\">\r\n	<div class=\"container\">\r\n		<div class=\"row\">\r\n			<div class=\"col-sm-6\">\r\n				<h2>Trending Now <a href=\"#\" class=\"view-all visible-xs\">Canvas archive</a></h2>\r\n				<p>This week most visited Business Model Canvas</p>\r\n			</div>\r\n			<div class=\"col-sm-6 view-all\">\r\n				<a href=\"#\" class=\"text-right hidden-xs\">View all canvas</a>\r\n			</div>\r\n		</div>\r\n\r\n		<div class=\"row\">\r\n			\r\n		</div>\r\n	</div>\r\n</section>\r\n\r\n<section class=\"new\">\r\n	<div class=\"container\">\r\n		<div class=\"row\">\r\n			<div class=\"col-sm-6\">\r\n				<h2>New <a href=\"#\" class=\"view-all visible-xs\">Canvas archive</a></h2>\r\n				<p>Recently added or updated Business Model Canvas</p>\r\n			</div>\r\n			<div class=\"col-sm-6 view-all hidden-xs\">\r\n				<a href=\"#\" class=\"text-right\">View all canvas</a>\r\n			</div>\r\n		</div>\r\n\r\n		<div class=\"row\">\r\n		</div>\r\n	</div>\r\n</section>', 'Home', '', 'publish', 'closed', 'closed', '', 'home', '', '', '2017-09-27 18:14:41', '2017-09-27 18:14:41', '', 0, 'http://localhost/vizologi/?page_id=5', 0, 'page', '', 0),
(6, 1, '2017-09-12 13:34:22', '2017-09-12 13:34:22', '', 'Home', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2017-09-12 13:34:22', '2017-09-12 13:34:22', '', 5, 'http://localhost/vizologi/2017/09/12/5-revision-v1/', 0, 'revision', '', 0),
(7, 1, '2017-09-13 08:04:26', '2017-09-13 08:04:26', '', 'Blog', '', 'publish', 'closed', 'closed', '', 'blog', '', '', '2017-09-22 17:44:32', '2017-09-22 17:44:32', '', 0, 'http://localhost/vizologi/?page_id=7', 0, 'page', '', 0),
(8, 1, '2017-09-13 08:04:31', '2017-09-13 08:04:31', '<section class=\"about\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>About Vizologi...</h4>\r\n<h1>Vizologi is a \"techgeek\" <br class=\"hidden-xs\" />business company.</h1>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5\">\r\n\r\nWe create global positive impact, helping individuals, companies and organizations through vision, strategy and creativity.\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</section><section class=\"about-bottom\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>We believe...</h4>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\"><img class=\"alignnone size-full wp-image-77\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-2.png\" width=\"170\" alt=\"\" /></div>\r\n<div class=\"col-sm-6\">\r\n<h3>Every human is creative</h3>\r\nVizology builds human-centered platforms to <br class=\"hidden-xs\" />unlock creativity, amplifying your intuition <br class=\"hidden-xs\" />through knowledge and experience.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\"><img class=\"alignnone size-medium wp-image-78\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-3-300x231.png\" width=\"230\" /></div>\r\n<div class=\"col-sm-6\">\r\n<h3>Everything is changing</h3>\r\nVizology realizes the speed of our modern liquid <br class=\"hidden-xs\" />times, understanding that in the present we build the <br class=\"hidden-xs\" />business of the future.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\"><img class=\"alignnone size-full wp-image-79\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-4.png\" width=\"170\" alt=\"\" /></div>\r\n<div class=\"col-sm-6\">\r\n<h3>Technology is the key</h3>\r\nVizology embraces the technology <br class=\"hidden-xs\" />transformation force to empower people, <br class=\"hidden-xs\" />achieving new challenges.\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</section>', 'About', '', 'publish', 'closed', 'closed', '', 'about', '', '', '2017-09-20 19:49:19', '2017-09-20 19:49:19', '', 0, 'http://localhost/vizologi/?page_id=8', 0, 'page', '', 0),
(9, 1, '2017-09-13 08:04:37', '2017-09-13 08:04:37', '<section class=\"technology\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>How we work</h4>\r\n<h1>Vizology goes <br class=\"hidden-xs\" />one step forward</h1>\r\n<img class=\"alignnone wp-image-93 size-full\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-5.jpg\" alt=\"\" width=\"176\" height=\"175\" />\r\nCreating an innovation method based on business patterns recognition. We investigated in depth the triggers that lead your mind into creative thinking; when you recognize a pattern, you learn it, predict it, recognize it and implement it.\r\n\r\nIn the same way that a musician, painter or chess player combines patterns to create a new masterpiece, you can do it to invent a new business model too.\r\n<h4 class=\"grey\">Are you ready?</h4>\r\n</div>\r\n</div>\r\n</div>\r\n</section><section class=\"technology-bottom\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>On the road...</h4>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5 col-sm-offset-6\">\r\n<h3>Becoming</h3>\r\nThis is the early stage of the travel, in fact we\'re just at the beginning of this new exploration of ways to analyse more companies and business trends, which will lead to another big data level.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5 col-sm-offset-0\">\r\n<h3>Automating</h3>\r\nThe data itself will be processed, enhancing our predictions and recommendations by using machine learning towards a delightful, unique business digital experience.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5 col-sm-offset-6\">\r\n<h3>Cognifying</h3>\r\nIf you can imagine it, you can achieve it. We believe and we work hard to create your business cognitive assistant that, based on AI, will be able to create a personalized business model for you.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-12 last-p\">Vizo, as you know it today, is just the beginning.<br class=\"hidden-xs\" />Come with us and enjoy the journey ; )</div>\r\n</div>\r\n</div>\r\n</section>', 'Technology', '', 'publish', 'closed', 'closed', '', 'technology', '', '', '2017-09-21 21:13:37', '2017-09-21 21:13:37', '', 0, 'http://localhost/vizologi/?page_id=9', 0, 'page', '', 0),
(10, 1, '2017-09-13 08:04:26', '2017-09-13 08:04:26', '', 'Blog', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2017-09-13 08:04:26', '2017-09-13 08:04:26', '', 7, 'http://localhost/vizologi/2017/09/13/7-revision-v1/', 0, 'revision', '', 0),
(11, 1, '2017-09-13 08:04:31', '2017-09-13 08:04:31', '', 'About', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2017-09-13 08:04:31', '2017-09-13 08:04:31', '', 8, 'http://localhost/vizologi/2017/09/13/8-revision-v1/', 0, 'revision', '', 0),
(12, 1, '2017-09-13 08:04:37', '2017-09-13 08:04:37', '', 'Technology', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2017-09-13 08:04:37', '2017-09-13 08:04:37', '', 9, 'http://localhost/vizologi/2017/09/13/9-revision-v1/', 0, 'revision', '', 0),
(13, 1, '2017-09-13 08:05:00', '2017-09-13 08:05:00', ' ', '', '', 'publish', 'closed', 'closed', '', '13', '', '', '2017-09-13 08:05:04', '2017-09-13 08:05:04', '', 0, 'http://localhost/vizologi/?p=13', 3, 'nav_menu_item', '', 0),
(14, 1, '2017-09-13 08:05:00', '2017-09-13 08:05:00', ' ', '', '', 'publish', 'closed', 'closed', '', '14', '', '', '2017-09-13 08:05:04', '2017-09-13 08:05:04', '', 0, 'http://localhost/vizologi/?p=14', 2, 'nav_menu_item', '', 0),
(15, 1, '2017-09-13 08:05:00', '2017-09-13 08:05:00', ' ', '', '', 'publish', 'closed', 'closed', '', '15', '', '', '2017-09-13 08:05:04', '2017-09-13 08:05:04', '', 0, 'http://localhost/vizologi/?p=15', 1, 'nav_menu_item', '', 0),
(17, 1, '2017-09-15 10:15:42', '2017-09-15 10:15:42', 'Next Generation, the Labour Party’s network for entrepreneurs, supports and showcases the best of British innovati on, new business ideas and inspirational business leaders.\r\n\r\nQuisque dui nunc, consectetur finibus nunc vel, sagittis condimentum lacus. Nunc aliquam hendrerit quam in rutrum. Vestibulum vestibulum lorem id porttitor aliquet. Aenean in placerat est, blandit venenatis ipsum. Sed ultricies sapien vel lacus mollis, ac sollicitudin ligula tincidunt. Cras sollicitudin, odio sed tempor imperdiet, magna leo imperdiet lacus, sed mattis enim lacus eu sem. In lacinia sed risus ac commodo. Sed in odio aliquam, rutrum metus non, molestie tortor.\r\n\r\nThese Terms provide that all disputes between you and Issuu will be resolved by BINDING ARBITRATION. YOU AGREE TO GIVE UP YOUR RIGHT TO GO TO COURT to assert or defend your rights under this contract (except for matters that may be taken to small claims court). Your rights will be determined by a NEUTRAL ARBITRATOR and NOT a judge or jury and your claims cannot be brought as a class action. Please review the \"Arbitration Agreement\" section below for the details regarding your agreement to arbitrate any disputes with Issuu.\r\n\r\nYOU ACKNOWLEDGE THAT YOU (OR, IF THE USER IS BELOW THE AGE OF MAJORITY, YOU, AS LEGAL GUARDIAN OF THE USER) HAVE READ, UNDERSTOOD, AND AGREE TO BE BOUND BY THESE TERMS, INCLUDING ANY FUTURE MODIFICATIONS. IF AT ANY TIME YOU DO NOT AGREE TO THESE TERMS, PLEASE IMMEDIATELY TERMINATE YOUR USE OF THE ISSUU SERVICE. IF YOU ARE USING OR OPENING AN ACCOUNT WITH ISSUU ON BEHALF OF A COMPANY, ENTITY, OR ORGANIZATION (COLLECTIVELY, A \"SUBSCRIBING ORGANIZATION\") THEN YOU REPRESENT AND WARRANT THAT YOU ARE AN AUTHORIZED REPRESENTATIVE OF THAT SUBSCRIBING ORGANIZATION WITH THE AUTHORITY TO BIND SUCH ORGANIZATION TO THESE TERMS AND AGREE TO THESE TERMS ON BEHALF OF SUCH SUBSCRIBING ORGANIZATION.', 'Terms of service', '', 'publish', 'closed', 'closed', '', 'terms-of-use', '', '', '2017-09-17 19:12:09', '2017-09-17 19:12:09', '', 0, 'http://localhost/vizologi/?page_id=17', 0, 'page', '', 0),
(18, 1, '2017-09-15 10:15:51', '2017-09-15 10:15:51', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\nWhy do we use it?\r\n\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\nWhy do we use it?\r\n\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n', 'Privacy policy', '', 'publish', 'closed', 'closed', '', 'privacy-policy', '', '', '2017-09-17 19:50:40', '2017-09-17 19:50:40', '', 0, 'http://localhost/vizologi/?page_id=18', 0, 'page', '', 0),
(19, 1, '2017-09-15 10:16:17', '2017-09-15 10:16:17', '', 'Contact', '', 'publish', 'closed', 'closed', '', 'contact', '', '', '2017-09-15 10:16:17', '2017-09-15 10:16:17', '', 0, 'http://localhost/vizologi/?page_id=19', 0, 'page', '', 0),
(20, 1, '2017-09-15 10:16:26', '2017-09-15 10:16:26', '', 'Canvas Archive', '', 'publish', 'closed', 'closed', '', 'canvas-archive', '', '', '2017-09-15 10:16:26', '2017-09-15 10:16:26', '', 0, 'http://localhost/vizologi/?page_id=20', 0, 'page', '', 0),
(21, 1, '2017-09-15 10:16:36', '2017-09-15 10:16:36', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\nWhy do we use it?\r\n\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\nWhy do we use it?\r\n\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n', 'FAQ', '', 'publish', 'closed', 'closed', '', 'faq', '', '', '2017-09-17 19:50:33', '2017-09-17 19:50:33', '', 0, 'http://localhost/vizologi/?page_id=21', 0, 'page', '', 0),
(27, 1, '2017-09-15 10:15:42', '2017-09-15 10:15:42', '', 'Terms of use', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2017-09-15 10:15:42', '2017-09-15 10:15:42', '', 17, 'http://localhost/vizologi/2017/09/15/17-revision-v1/', 0, 'revision', '', 0),
(28, 1, '2017-09-15 10:15:51', '2017-09-15 10:15:51', '', 'Privacy policy', '', 'inherit', 'closed', 'closed', '', '18-revision-v1', '', '', '2017-09-15 10:15:51', '2017-09-15 10:15:51', '', 18, 'http://localhost/vizologi/2017/09/15/18-revision-v1/', 0, 'revision', '', 0),
(29, 1, '2017-09-15 10:16:17', '2017-09-15 10:16:17', '', 'Contact', '', 'inherit', 'closed', 'closed', '', '19-revision-v1', '', '', '2017-09-15 10:16:17', '2017-09-15 10:16:17', '', 19, 'http://localhost/vizologi/2017/09/15/19-revision-v1/', 0, 'revision', '', 0),
(30, 1, '2017-09-15 10:16:26', '2017-09-15 10:16:26', '', 'Canvas Archive', '', 'inherit', 'closed', 'closed', '', '20-revision-v1', '', '', '2017-09-15 10:16:26', '2017-09-15 10:16:26', '', 20, 'http://localhost/vizologi/2017/09/15/20-revision-v1/', 0, 'revision', '', 0),
(31, 1, '2017-09-15 10:16:36', '2017-09-15 10:16:36', '', 'FAQ', '', 'inherit', 'closed', 'closed', '', '21-revision-v1', '', '', '2017-09-15 10:16:36', '2017-09-15 10:16:36', '', 21, 'http://localhost/vizologi/2017/09/15/21-revision-v1/', 0, 'revision', '', 0),
(32, 1, '2017-09-15 10:18:35', '2017-09-15 10:18:35', ' ', '', '', 'publish', 'closed', 'closed', '', '32', '', '', '2017-09-15 10:18:35', '2017-09-15 10:18:35', '', 0, 'http://localhost/vizologi/?p=32', 3, 'nav_menu_item', '', 0),
(33, 1, '2017-09-15 10:18:34', '2017-09-15 10:18:34', ' ', '', '', 'publish', 'closed', 'closed', '', '33', '', '', '2017-09-15 10:18:34', '2017-09-15 10:18:34', '', 0, 'http://localhost/vizologi/?p=33', 1, 'nav_menu_item', '', 0),
(34, 1, '2017-09-15 10:18:35', '2017-09-15 10:18:35', ' ', '', '', 'publish', 'closed', 'closed', '', '34', '', '', '2017-09-15 10:18:35', '2017-09-15 10:18:35', '', 0, 'http://localhost/vizologi/?p=34', 2, 'nav_menu_item', '', 0),
(35, 1, '2017-09-15 10:18:35', '2017-09-15 10:18:35', ' ', '', '', 'publish', 'closed', 'closed', '', '35', '', '', '2017-09-15 10:18:35', '2017-09-15 10:18:35', '', 0, 'http://localhost/vizologi/?p=35', 4, 'nav_menu_item', '', 0),
(36, 1, '2017-09-15 10:18:36', '2017-09-15 10:18:36', ' ', '', '', 'publish', 'closed', 'closed', '', '36', '', '', '2017-09-15 10:18:36', '2017-09-15 10:18:36', '', 0, 'http://localhost/vizologi/?p=36', 5, 'nav_menu_item', '', 0),
(37, 1, '2017-09-15 10:39:57', '2017-09-15 10:39:57', ' ', '', '', 'publish', 'closed', 'closed', '', '37', '', '', '2017-09-15 10:40:03', '2017-09-15 10:40:03', '', 0, 'http://localhost/vizologi/?p=37', 7, 'nav_menu_item', '', 0),
(38, 1, '2017-09-15 10:39:56', '2017-09-15 10:39:56', ' ', '', '', 'publish', 'closed', 'closed', '', '38', '', '', '2017-09-15 10:40:03', '2017-09-15 10:40:03', '', 0, 'http://localhost/vizologi/?p=38', 5, 'nav_menu_item', '', 0),
(39, 1, '2017-09-15 10:39:56', '2017-09-15 10:39:56', ' ', '', '', 'publish', 'closed', 'closed', '', '39', '', '', '2017-09-15 10:40:03', '2017-09-15 10:40:03', '', 0, 'http://localhost/vizologi/?p=39', 6, 'nav_menu_item', '', 0),
(40, 1, '2017-09-15 10:39:55', '2017-09-15 10:39:55', ' ', '', '', 'publish', 'closed', 'closed', '', '40', '', '', '2017-09-15 10:40:03', '2017-09-15 10:40:03', '', 0, 'http://localhost/vizologi/?p=40', 3, 'nav_menu_item', '', 0),
(41, 1, '2017-09-15 10:39:55', '2017-09-15 10:39:55', ' ', '', '', 'publish', 'closed', 'closed', '', '41', '', '', '2017-09-15 10:40:02', '2017-09-15 10:40:02', '', 0, 'http://localhost/vizologi/?p=41', 2, 'nav_menu_item', '', 0),
(42, 1, '2017-09-15 10:39:56', '2017-09-15 10:39:56', ' ', '', '', 'publish', 'closed', 'closed', '', '42', '', '', '2017-09-15 10:40:03', '2017-09-15 10:40:03', '', 0, 'http://localhost/vizologi/?p=42', 4, 'nav_menu_item', '', 0),
(43, 1, '2017-09-15 10:39:55', '2017-09-15 10:39:55', ' ', '', '', 'publish', 'closed', 'closed', '', '43', '', '', '2017-09-15 10:40:02', '2017-09-15 10:40:02', '', 0, 'http://localhost/vizologi/?p=43', 1, 'nav_menu_item', '', 0),
(44, 1, '2017-09-15 10:42:20', '2017-09-15 10:42:20', ' ', '', '', 'publish', 'closed', 'closed', '', '44', '', '', '2017-09-15 10:42:21', '2017-09-15 10:42:21', '', 0, 'http://localhost/vizologi/?p=44', 1, 'nav_menu_item', '', 0),
(45, 1, '2017-09-15 10:42:21', '2017-09-15 10:42:21', ' ', '', '', 'publish', 'closed', 'closed', '', '45', '', '', '2017-09-15 10:42:21', '2017-09-15 10:42:21', '', 0, 'http://localhost/vizologi/?p=45', 2, 'nav_menu_item', '', 0),
(46, 1, '2017-09-15 10:42:21', '2017-09-15 10:42:21', '', 'contact@vizologi.com', '', 'publish', 'closed', 'closed', '', 'contactvizologi-com', '', '', '2017-09-15 10:42:21', '2017-09-15 10:42:21', '', 0, 'http://localhost/vizologi/?p=46', 3, 'nav_menu_item', '', 0),
(51, 1, '2017-09-16 08:35:21', '2017-09-16 08:35:21', '<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'AirBnb business model', '', 'publish', 'closed', 'closed', '', 'airbnb-business-model', '', '', '2017-09-16 10:20:21', '2017-09-16 10:20:21', '', 0, 'http://localhost/vizologi/?post_type=canvas&#038;p=51', 0, 'canvas', '', 0),
(52, 1, '2017-09-16 08:36:02', '2017-09-16 08:36:02', '<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Uber business model', '', 'publish', 'closed', 'closed', '', 'uber-business-model', '', '', '2017-09-16 09:17:48', '2017-09-16 09:17:48', '', 0, 'http://localhost/vizologi/?post_type=canvas&#038;p=52', 0, 'canvas', '', 0),
(53, 1, '2017-09-16 08:36:05', '2017-09-16 08:36:05', '<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Dropbox business model', '', 'publish', 'closed', 'closed', '', 'dropbox-business-model', '', '', '2017-09-16 08:53:45', '2017-09-16 08:53:45', '', 0, 'http://localhost/vizologi/?post_type=canvas&#038;p=53', 0, 'canvas', '', 0),
(54, 1, '2017-09-16 08:36:07', '2017-09-16 08:36:07', '<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Uber business model', '', 'publish', 'closed', 'closed', '', 'uber-business-model-2', '', '', '2017-09-16 09:17:35', '2017-09-16 09:17:35', '', 0, 'http://localhost/vizologi/?post_type=canvas&#038;p=54', 0, 'canvas', '', 0),
(55, 1, '2017-09-16 08:27:15', '2017-09-16 08:27:15', '', '001-viz-home_03', '', 'inherit', 'open', 'closed', '', '001-viz-home_03', '', '', '2017-09-16 08:27:15', '2017-09-16 08:27:15', '', 54, 'http://localhost/vizologi/wp-content/uploads/2017/09/001-viz-home_03.jpg', 0, 'attachment', 'image/jpeg', 0),
(56, 1, '2017-09-16 08:27:17', '2017-09-16 08:27:17', '', '001-viz-home_03-05', '', 'inherit', 'open', 'closed', '', '001-viz-home_03-05', '', '', '2017-09-16 08:27:17', '2017-09-16 08:27:17', '', 54, 'http://localhost/vizologi/wp-content/uploads/2017/09/001-viz-home_03-05.jpg', 0, 'attachment', 'image/jpeg', 0),
(57, 1, '2017-09-16 08:27:18', '2017-09-16 08:27:18', '', '001-viz-home_03-07', '', 'inherit', 'open', 'closed', '', '001-viz-home_03-07', '', '', '2017-09-16 08:27:18', '2017-09-16 08:27:18', '', 54, 'http://localhost/vizologi/wp-content/uploads/2017/09/001-viz-home_03-07.jpg', 0, 'attachment', 'image/jpeg', 0),
(58, 1, '2017-09-16 08:27:19', '2017-09-16 08:27:19', '', '001-viz-home_03-12', '', 'inherit', 'open', 'closed', '', '001-viz-home_03-12', '', '', '2017-09-16 08:27:19', '2017-09-16 08:27:19', '', 54, 'http://localhost/vizologi/wp-content/uploads/2017/09/001-viz-home_03-12.jpg', 0, 'attachment', 'image/jpeg', 0),
(59, 1, '2017-09-16 08:35:21', '2017-09-16 08:35:21', '<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'AirBnb business model', '', 'inherit', 'closed', 'closed', '', '51-revision-v1', '', '', '2017-09-16 08:35:21', '2017-09-16 08:35:21', '', 51, 'http://localhost/vizologi/2017/09/16/51-revision-v1/', 0, 'revision', '', 0),
(60, 1, '2017-09-16 08:36:02', '2017-09-16 08:36:02', '<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Uber business model', '', 'inherit', 'closed', 'closed', '', '52-revision-v1', '', '', '2017-09-16 08:36:02', '2017-09-16 08:36:02', '', 52, 'http://localhost/vizologi/2017/09/16/52-revision-v1/', 0, 'revision', '', 0),
(61, 1, '2017-09-16 08:36:05', '2017-09-16 08:36:05', '<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Dropbox business model', '', 'inherit', 'closed', 'closed', '', '53-revision-v1', '', '', '2017-09-16 08:36:05', '2017-09-16 08:36:05', '', 53, 'http://localhost/vizologi/2017/09/16/53-revision-v1/', 0, 'revision', '', 0),
(62, 1, '2017-09-16 08:36:07', '2017-09-16 08:36:07', '<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Uber business model', '', 'inherit', 'closed', 'closed', '', '54-revision-v1', '', '', '2017-09-16 08:36:07', '2017-09-16 08:36:07', '', 54, 'http://localhost/vizologi/2017/09/16/54-revision-v1/', 0, 'revision', '', 0),
(63, 1, '2017-09-16 14:13:32', '2017-09-16 14:13:32', '', 'qwfqwasf', '', 'trash', 'closed', 'closed', '', 'qwfqwasf__trashed', '', '', '2017-09-16 14:55:18', '2017-09-16 14:55:18', '', 0, 'http://localhost/vizologi/?post_type=canvas&#038;p=63', 0, 'canvas', '', 0),
(64, 1, '2017-09-16 14:13:36', '2017-09-16 14:13:36', '', 'af', '', 'trash', 'closed', 'closed', '', 'af__trashed', '', '', '2017-09-16 14:55:19', '2017-09-16 14:55:19', '', 0, 'http://localhost/vizologi/?post_type=canvas&#038;p=64', 0, 'canvas', '', 0),
(65, 1, '2017-09-16 14:13:41', '2017-09-16 14:13:41', '', 'ehdfb', '', 'trash', 'closed', 'closed', '', 'ehdfb__trashed', '', '', '2017-09-16 14:55:22', '2017-09-16 14:55:22', '', 0, 'http://localhost/vizologi/?post_type=canvas&#038;p=65', 0, 'canvas', '', 0),
(66, 1, '2017-09-16 14:13:32', '2017-09-16 14:13:32', '', 'qwfqwasf', '', 'inherit', 'closed', 'closed', '', '63-revision-v1', '', '', '2017-09-16 14:13:32', '2017-09-16 14:13:32', '', 63, 'http://localhost/vizologi/63-revision-v1/', 0, 'revision', '', 0),
(67, 1, '2017-09-16 14:13:36', '2017-09-16 14:13:36', '', 'af', '', 'inherit', 'closed', 'closed', '', '64-revision-v1', '', '', '2017-09-16 14:13:36', '2017-09-16 14:13:36', '', 64, 'http://localhost/vizologi/64-revision-v1/', 0, 'revision', '', 0),
(68, 1, '2017-09-16 14:13:41', '2017-09-16 14:13:41', '', 'ehdfb', '', 'inherit', 'closed', 'closed', '', '65-revision-v1', '', '', '2017-09-16 14:13:41', '2017-09-16 14:13:41', '', 65, 'http://localhost/vizologi/65-revision-v1/', 0, 'revision', '', 0),
(69, 1, '2017-09-17 19:12:09', '2017-09-17 19:12:09', 'Next Generation, the Labour Party’s network for entrepreneurs, supports and showcases the best of British innovati on, new business ideas and inspirational business leaders.\r\n\r\nQuisque dui nunc, consectetur finibus nunc vel, sagittis condimentum lacus. Nunc aliquam hendrerit quam in rutrum. Vestibulum vestibulum lorem id porttitor aliquet. Aenean in placerat est, blandit venenatis ipsum. Sed ultricies sapien vel lacus mollis, ac sollicitudin ligula tincidunt. Cras sollicitudin, odio sed tempor imperdiet, magna leo imperdiet lacus, sed mattis enim lacus eu sem. In lacinia sed risus ac commodo. Sed in odio aliquam, rutrum metus non, molestie tortor.\r\n\r\nThese Terms provide that all disputes between you and Issuu will be resolved by BINDING ARBITRATION. YOU AGREE TO GIVE UP YOUR RIGHT TO GO TO COURT to assert or defend your rights under this contract (except for matters that may be taken to small claims court). Your rights will be determined by a NEUTRAL ARBITRATOR and NOT a judge or jury and your claims cannot be brought as a class action. Please review the \"Arbitration Agreement\" section below for the details regarding your agreement to arbitrate any disputes with Issuu.\r\n\r\nYOU ACKNOWLEDGE THAT YOU (OR, IF THE USER IS BELOW THE AGE OF MAJORITY, YOU, AS LEGAL GUARDIAN OF THE USER) HAVE READ, UNDERSTOOD, AND AGREE TO BE BOUND BY THESE TERMS, INCLUDING ANY FUTURE MODIFICATIONS. IF AT ANY TIME YOU DO NOT AGREE TO THESE TERMS, PLEASE IMMEDIATELY TERMINATE YOUR USE OF THE ISSUU SERVICE. IF YOU ARE USING OR OPENING AN ACCOUNT WITH ISSUU ON BEHALF OF A COMPANY, ENTITY, OR ORGANIZATION (COLLECTIVELY, A \"SUBSCRIBING ORGANIZATION\") THEN YOU REPRESENT AND WARRANT THAT YOU ARE AN AUTHORIZED REPRESENTATIVE OF THAT SUBSCRIBING ORGANIZATION WITH THE AUTHORITY TO BIND SUCH ORGANIZATION TO THESE TERMS AND AGREE TO THESE TERMS ON BEHALF OF SUCH SUBSCRIBING ORGANIZATION.', 'Terms of service', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2017-09-17 19:12:09', '2017-09-17 19:12:09', '', 17, 'http://localhost/vizologi/17-revision-v1/', 0, 'revision', '', 0),
(70, 1, '2017-09-17 19:18:32', '2017-09-17 19:18:32', '', 'Copyright faq', '', 'publish', 'closed', 'closed', '', 'copyright-faq', '', '', '2017-09-17 19:24:10', '2017-09-17 19:24:10', '', 0, 'http://localhost/vizologi/?p=70', 3, 'nav_menu_item', '', 0),
(71, 1, '2017-09-17 19:18:31', '2017-09-17 19:18:31', ' ', '', '', 'publish', 'closed', 'closed', '', '71', '', '', '2017-09-17 19:24:09', '2017-09-17 19:24:09', '', 0, 'http://localhost/vizologi/?p=71', 2, 'nav_menu_item', '', 0),
(72, 1, '2017-09-17 19:18:30', '2017-09-17 19:18:30', ' ', '', '', 'publish', 'closed', 'closed', '', '72', '', '', '2017-09-17 19:24:09', '2017-09-17 19:24:09', '', 0, 'http://localhost/vizologi/?p=72', 1, 'nav_menu_item', '', 0),
(73, 1, '2017-09-17 19:49:25', '2017-09-17 19:49:25', 'Next Generation, the Labour Party’s network for entrepreneurs, supports and showcases the best of British innovati on, new business ideas and inspirational business leaders.\n\nQuisque dui nunc, consectetur finibus nunc vel, sagittis condimentum lacus. Nunc aliquam hendrerit quam in rutrum. Vestibulum vestibulum lorem id porttitor aliquet. Aenean in placerat est, blandit venenatis ipsum. Sed ultricies sapien vel lacus mollis, ac sollicitudin ligula tincidunt. Cras sollicitudin, odio sed tempor imperdiet, magna leo imperdiet lacus, sed mattis enim lacus eu sem. In lacinia sed risus ac commodo. Sed in odio aliquam, rutrum metus non, molestie tortor.\n\nThese Terms provide that all disputes between you and Issuu will be resolved by BINDING ARBITRATION. YOU AGREE TO GIVE UP YOUR RIGHT TO GO TO COURT to assert or defend your rights under this contract (except for matters that may be taken to small claims court). Your rights will be determined by a NEUTRAL ARBITRATOR and NOT a judge or jury and your claims cannot be brought as a class action. Please review the \"Arbitration Agreement\" section below for the details regarding your agreement to arbitrate any disputes with Issuu.\n\nYOU ACKNOWLEDGE THAT YOU (OR, IF THE USER IS BELOW THE AGE OF MAJORITY, YOU, AS LEGAL GUARDIAN OF THE USER) HAVE READ, UNDERSTOOD, AND AGREE TO BE BOUND BY THESE TERMS, INCLUDING ANY FUTURE MODIFICATIONS. IF AT ANY TIME YOU DO NOT AGREE TO THESE TERMS, PLEASE IMMEDIATELY TERMINATE YOUR USE OF THE ISSUU SERVICE. IF YOU ARE USING OR OPENING AN ACCOUNT WITH ISSUU ON BEHALF OF A COMPANY, ENTITY, OR ORGANIZATION (COLLECTIVELY, A \"SUBSCRIBING ORGANIZATION\") THEN YOU REPRESENT AND WARRANT THAT YOU ARE AN AUTHORIZED REPRESENTATIVE OF THAT SUBSCRIBING ORGANIZATION WITH THE AUTHORITY TO BIND SUCH ORGANIZATION TO THESE TERMS AND AGREE TO THESE TERMS ON BEHALF OF SUCH SUBSCRIBING ORGANIZATION.', 'Terms of service', '', 'inherit', 'closed', 'closed', '', '17-autosave-v1', '', '', '2017-09-17 19:49:25', '2017-09-17 19:49:25', '', 17, 'http://localhost/vizologi/17-autosave-v1/', 0, 'revision', '', 0),
(74, 1, '2017-09-17 19:50:33', '2017-09-17 19:50:33', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\nWhy do we use it?\r\n\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\nWhy do we use it?\r\n\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n', 'FAQ', '', 'inherit', 'closed', 'closed', '', '21-revision-v1', '', '', '2017-09-17 19:50:33', '2017-09-17 19:50:33', '', 21, 'http://localhost/vizologi/21-revision-v1/', 0, 'revision', '', 0),
(75, 1, '2017-09-17 19:50:40', '2017-09-17 19:50:40', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\nWhy do we use it?\r\n\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\nWhy do we use it?\r\n\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n', 'Privacy policy', '', 'inherit', 'closed', 'closed', '', '18-revision-v1', '', '', '2017-09-17 19:50:40', '2017-09-17 19:50:40', '', 18, 'http://localhost/vizologi/18-revision-v1/', 0, 'revision', '', 0),
(76, 1, '2017-09-20 19:42:09', '2017-09-20 19:42:09', '<section class=\"about\">\n<div class=\"container\">\n<div class=\"row\">\n<div class=\"col-sm-12\">\n<h4>About Vizologi...</h4>\n<h1>Vizologi is a \"techgeek\" <br class=\"hidden-xs\" />business company.</h1>\n</div>\n</div>\n<div class=\"row\">\n<div class=\"col-sm-5\">\n\nWe create global positive impact, helping individuals, companies and organizations through vision, strategy and creativity.\n\n</div>\n</div>\n</div>\n</section><section class=\"about-bottom\">\n<div class=\"container\">\n<div class=\"row\">\n<div class=\"col-sm-12\">\n<h4>We believe...</h4>\n</div>\n</div>\n<div class=\"row\">\n<div class=\"col-sm-6\"><img class=\"alignnone size-full wp-image-77\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-2.png\" alt=\"\" /></div>\n<div class=\"col-sm-6\">\n<h3>Every human is creative</h3>\nVizology builds human-centered platforms to <br class=\"hidden-xs\" />unlock creativity, amplifying your intuition <br class=\"hidden-xs\" />through knowledge and experience.\n\n</div>\n</div>\n<div class=\"row\">\n<div class=\"col-sm-6\"><img class=\"alignnone size-medium wp-image-78\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-3-300x231.png\" /></div>\n<div class=\"col-sm-6\">\n<h3>Everything is changing</h3>\nVizology realizes the speed of our modern liquid <br class=\"hidden-xs\" />times, understanding that in the present we build the <br class=\"hidden-xs\" />business of the future.\n\n</div>\n</div>\n<div class=\"row\">\n<div class=\"col-sm-6\"><img class=\"alignnone size-full wp-image-79\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-4.png\" alt=\"\" /></div>\n<div class=\"col-sm-6\">\n<h3>Every human is creative</h3>\nVizology builds human-centered platforms to unlock creativity, amplifying your intuition through knowledge and experience.\n\n</div>\n</div>\n</div>\n</section>', 'About', '', 'inherit', 'closed', 'closed', '', '8-autosave-v1', '', '', '2017-09-20 19:42:09', '2017-09-20 19:42:09', '', 8, 'http://localhost/vizologi/8-autosave-v1/', 0, 'revision', '', 0),
(77, 1, '2017-09-18 18:13:31', '2017-09-18 18:13:31', '', 'about-2', '', 'inherit', 'open', 'closed', '', 'about-2', '', '', '2017-09-18 18:13:31', '2017-09-18 18:13:31', '', 8, 'http://localhost/vizologi/wp-content/uploads/2017/09/about-2.png', 0, 'attachment', 'image/png', 0),
(78, 1, '2017-09-18 18:13:32', '2017-09-18 18:13:32', '', 'about-3', '', 'inherit', 'open', 'closed', '', 'about-3', '', '', '2017-09-18 18:13:32', '2017-09-18 18:13:32', '', 8, 'http://localhost/vizologi/wp-content/uploads/2017/09/about-3.png', 0, 'attachment', 'image/png', 0),
(79, 1, '2017-09-18 18:13:33', '2017-09-18 18:13:33', '', 'about-4', '', 'inherit', 'open', 'closed', '', 'about-4', '', '', '2017-09-18 18:13:33', '2017-09-18 18:13:33', '', 8, 'http://localhost/vizologi/wp-content/uploads/2017/09/about-4.png', 0, 'attachment', 'image/png', 0),
(80, 1, '2017-09-18 18:19:06', '2017-09-18 18:19:06', '<section class=\"about\">\r\n	<div class=\"container\">\r\n		<div class=\"row\">\r\n			<div class=\"col-sm-12\">\r\n				<h4>About Vizologi...</h4>\r\n				<h1>Vizologi is a \"techgeek\" business company.</h1>\r\n			</div>\r\n		</div>\r\n\r\n		<div class=\"row\">\r\n			<div class=\"col-sm-5\">\r\n				<p>We create global positive impact, helping individuals, companies and organizations through vision, strategy and creativity. </p>\r\n			</div>\r\n			<div class=\"col-sm-3 col-sm-offset-2\">\r\n				<p>From 1 to ∞ for existing business lines.</p>\r\n			</div>\r\n			<div class=\"col-sm-6 col-sm-offset-6 m-t-60\">\r\n				<p>From 0 to 1 for new disruptive business.</p>\r\n			</div> \r\n		</div>\r\n	</div>\r\n</section>\r\n\r\n<section class=\"about-bottom\">\r\n	<div class=\"container\">\r\n		<div class=\"row\">\r\n			<div class=\"col-sm-12\">\r\n				<h4>We believe...</h4>\r\n			</div>\r\n		</div>\r\n\r\n		<div class=\"row\">\r\n			<div class=\"col-sm-5\">\r\n				<img src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-2.png\" alt=\"\" class=\"alignnone size-full wp-image-77\" />\r\n			</div>\r\n			<div class=\"col-sm-7\">\r\n				<h3>Every human is creative</h3>\r\n				<p>Vizology builds human-centered platforms to unlock creativity, amplifying your intuition through knowledge and experience. </p>\r\n			</div> \r\n		</div>\r\n\r\n		<div class=\"row\">\r\n			<div class=\"col-sm-5\">\r\n				<img src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-3-300x231.png\" class=\"alignnone size-medium wp-image-78\" />\r\n			</div>\r\n			<div class=\"col-sm-7\">\r\n				<h3>Every human is creative</h3>\r\n				<p>Vizology builds human-centered platforms to unlock creativity, amplifying your intuition through knowledge and experience. </p>\r\n			</div> \r\n		</div>\r\n\r\n		<div class=\"row\">\r\n			<div class=\"col-sm-5\">\r\n				<img src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-4.png\" alt=\"\" class=\"alignnone size-full wp-image-79\" />\r\n			</div>\r\n			<div class=\"col-sm-7\">\r\n				<h3>Every human is creative</h3>\r\n				<p>Vizology builds human-centered platforms to unlock creativity, amplifying your intuition through knowledge and experience. </p>\r\n			</div> \r\n		</div>\r\n	</div>\r\n</section>', 'About', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2017-09-18 18:19:06', '2017-09-18 18:19:06', '', 8, 'http://localhost/vizologi/8-revision-v1/', 0, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(81, 1, '2017-09-18 18:48:45', '2017-09-18 18:48:45', '<section class=\"about\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>About Vizologi...</h4>\r\n<h1>Vizologi is a \"techgeek\" business company.</h1>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5\">\r\n\r\nWe create global positive impact, helping individuals, companies and organizations through vision, strategy and creativity.\r\n\r\n</div>\r\n<div class=\"col-sm-3 col-sm-offset-2\">\r\n\r\nFrom 1 to ∞ for existing business lines.\r\n\r\n</div>\r\n<div class=\"col-sm-6 col-sm-offset-6 m-t-60\">\r\n\r\nFrom 0 to 1 for new disruptive business.\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</section><section class=\"about-bottom\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>We believe...</h4>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5\"><img class=\"alignnone size-full wp-image-77\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-2.png\" alt=\"\" /></div>\r\n<div class=\"col-sm-7\">\r\n<h3>Every human is creative</h3>\r\nVizology builds human-centered platforms to unlock creativity, amplifying your intuition through knowledge and experience.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5\"><img class=\"alignnone size-medium wp-image-78\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-3-300x231.png\" /></div>\r\n<div class=\"col-sm-7\">\r\n<h3>Every human is creative</h3>\r\nVizology builds human-centered platforms to unlock creativity, amplifying your intuition through knowledge and experience.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5\"><img class=\"alignnone size-full wp-image-79\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-4.png\" alt=\"\" /></div>\r\n<div class=\"col-sm-7\">\r\n<h3>Every human is creative</h3>\r\nVizology builds human-centered platforms to unlock creativity, amplifying your intuition through knowledge and experience.\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</section>', 'About', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2017-09-18 18:48:45', '2017-09-18 18:48:45', '', 8, 'http://localhost/vizologi/8-revision-v1/', 0, 'revision', '', 0),
(82, 1, '2017-09-18 18:51:44', '2017-09-18 18:51:44', '<section class=\"about\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>About Vizologi...</h4>\r\n<h1>Vizologi is a \"techgeek\" <br class=\"hidden-xs\" />business company.</h1>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5\">\r\n\r\nWe create global positive impact, helping individuals, companies and organizations through vision, strategy and creativity.\r\n\r\n</div>\r\n<div class=\"col-sm-3 col-sm-offset-2\">\r\n\r\nFrom 1 to ∞ for existing business lines.\r\n\r\n</div>\r\n<div class=\"col-sm-6 col-sm-offset-6 m-t-60\">\r\n\r\nFrom 0 to 1 for new disruptive business.\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</section><section class=\"about-bottom\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>We believe...</h4>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5\"><img class=\"alignnone size-full wp-image-77\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-2.png\" alt=\"\" /></div>\r\n<div class=\"col-sm-7\">\r\n<h3>Every human is creative</h3>\r\nVizology builds human-centered platforms to unlock creativity, amplifying your intuition through knowledge and experience.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5\"><img class=\"alignnone size-medium wp-image-78\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-3-300x231.png\" /></div>\r\n<div class=\"col-sm-7\">\r\n<h3>Every human is creative</h3>\r\nVizology builds human-centered platforms to unlock creativity, amplifying your intuition through knowledge and experience.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5\"><img class=\"alignnone size-full wp-image-79\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-4.png\" alt=\"\" /></div>\r\n<div class=\"col-sm-7\">\r\n<h3>Every human is creative</h3>\r\nVizology builds human-centered platforms to unlock creativity, amplifying your intuition through knowledge and experience.\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</section>', 'About', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2017-09-18 18:51:44', '2017-09-18 18:51:44', '', 8, 'http://localhost/vizologi/8-revision-v1/', 0, 'revision', '', 0),
(84, 1, '2017-09-19 18:08:59', '2017-09-19 18:08:59', '<section class=\"about\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>About Vizologi...</h4>\r\n<h1>Vizologi is a \"techgeek\" <br class=\"hidden-xs\" />business company.</h1>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5\">\r\n\r\nWe create global positive impact, helping individuals, companies and organizations through vision, strategy and creativity.\r\n\r\n</div>\r\n<div class=\"col-sm-3 col-sm-offset-2 p1\">\r\n\r\nFrom 1 to ∞ for existing business lines.\r\n\r\n</div>\r\n<div class=\"col-sm-6 col-sm-offset-6 m-t-60 p2\">\r\n\r\nFrom 0 to 1 for new disruptive business.\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</section><section class=\"about-bottom\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>We believe...</h4>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5\"><img class=\"alignnone size-full wp-image-77\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-2.png\" alt=\"\" /></div>\r\n<div class=\"col-sm-7\">\r\n<h3>Every human is creative</h3>\r\nVizology builds human-centered platforms to unlock creativity, amplifying your intuition through knowledge and experience.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5\"><img class=\"alignnone size-medium wp-image-78\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-3-300x231.png\" /></div>\r\n<div class=\"col-sm-7\">\r\n<h3>Every human is creative</h3>\r\nVizology builds human-centered platforms to unlock creativity, amplifying your intuition through knowledge and experience.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5\"><img class=\"alignnone size-full wp-image-79\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-4.png\" alt=\"\" /></div>\r\n<div class=\"col-sm-7\">\r\n<h3>Every human is creative</h3>\r\nVizology builds human-centered platforms to unlock creativity, amplifying your intuition through knowledge and experience.\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</section>', 'About', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2017-09-19 18:08:59', '2017-09-19 18:08:59', '', 8, 'http://localhost/vizologi/8-revision-v1/', 0, 'revision', '', 0),
(85, 1, '2017-09-19 19:23:03', '2017-09-19 19:23:03', '<section class=\"about\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>About Vizologi...</h4>\r\n<h1>Vizologi is a \"techgeek\" <br class=\"hidden-xs\" />business company.</h1>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5\">\r\n\r\nWe create global positive impact, helping individuals, companies and organizations through vision, strategy and creativity.\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</section><section class=\"about-bottom\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>We believe...</h4>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5\"><img class=\"alignnone size-full wp-image-77\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-2.png\" alt=\"\" /></div>\r\n<div class=\"col-sm-7\">\r\n<h3>Every human is creative</h3>\r\nVizology builds human-centered platforms to unlock creativity, amplifying your intuition through knowledge and experience.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5\"><img class=\"alignnone size-medium wp-image-78\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-3-300x231.png\" /></div>\r\n<div class=\"col-sm-7\">\r\n<h3>Every human is creative</h3>\r\nVizology builds human-centered platforms to unlock creativity, amplifying your intuition through knowledge and experience.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5\"><img class=\"alignnone size-full wp-image-79\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-4.png\" alt=\"\" /></div>\r\n<div class=\"col-sm-7\">\r\n<h3>Every human is creative</h3>\r\nVizology builds human-centered platforms to unlock creativity, amplifying your intuition through knowledge and experience.\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</section>', 'About', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2017-09-19 19:23:03', '2017-09-19 19:23:03', '', 8, 'http://localhost/vizologi/8-revision-v1/', 0, 'revision', '', 0),
(86, 1, '2017-09-20 19:29:06', '2017-09-20 19:29:06', '<section class=\"about\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>About Vizologi...</h4>\r\n<h1>Vizologi is a \"techgeek\" <br class=\"hidden-xs\" />business company.</h1>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5\">\r\n\r\nWe create global positive impact, helping individuals, companies and organizations through vision, strategy and creativity.\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</section><section class=\"about-bottom\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>We believe...</h4>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\"><img class=\"alignnone size-full wp-image-77\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-2.png\" alt=\"\" /></div>\r\n<div class=\"col-sm-6\">\r\n<h3>Every human is creative</h3>\r\nVizology builds human-centered platforms to unlock creativity, amplifying your intuition through knowledge and experience.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\"><img class=\"alignnone size-medium wp-image-78\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-3-300x231.png\" /></div>\r\n<div class=\"col-sm-6\">\r\n<h3>Every human is creative</h3>\r\nVizology builds human-centered platforms to unlock creativity, amplifying your intuition through knowledge and experience.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\"><img class=\"alignnone size-full wp-image-79\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-4.png\" alt=\"\" /></div>\r\n<div class=\"col-sm-6\">\r\n<h3>Every human is creative</h3>\r\nVizology builds human-centered platforms to unlock creativity, amplifying your intuition through knowledge and experience.\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</section>', 'About', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2017-09-20 19:29:06', '2017-09-20 19:29:06', '', 8, 'http://localhost/vizologi/8-revision-v1/', 0, 'revision', '', 0),
(87, 1, '2017-09-20 19:42:50', '2017-09-20 19:42:50', '<section class=\"about\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>About Vizologi...</h4>\r\n<h1>Vizologi is a \"techgeek\" <br class=\"hidden-xs\" />business company.</h1>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5\">\r\n\r\nWe create global positive impact, helping individuals, companies and organizations through vision, strategy and creativity.\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</section><section class=\"about-bottom\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>We believe...</h4>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\"><img class=\"alignnone size-full wp-image-77\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-2.png\" alt=\"\" /></div>\r\n<div class=\"col-sm-6\">\r\n<h3>Every human is creative</h3>\r\nVizology builds human-centered platforms to <br class=\"hidden-xs\" />unlock creativity, amplifying your intuition <br class=\"hidden-xs\" />through knowledge and experience.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\"><img class=\"alignnone size-medium wp-image-78\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-3-300x231.png\" /></div>\r\n<div class=\"col-sm-6\">\r\n<h3>Everything is changing</h3>\r\nVizology realizes the speed of our modern liquid <br class=\"hidden-xs\" />times, understanding that in the present we build the <br class=\"hidden-xs\" />business of the future.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\"><img class=\"alignnone size-full wp-image-79\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-4.png\" alt=\"\" /></div>\r\n<div class=\"col-sm-6\">\r\n<h3>Technology is the key</h3>\r\nVizology embraces the technology <br class=\"hidden-xs\" />transformation force to empower people, <br class=\"hidden-xs\" />achieving new challenges.\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</section>', 'About', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2017-09-20 19:42:50', '2017-09-20 19:42:50', '', 8, 'http://localhost/vizologi/8-revision-v1/', 0, 'revision', '', 0),
(88, 1, '2017-09-20 19:49:19', '2017-09-20 19:49:19', '<section class=\"about\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>About Vizologi...</h4>\r\n<h1>Vizologi is a \"techgeek\" <br class=\"hidden-xs\" />business company.</h1>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5\">\r\n\r\nWe create global positive impact, helping individuals, companies and organizations through vision, strategy and creativity.\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</section><section class=\"about-bottom\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>We believe...</h4>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\"><img class=\"alignnone size-full wp-image-77\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-2.png\" width=\"170\" alt=\"\" /></div>\r\n<div class=\"col-sm-6\">\r\n<h3>Every human is creative</h3>\r\nVizology builds human-centered platforms to <br class=\"hidden-xs\" />unlock creativity, amplifying your intuition <br class=\"hidden-xs\" />through knowledge and experience.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\"><img class=\"alignnone size-medium wp-image-78\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-3-300x231.png\" width=\"230\" /></div>\r\n<div class=\"col-sm-6\">\r\n<h3>Everything is changing</h3>\r\nVizology realizes the speed of our modern liquid <br class=\"hidden-xs\" />times, understanding that in the present we build the <br class=\"hidden-xs\" />business of the future.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\"><img class=\"alignnone size-full wp-image-79\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-4.png\" width=\"170\" alt=\"\" /></div>\r\n<div class=\"col-sm-6\">\r\n<h3>Technology is the key</h3>\r\nVizology embraces the technology <br class=\"hidden-xs\" />transformation force to empower people, <br class=\"hidden-xs\" />achieving new challenges.\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</section>', 'About', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2017-09-20 19:49:19', '2017-09-20 19:49:19', '', 8, 'http://localhost/vizologi/8-revision-v1/', 0, 'revision', '', 0),
(89, 1, '2017-09-21 20:12:50', '2017-09-21 20:12:50', '<section class=\"technology\">\n<div class=\"container\">\n<div class=\"row\">\n<div class=\"col-sm-12\">\n<h4>How we work</h4>\n<h1>Vizology goes <br class=\"hidden-xs\" />one step forward</h1>\n<img class=\"alignnone wp-image-93 size-full\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-5.jpg\" alt=\"\" width=\"176\" height=\"175\" />\nCreating an innovation method based on business patterns recognition. We investigated in depth the triggers that lead your mind into creative thinking; when you recognize a pattern, you learn it, predict it, recognize it and implement it.\n\nIn the same way that a musician, painter or chess player combines patterns to create a new masterpiece, you can do it to invent a new business model too.\n<h4 class=\"grey\">Are you ready?</h4>\n</div>\n</div>\n</div>\n</section><section class=\"technology-bottom\">\n<div class=\"container\">\n<div class=\"row\">\n<div class=\"col-sm-12\">\n<h4>On the road...</h4>\n</div>\n</div>\n<div class=\"row\">\n<div class=\"col-sm-6 col-sm-offset-6\">\n<h3>Becoming</h3>\nThis is the early stage of the travel, in fact we\'re just at the beginning of this new exploration of ways to analyse more companies and business trends, which will lead to another big data level.\n</div>\n</div>\n<div class=\"row\">\n<div class=\"col-sm-6\">\n<h3>Automating</h3>\nThe data itself will be processed, enhancing our predictions and recommendations by using machine learning towards a delightful, unique business digital experience.\n</div>\n</div>\n<div class=\"row\">\n<div class=\"col-sm-6\">\n<h3>Technology is the key</h3>\nVizology embraces the technology <br class=\"hidden-xs\" />transformation force to empower people, <br class=\"hidden-xs\" />achieving new challenges.\n\n</div>\n</div>\n</div>\n</section>', 'Technology', '', 'inherit', 'closed', 'closed', '', '9-autosave-v1', '', '', '2017-09-21 20:12:50', '2017-09-21 20:12:50', '', 9, 'http://localhost/vizologi/9-autosave-v1/', 0, 'revision', '', 0),
(90, 1, '2017-09-20 19:57:49', '2017-09-20 19:57:49', '<section class=\"about\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>About Vizologi...</h4>\r\n<h1>Vizologi is a \"techgeek\" <br class=\"hidden-xs\" />business company.</h1>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5\">\r\n\r\nWe create global positive impact, helping individuals, companies and organizations through vision, strategy and creativity.\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</section><section class=\"about-bottom\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>We believe...</h4>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\"><img class=\"alignnone size-full wp-image-77\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-2.png\" alt=\"\" width=\"170\" /></div>\r\n<div class=\"col-sm-6\">\r\n<h3>Every human is creative</h3>\r\nVizology builds human-centered platforms to <br class=\"hidden-xs\" />unlock creativity, amplifying your intuition <br class=\"hidden-xs\" />through knowledge and experience.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\"><img class=\"alignnone size-medium wp-image-78\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-3-300x231.png\" width=\"230\" /></div>\r\n<div class=\"col-sm-6\">\r\n<h3>Everything is changing</h3>\r\nVizology realizes the speed of our modern liquid <br class=\"hidden-xs\" />times, understanding that in the present we build the <br class=\"hidden-xs\" />business of the future.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\"><img class=\"alignnone size-full wp-image-79\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-4.png\" alt=\"\" width=\"170\" /></div>\r\n<div class=\"col-sm-6\">\r\n<h3>Technology is the key</h3>\r\nVizology embraces the technology <br class=\"hidden-xs\" />transformation force to empower people, <br class=\"hidden-xs\" />achieving new challenges.\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</section>', 'Technology', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2017-09-20 19:57:49', '2017-09-20 19:57:49', '', 9, 'http://localhost/vizologi/9-revision-v1/', 0, 'revision', '', 0),
(91, 1, '2017-09-20 19:59:03', '2017-09-20 19:59:03', '<section class=\"technology\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>About Vizologi...</h4>\r\n<h1>Vizologi is a \"techgeek\" <br class=\"hidden-xs\" />business company.</h1>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5\">\r\n\r\nWe create global positive impact, helping individuals, companies and organizations through vision, strategy and creativity.\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</section><section class=\"technology-bottom\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>We believe...</h4>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\"><img class=\"alignnone size-full wp-image-77\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-2.png\" alt=\"\" width=\"170\" /></div>\r\n<div class=\"col-sm-6\">\r\n<h3>Every human is creative</h3>\r\nVizology builds human-centered platforms to <br class=\"hidden-xs\" />unlock creativity, amplifying your intuition <br class=\"hidden-xs\" />through knowledge and experience.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\"><img class=\"alignnone size-medium wp-image-78\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-3-300x231.png\" width=\"230\" /></div>\r\n<div class=\"col-sm-6\">\r\n<h3>Everything is changing</h3>\r\nVizology realizes the speed of our modern liquid <br class=\"hidden-xs\" />times, understanding that in the present we build the <br class=\"hidden-xs\" />business of the future.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\"><img class=\"alignnone size-full wp-image-79\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-4.png\" alt=\"\" width=\"170\" /></div>\r\n<div class=\"col-sm-6\">\r\n<h3>Technology is the key</h3>\r\nVizology embraces the technology <br class=\"hidden-xs\" />transformation force to empower people, <br class=\"hidden-xs\" />achieving new challenges.\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</section>', 'Technology', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2017-09-20 19:59:03', '2017-09-20 19:59:03', '', 9, 'http://localhost/vizologi/9-revision-v1/', 0, 'revision', '', 0),
(92, 1, '2017-09-20 20:58:26', '2017-09-20 20:58:26', '<section class=\"technology\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>How we work</h4>\r\n<h1>Vizology goes <br class=\"hidden-xs\" />one step forward</h1>\r\n<img class=\"alignnone size-medium wp-image-78\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-3-300x231.png\" width=\"230\" />\r\nCreating an innovation method based on business patterns recognition. We investigated in depth the triggers that lead your mind into creative thinking; when you recognize a pattern, you learn it, predict it, recognize it and implement it.\r\n\r\nIn the same way that a musician, painter or chess player combines patterns to create a new masterpiece, you can do it to invent a new business model too.\r\n<h4 class=\"grey\">Are you ready?</h4>\r\n</div>\r\n</div>\r\n</div>\r\n</section><section class=\"technology-bottom\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>Are you ready?</h4>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\"><img class=\"alignnone size-full wp-image-77\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-2.png\" alt=\"\" width=\"170\" /></div>\r\n<div class=\"col-sm-6\">\r\n<h3>Every human is creative</h3>\r\nVizology builds human-centered platforms to <br class=\"hidden-xs\" />unlock creativity, amplifying your intuition <br class=\"hidden-xs\" />through knowledge and experience.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\"></div>\r\n<div class=\"col-sm-6\">\r\n<h3>Everything is changing</h3>\r\nVizology realizes the speed of our modern liquid <br class=\"hidden-xs\" />times, understanding that in the present we build the <br class=\"hidden-xs\" />business of the future.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\"><img class=\"alignnone size-full wp-image-79\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-4.png\" alt=\"\" width=\"170\" /></div>\r\n<div class=\"col-sm-6\">\r\n<h3>Technology is the key</h3>\r\nVizology embraces the technology <br class=\"hidden-xs\" />transformation force to empower people, <br class=\"hidden-xs\" />achieving new challenges.\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</section>', 'Technology', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2017-09-20 20:58:26', '2017-09-20 20:58:26', '', 9, 'http://localhost/vizologi/9-revision-v1/', 0, 'revision', '', 0),
(93, 1, '2017-09-21 18:59:38', '2017-09-21 18:59:38', '', 'about-5', '', 'inherit', 'open', 'closed', '', 'about-5', '', '', '2017-09-21 18:59:38', '2017-09-21 18:59:38', '', 9, 'http://localhost/vizologi/wp-content/uploads/2017/09/about-5.jpg', 0, 'attachment', 'image/jpeg', 0),
(94, 1, '2017-09-21 18:59:50', '2017-09-21 18:59:50', '<section class=\"technology\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>How we work</h4>\r\n<h1>Vizology goes <br class=\"hidden-xs\" />one step forward</h1>\r\n<img class=\"alignnone wp-image-93 size-full\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-5.jpg\" alt=\"\" width=\"176\" height=\"175\" />\r\nCreating an innovation method based on business patterns recognition. We investigated in depth the triggers that lead your mind into creative thinking; when you recognize a pattern, you learn it, predict it, recognize it and implement it.\r\n\r\nIn the same way that a musician, painter or chess player combines patterns to create a new masterpiece, you can do it to invent a new business model too.\r\n<h4 class=\"grey\">Are you ready?</h4>\r\n</div>\r\n</div>\r\n</div>\r\n</section><section class=\"technology-bottom\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>Are you ready?</h4>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\"><img class=\"alignnone size-full wp-image-77\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-2.png\" alt=\"\" width=\"170\" /></div>\r\n<div class=\"col-sm-6\">\r\n<h3>Every human is creative</h3>\r\nVizology builds human-centered platforms to <br class=\"hidden-xs\" />unlock creativity, amplifying your intuition <br class=\"hidden-xs\" />through knowledge and experience.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\"></div>\r\n<div class=\"col-sm-6\">\r\n<h3>Everything is changing</h3>\r\nVizology realizes the speed of our modern liquid <br class=\"hidden-xs\" />times, understanding that in the present we build the <br class=\"hidden-xs\" />business of the future.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\"><img class=\"alignnone size-full wp-image-79\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-4.png\" alt=\"\" width=\"170\" /></div>\r\n<div class=\"col-sm-6\">\r\n<h3>Technology is the key</h3>\r\nVizology embraces the technology <br class=\"hidden-xs\" />transformation force to empower people, <br class=\"hidden-xs\" />achieving new challenges.\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</section>', 'Technology', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2017-09-21 18:59:50', '2017-09-21 18:59:50', '', 9, 'http://localhost/vizologi/9-revision-v1/', 0, 'revision', '', 0),
(95, 1, '2017-09-21 20:14:15', '2017-09-21 20:14:15', '<section class=\"technology\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>How we work</h4>\r\n<h1>Vizology goes <br class=\"hidden-xs\" />one step forward</h1>\r\n<img class=\"alignnone wp-image-93 size-full\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-5.jpg\" alt=\"\" width=\"176\" height=\"175\" />\r\nCreating an innovation method based on business patterns recognition. We investigated in depth the triggers that lead your mind into creative thinking; when you recognize a pattern, you learn it, predict it, recognize it and implement it.\r\n\r\nIn the same way that a musician, painter or chess player combines patterns to create a new masterpiece, you can do it to invent a new business model too.\r\n<h4 class=\"grey\">Are you ready?</h4>\r\n</div>\r\n</div>\r\n</div>\r\n</section><section class=\"technology-bottom\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>On the road...</h4>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6 col-sm-offset-6\">\r\n<h3>Becoming</h3>\r\nThis is the early stage of the travel, in fact we\'re just at the beginning of this new exploration of ways to analyse more companies and business trends, which will lead to another big data level.\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\">\r\n<h3>Automating</h3>\r\nThe data itself will be processed, enhancing our predictions and recommendations by using machine learning towards a delightful, unique business digital experience.\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\">\r\n<h3>Cognifying</h3>\r\nIf you can imagine it, you can achieve it. We believe and we work hard to create your business cognitive assistant that, based on AI, will be able to create a personalized business model for you.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-12 last-p\">\r\nVizo, as you know it today, is just the beginning.<br class=\"hidden-xs\" />\r\nCome with us and enjoy the journey ;)\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</section>', 'Technology', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2017-09-21 20:14:15', '2017-09-21 20:14:15', '', 9, 'http://localhost/vizologi/9-revision-v1/', 0, 'revision', '', 0),
(96, 1, '2017-09-21 20:15:23', '2017-09-21 20:15:23', '<section class=\"technology\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>How we work</h4>\r\n<h1>Vizology goes <br class=\"hidden-xs\" />one step forward</h1>\r\n<img class=\"alignnone wp-image-93 size-full\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-5.jpg\" alt=\"\" width=\"176\" height=\"175\" />\r\nCreating an innovation method based on business patterns recognition. We investigated in depth the triggers that lead your mind into creative thinking; when you recognize a pattern, you learn it, predict it, recognize it and implement it.\r\n\r\nIn the same way that a musician, painter or chess player combines patterns to create a new masterpiece, you can do it to invent a new business model too.\r\n<h4 class=\"grey\">Are you ready?</h4>\r\n</div>\r\n</div>\r\n</div>\r\n</section><section class=\"technology-bottom\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>On the road...</h4>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6 col-sm-offset-6\">\r\n<h3>Becoming</h3>\r\nThis is the early stage of the travel, in fact we\'re just at the beginning of this new exploration of ways to analyse more companies and business trends, which will lead to another big data level.\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\">\r\n<h3>Automating</h3>\r\nThe data itself will be processed, enhancing our predictions and recommendations by using machine learning towards a delightful, unique business digital experience.\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6 col-sm-offset-6\">\r\n<h3>Cognifying</h3>\r\nIf you can imagine it, you can achieve it. We believe and we work hard to create your business cognitive assistant that, based on AI, will be able to create a personalized business model for you.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-12 last-p\">\r\nVizo, as you know it today, is just the beginning.<br class=\"hidden-xs\" />\r\nCome with us and enjoy the journey ;)\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</section>', 'Technology', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2017-09-21 20:15:23', '2017-09-21 20:15:23', '', 9, 'http://localhost/vizologi/9-revision-v1/', 0, 'revision', '', 0),
(97, 1, '2017-09-21 20:15:43', '2017-09-21 20:15:43', '<section class=\"technology\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>How we work</h4>\r\n<h1>Vizology goes <br class=\"hidden-xs\" />one step forward</h1>\r\n<img class=\"alignnone wp-image-93 size-full\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-5.jpg\" alt=\"\" width=\"176\" height=\"175\" />\r\nCreating an innovation method based on business patterns recognition. We investigated in depth the triggers that lead your mind into creative thinking; when you recognize a pattern, you learn it, predict it, recognize it and implement it.\r\n\r\nIn the same way that a musician, painter or chess player combines patterns to create a new masterpiece, you can do it to invent a new business model too.\r\n<h4 class=\"grey\">Are you ready?</h4>\r\n</div>\r\n</div>\r\n</div>\r\n</section><section class=\"technology-bottom\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>On the road...</h4>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6 col-sm-offset-6\">\r\n<h3>Becoming</h3>\r\nThis is the early stage of the travel, in fact we\'re just at the beginning of this new exploration of ways to analyse more companies and business trends, which will lead to another big data level.\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\">\r\n<h3>Automating</h3>\r\nThe data itself will be processed, enhancing our predictions and recommendations by using machine learning towards a delightful, unique business digital experience.\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6 col-sm-offset-6\">\r\n<h3>Cognifying</h3>\r\nIf you can imagine it, you can achieve it. We believe and we work hard to create your business cognitive assistant that, based on AI, will be able to create a personalized business model for you.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-12 last-p\">\r\nVizo, as you know it today, is just the beginning.<br class=\"hidden-xs\" />\r\nCome with us and enjoy the journey ; )\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</section>', 'Technology', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2017-09-21 20:15:43', '2017-09-21 20:15:43', '', 9, 'http://localhost/vizologi/9-revision-v1/', 0, 'revision', '', 0),
(98, 1, '2017-09-21 20:22:42', '2017-09-21 20:22:42', '<section class=\"technology\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>How we work</h4>\r\n<h1>Vizology goes <br class=\"hidden-xs\" />one step forward</h1>\r\n<img class=\"alignnone wp-image-93 size-full\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-5.jpg\" alt=\"\" width=\"176\" height=\"175\" />\r\nCreating an innovation method based on business patterns recognition. We investigated in depth the triggers that lead your mind into creative thinking; when you recognize a pattern, you learn it, predict it, recognize it and implement it.\r\n\r\nIn the same way that a musician, painter or chess player combines patterns to create a new masterpiece, you can do it to invent a new business model too.\r\n<h4 class=\"grey\">Are you ready?</h4>\r\n</div>\r\n</div>\r\n</div>\r\n</section><section class=\"technology-bottom\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>On the road...</h4>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6 col-sm-offset-6\">\r\n<h3>Becoming</h3>\r\nThis is the early stage of the travel, in fact we\'re just at the beginning of this new exploration of ways to analyse more companies and business trends, which will lead to another big data level.\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6 second\">\r\n<h3>Automating</h3>\r\nThe data itself will be processed, enhancing our predictions and recommendations by using machine learning towards a delightful, unique business digital experience.\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6 col-sm-offset-6\">\r\n<h3>Cognifying</h3>\r\nIf you can imagine it, you can achieve it. We believe and we work hard to create your business cognitive assistant that, based on AI, will be able to create a personalized business model for you.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-12 last-p\">\r\nVizo, as you know it today, is just the beginning.<br class=\"hidden-xs\" />\r\nCome with us and enjoy the journey ; )\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</section>', 'Technology', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2017-09-21 20:22:42', '2017-09-21 20:22:42', '', 9, 'http://localhost/vizologi/9-revision-v1/', 0, 'revision', '', 0),
(99, 1, '2017-09-21 20:24:20', '2017-09-21 20:24:20', '<section class=\"technology\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>How we work</h4>\r\n<h1>Vizology goes <br class=\"hidden-xs\" />one step forward</h1>\r\n<img class=\"alignnone wp-image-93 size-full\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-5.jpg\" alt=\"\" width=\"176\" height=\"175\" />\r\nCreating an innovation method based on business patterns recognition. We investigated in depth the triggers that lead your mind into creative thinking; when you recognize a pattern, you learn it, predict it, recognize it and implement it.\r\n\r\nIn the same way that a musician, painter or chess player combines patterns to create a new masterpiece, you can do it to invent a new business model too.\r\n<h4 class=\"grey\">Are you ready?</h4>\r\n</div>\r\n</div>\r\n</div>\r\n</section><section class=\"technology-bottom\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>On the road...</h4>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5 col-sm-offset-6\">\r\n<h3>Becoming</h3>\r\nThis is the early stage of the travel, in fact we\'re just at the beginning of this new exploration of ways to analyse more companies and business trends, which will lead to another big data level.\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5 second\">\r\n<h3>Automating</h3>\r\nThe data itself will be processed, enhancing our predictions and recommendations by using machine learning towards a delightful, unique business digital experience.\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5 col-sm-offset-6\">\r\n<h3>Cognifying</h3>\r\nIf you can imagine it, you can achieve it. We believe and we work hard to create your business cognitive assistant that, based on AI, will be able to create a personalized business model for you.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-12 last-p\">\r\nVizo, as you know it today, is just the beginning.<br class=\"hidden-xs\" />\r\nCome with us and enjoy the journey ; )\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</section>', 'Technology', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2017-09-21 20:24:20', '2017-09-21 20:24:20', '', 9, 'http://localhost/vizologi/9-revision-v1/', 0, 'revision', '', 0),
(100, 1, '2017-09-21 20:33:57', '2017-09-21 20:33:57', '<section class=\"technology\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>How we work</h4>\r\n<h1>Vizology goes <br class=\"hidden-xs\" />one step forward</h1>\r\n<img class=\"alignnone wp-image-93 size-full\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-5.jpg\" alt=\"\" width=\"176\" height=\"175\" />\r\nCreating an innovation method based on business patterns recognition. We investigated in depth the triggers that lead your mind into creative thinking; when you recognize a pattern, you learn it, predict it, recognize it and implement it.\r\n\r\nIn the same way that a musician, painter or chess player combines patterns to create a new masterpiece, you can do it to invent a new business model too.\r\n<h4 class=\"grey\">Are you ready?</h4>\r\n</div>\r\n</div>\r\n</div>\r\n</section><section class=\"technology-bottom\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>On the road...</h4>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5 col-sm-offset-6\">\r\n<h3>Becoming</h3>\r\nThis is the early stage of the travel, in fact we\'re just at the beginning of this new exploration of ways to analyse more companies and business trends, which will lead to another big data level.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5 second\">\r\n<h3>Automating</h3>\r\nThe data itself will be processed, enhancing our predictions and recommendations by using machine learning towards a delightful, unique business digital experience.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5 col-sm-offset-6\">\r\n<h3>Cognifying</h3>\r\nIf you can imagine it, you can achieve it. We believe and we work hard to create your business cognitive assistant that, based on AI, will be able to create a personalized business model for you.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-12 last-p\">Vizo, as you know it today, is just the beginning.<br class=\"hidden-xs\" />Come with us and enjoy the journey ; )</div>\r\n</div>\r\n</div>\r\n</section>', 'Technology', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2017-09-21 20:33:57', '2017-09-21 20:33:57', '', 9, 'http://localhost/vizologi/9-revision-v1/', 0, 'revision', '', 0),
(101, 1, '2017-09-21 20:48:46', '2017-09-21 20:48:46', '<section class=\"technology\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>How we work</h4>\r\n<h1>Vizology goes <br class=\"hidden-xs\" />one step forward</h1>\r\n<img class=\"alignnone wp-image-93 size-full\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-5.jpg\" alt=\"\" width=\"176\" height=\"175\" />\r\nCreating an innovation method based on business patterns recognition. We investigated in depth the triggers that lead your mind into creative thinking; when you recognize a pattern, you learn it, predict it, recognize it and implement it.\r\n\r\nIn the same way that a musician, painter or chess player combines patterns to create a new masterpiece, you can do it to invent a new business model too.\r\n<h4 class=\"grey\">Are you ready?</h4>\r\n</div>\r\n</div>\r\n</div>\r\n</section><section class=\"technology-bottom\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>On the road...</h4>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5 col-sm-offset-6 col-xs-offset-2\">\r\n<h3>Becoming</h3>\r\nThis is the early stage of the travel, in fact we\'re just at the beginning of this new exploration of ways to analyse more companies and business trends, which will lead to another big data level.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5 second col-xs-offset-2\">\r\n<h3>Automating</h3>\r\nThe data itself will be processed, enhancing our predictions and recommendations by using machine learning towards a delightful, unique business digital experience.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5 col-sm-offset-6 col-xs-offset-2\">\r\n<h3>Cognifying</h3>\r\nIf you can imagine it, you can achieve it. We believe and we work hard to create your business cognitive assistant that, based on AI, will be able to create a personalized business model for you.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-12 last-p\">Vizo, as you know it today, is just the beginning.<br class=\"hidden-xs\" />Come with us and enjoy the journey ; )</div>\r\n</div>\r\n</div>\r\n</section>', 'Technology', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2017-09-21 20:48:46', '2017-09-21 20:48:46', '', 9, 'http://localhost/vizologi/9-revision-v1/', 0, 'revision', '', 0),
(102, 1, '2017-09-21 20:49:45', '2017-09-21 20:49:45', '<section class=\"technology\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>How we work</h4>\r\n<h1>Vizology goes <br class=\"hidden-xs\" />one step forward</h1>\r\n<img class=\"alignnone wp-image-93 size-full\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-5.jpg\" alt=\"\" width=\"176\" height=\"175\" />\r\nCreating an innovation method based on business patterns recognition. We investigated in depth the triggers that lead your mind into creative thinking; when you recognize a pattern, you learn it, predict it, recognize it and implement it.\r\n\r\nIn the same way that a musician, painter or chess player combines patterns to create a new masterpiece, you can do it to invent a new business model too.\r\n<h4 class=\"grey\">Are you ready?</h4>\r\n</div>\r\n</div>\r\n</div>\r\n</section><section class=\"technology-bottom\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>On the road...</h4>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5 col-sm-offset-6 col-xs-offset-2\">\r\n<h3>Becoming</h3>\r\nThis is the early stage of the travel, in fact we\'re just at the beginning of this new exploration of ways to analyse more companies and business trends, which will lead to another big data level.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5 col-xs-offset-2\">\r\n<h3>Automating</h3>\r\nThe data itself will be processed, enhancing our predictions and recommendations by using machine learning towards a delightful, unique business digital experience.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5 col-sm-offset-6 col-xs-offset-2\">\r\n<h3>Cognifying</h3>\r\nIf you can imagine it, you can achieve it. We believe and we work hard to create your business cognitive assistant that, based on AI, will be able to create a personalized business model for you.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-12 last-p\">Vizo, as you know it today, is just the beginning.<br class=\"hidden-xs\" />Come with us and enjoy the journey ; )</div>\r\n</div>\r\n</div>\r\n</section>', 'Technology', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2017-09-21 20:49:45', '2017-09-21 20:49:45', '', 9, 'http://localhost/vizologi/9-revision-v1/', 0, 'revision', '', 0),
(103, 1, '2017-09-21 20:51:12', '2017-09-21 20:51:12', '<section class=\"technology\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>How we work</h4>\r\n<h1>Vizology goes <br class=\"hidden-xs\" />one step forward</h1>\r\n<img class=\"alignnone wp-image-93 size-full\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-5.jpg\" alt=\"\" width=\"176\" height=\"175\" />\r\nCreating an innovation method based on business patterns recognition. We investigated in depth the triggers that lead your mind into creative thinking; when you recognize a pattern, you learn it, predict it, recognize it and implement it.\r\n\r\nIn the same way that a musician, painter or chess player combines patterns to create a new masterpiece, you can do it to invent a new business model too.\r\n<h4 class=\"grey\">Are you ready?</h4>\r\n</div>\r\n</div>\r\n</div>\r\n</section><section class=\"technology-bottom\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>On the road...</h4>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5 col-sm-offset-6 col-xs-offset-2\">\r\n<h3>Becoming</h3>\r\nThis is the early stage of the travel, in fact we\'re just at the beginning of this new exploration of ways to analyse more companies and business trends, which will lead to another big data level.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5 col-xs-offset-2 col-sm-offset-0\">\r\n<h3>Automating</h3>\r\nThe data itself will be processed, enhancing our predictions and recommendations by using machine learning towards a delightful, unique business digital experience.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5 col-sm-offset-6 col-xs-offset-2\">\r\n<h3>Cognifying</h3>\r\nIf you can imagine it, you can achieve it. We believe and we work hard to create your business cognitive assistant that, based on AI, will be able to create a personalized business model for you.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-12 last-p\">Vizo, as you know it today, is just the beginning.<br class=\"hidden-xs\" />Come with us and enjoy the journey ; )</div>\r\n</div>\r\n</div>\r\n</section>', 'Technology', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2017-09-21 20:51:12', '2017-09-21 20:51:12', '', 9, 'http://localhost/vizologi/9-revision-v1/', 0, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(104, 1, '2017-09-21 21:13:37', '2017-09-21 21:13:37', '<section class=\"technology\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>How we work</h4>\r\n<h1>Vizology goes <br class=\"hidden-xs\" />one step forward</h1>\r\n<img class=\"alignnone wp-image-93 size-full\" src=\"http://localhost/vizologi/wp-content/uploads/2017/09/about-5.jpg\" alt=\"\" width=\"176\" height=\"175\" />\r\nCreating an innovation method based on business patterns recognition. We investigated in depth the triggers that lead your mind into creative thinking; when you recognize a pattern, you learn it, predict it, recognize it and implement it.\r\n\r\nIn the same way that a musician, painter or chess player combines patterns to create a new masterpiece, you can do it to invent a new business model too.\r\n<h4 class=\"grey\">Are you ready?</h4>\r\n</div>\r\n</div>\r\n</div>\r\n</section><section class=\"technology-bottom\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-12\">\r\n<h4>On the road...</h4>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5 col-sm-offset-6\">\r\n<h3>Becoming</h3>\r\nThis is the early stage of the travel, in fact we\'re just at the beginning of this new exploration of ways to analyse more companies and business trends, which will lead to another big data level.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5 col-sm-offset-0\">\r\n<h3>Automating</h3>\r\nThe data itself will be processed, enhancing our predictions and recommendations by using machine learning towards a delightful, unique business digital experience.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-5 col-sm-offset-6\">\r\n<h3>Cognifying</h3>\r\nIf you can imagine it, you can achieve it. We believe and we work hard to create your business cognitive assistant that, based on AI, will be able to create a personalized business model for you.\r\n\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-12 last-p\">Vizo, as you know it today, is just the beginning.<br class=\"hidden-xs\" />Come with us and enjoy the journey ; )</div>\r\n</div>\r\n</div>\r\n</section>', 'Technology', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2017-09-21 21:13:37', '2017-09-21 21:13:37', '', 9, 'http://localhost/vizologi/9-revision-v1/', 0, 'revision', '', 0),
(105, 1, '2017-09-22 18:33:37', '2017-09-22 18:33:37', '', 'Nullam gravida sem non est rhoncus, a placerat nibh cursus.', '', 'trash', 'closed', 'closed', '', 'nullam-gravida-sem-non-est-rhoncus-a-placerat-nibh-cursus__trashed', '', '', '2017-09-27 18:22:12', '2017-09-27 18:22:12', '', 0, 'http://localhost/vizologi/?post_type=blog&#038;p=105', 0, 'blog', '', 0),
(106, 1, '2017-09-22 18:33:44', '2017-09-22 18:33:44', '', 'HOW MIDCENTURY MODERN BECAME THE PUMPKIN SPICE LETTER OF INTERIOR DESIGN MODERN BECAME.', '', 'trash', 'closed', 'closed', '', 'how-midcentury-modern-became-the-pumpkin-spice-letter-of-interior-design-modern-became__trashed', '', '', '2017-09-27 18:21:47', '2017-09-27 18:21:47', '', 0, 'http://localhost/vizologi/?post_type=blog&#038;p=106', 0, 'blog', '', 0),
(107, 1, '2017-09-22 18:33:56', '2017-09-22 18:33:56', '', 'Nullam gravida sem non est rhoncus, a placerat nibh cursus.', '', 'trash', 'closed', 'closed', '', 'nullam-gravida-sem-non-est-rhoncus-a-placerat-nibh-cursus-2__trashed', '', '', '2017-09-27 18:21:17', '2017-09-27 18:21:17', '', 0, 'http://localhost/vizologi/?post_type=blog&#038;p=107', 0, 'blog', '', 0),
(108, 1, '2017-09-22 18:34:08', '2017-09-22 18:34:08', '', 'Nullam gravida sem non est rhoncus, a placerat nibh cursus.', '', 'trash', 'closed', 'closed', '', 'nullam-gravida-sem-non-est-rhoncus-a-placerat-nibh-cursus-3__trashed', '', '', '2017-09-27 18:20:40', '2017-09-27 18:20:40', '', 0, 'http://localhost/vizologi/?post_type=blog&#038;p=108', 0, 'blog', '', 0),
(109, 1, '2017-09-22 18:34:22', '2017-09-22 18:34:22', '', 'HOW MIDCENTURY MODERN BECAME THE PUMPKIN SPICE LETTER OF INTERIOR DESIGN MODERN BECAME.', '', 'trash', 'closed', 'closed', '', 'how-midcentury-modern-became-the-pumpkin-spice-letter-of-interior-design-modern-became-2__trashed', '', '', '2017-09-27 18:20:21', '2017-09-27 18:20:21', '', 0, 'http://localhost/vizologi/?post_type=blog&#038;p=109', 0, 'blog', '', 0),
(110, 1, '2017-09-22 18:34:34', '2017-09-22 18:34:34', '', 'Nullam gravida sem non est rhoncus, a placerat nibh cursus.', '', 'trash', 'closed', 'closed', '', 'nullam-gravida-sem-non-est-rhoncus-a-placerat-nibh-cursus-4__trashed', '', '', '2017-09-27 18:19:30', '2017-09-27 18:19:30', '', 0, 'http://localhost/vizologi/?post_type=blog&#038;p=110', 0, 'blog', '', 0),
(111, 1, '2017-09-22 18:33:37', '2017-09-22 18:33:37', '', 'Nullam gravida sem non est rhoncus, a placerat nibh cursus.', '', 'inherit', 'closed', 'closed', '', '105-revision-v1', '', '', '2017-09-22 18:33:37', '2017-09-22 18:33:37', '', 105, 'http://localhost/vizologi/105-revision-v1/', 0, 'revision', '', 0),
(112, 1, '2017-09-22 18:33:44', '2017-09-22 18:33:44', '', 'HOW MIDCENTURY MODERN BECAME THE PUMPKIN SPICE LETTER OF INTERIOR DESIGN MODERN BECAME.', '', 'inherit', 'closed', 'closed', '', '106-revision-v1', '', '', '2017-09-22 18:33:44', '2017-09-22 18:33:44', '', 106, 'http://localhost/vizologi/106-revision-v1/', 0, 'revision', '', 0),
(113, 1, '2017-09-22 18:33:56', '2017-09-22 18:33:56', '', 'Nullam gravida sem non est rhoncus, a placerat nibh cursus.', '', 'inherit', 'closed', 'closed', '', '107-revision-v1', '', '', '2017-09-22 18:33:56', '2017-09-22 18:33:56', '', 107, 'http://localhost/vizologi/107-revision-v1/', 0, 'revision', '', 0),
(114, 1, '2017-09-22 18:34:08', '2017-09-22 18:34:08', '', 'Nullam gravida sem non est rhoncus, a placerat nibh cursus.', '', 'inherit', 'closed', 'closed', '', '108-revision-v1', '', '', '2017-09-22 18:34:08', '2017-09-22 18:34:08', '', 108, 'http://localhost/vizologi/108-revision-v1/', 0, 'revision', '', 0),
(115, 1, '2017-09-22 18:34:22', '2017-09-22 18:34:22', '', 'HOW MIDCENTURY MODERN BECAME THE PUMPKIN SPICE LETTER OF INTERIOR DESIGN MODERN BECAME.', '', 'inherit', 'closed', 'closed', '', '109-revision-v1', '', '', '2017-09-22 18:34:22', '2017-09-22 18:34:22', '', 109, 'http://localhost/vizologi/109-revision-v1/', 0, 'revision', '', 0),
(116, 1, '2017-09-22 18:34:34', '2017-09-22 18:34:34', '', 'Nullam gravida sem non est rhoncus, a placerat nibh cursus.', '', 'inherit', 'closed', 'closed', '', '110-revision-v1', '', '', '2017-09-22 18:34:34', '2017-09-22 18:34:34', '', 110, 'http://localhost/vizologi/110-revision-v1/', 0, 'revision', '', 0),
(117, 1, '2017-09-22 18:54:02', '2017-09-22 18:54:02', '', '004-viz-blog_03', '', 'inherit', 'open', 'closed', '', '004-viz-blog_03', '', '', '2017-09-22 18:54:02', '2017-09-22 18:54:02', '', 107, 'http://localhost/vizologi/wp-content/uploads/2017/09/004-viz-blog_03.jpg', 0, 'attachment', 'image/jpeg', 0),
(119, 1, '2017-09-26 15:14:19', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2017-09-26 15:14:19', '0000-00-00 00:00:00', '', 0, 'http://localhost/vizologi/?p=119', 0, 'post', '', 0),
(120, 1, '2017-09-26 18:20:36', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2017-09-26 18:20:36', '0000-00-00 00:00:00', '', 0, 'http://localhost/vizologi/?post_type=blog&p=120', 0, 'blog', '', 0),
(121, 1, '2017-09-27 18:14:41', '2017-09-27 18:14:41', '<section class=\"trending\">\r\n	<div class=\"container\">\r\n		<div class=\"row\">\r\n			<div class=\"col-sm-6\">\r\n				<h2>Trending Now <a href=\"#\" class=\"view-all visible-xs\">Canvas archive</a></h2>\r\n				<p>This week most visited Business Model Canvas</p>\r\n			</div>\r\n			<div class=\"col-sm-6 view-all\">\r\n				<a href=\"#\" class=\"text-right hidden-xs\">View all canvas</a>\r\n			</div>\r\n		</div>\r\n\r\n		<div class=\"row\">\r\n			\r\n		</div>\r\n	</div>\r\n</section>\r\n\r\n<section class=\"new\">\r\n	<div class=\"container\">\r\n		<div class=\"row\">\r\n			<div class=\"col-sm-6\">\r\n				<h2>New <a href=\"#\" class=\"view-all visible-xs\">Canvas archive</a></h2>\r\n				<p>Recently added or updated Business Model Canvas</p>\r\n			</div>\r\n			<div class=\"col-sm-6 view-all hidden-xs\">\r\n				<a href=\"#\" class=\"text-right\">View all canvas</a>\r\n			</div>\r\n		</div>\r\n\r\n		<div class=\"row\">\r\n		</div>\r\n	</div>\r\n</section>', 'Home', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2017-09-27 18:14:41', '2017-09-27 18:14:41', '', 5, 'http://localhost/vizologi/5-revision-v1/', 0, 'revision', '', 0),
(122, 1, '2017-09-27 18:18:03', '2017-09-27 18:18:03', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2017-09-27 18:18:03', '2017-09-27 18:18:03', '', 1, 'http://localhost/vizologi/1-revision-v1/', 0, 'revision', '', 0),
(123, 1, '2017-09-27 18:22:32', '2017-09-27 18:22:32', '', 'Nullam gravida sem non est rhoncus, a placerat nibh cursus.', '', 'publish', 'open', 'open', '', 'nullam-gravida-sem-non-est-rhoncus-a-placerat-nibh-cursus-4', '', '', '2017-09-27 18:22:42', '2017-09-27 18:22:42', '', 0, 'http://localhost/vizologi/?p=123', 0, 'post', '', 0),
(124, 1, '2017-09-27 18:21:40', '2017-09-27 18:21:40', '', 'HOW MIDCENTURY MODERN BECAME THE PUMPKIN SPICE LETTER OF INTERIOR DESIGN MODERN BECAME.', '', 'publish', 'open', 'open', '', 'how-midcentury-modern-became-the-pumpkin-spice-letter-of-interior-design-modern-became-2', '', '', '2017-09-27 18:21:56', '2017-09-27 18:21:56', '', 0, 'http://localhost/vizologi/?p=124', 0, 'post', '', 0),
(125, 1, '2017-09-27 18:21:14', '2017-09-27 18:21:14', '', 'Nullam gravida sem non est rhoncus, a placerat nibh cursus', '', 'publish', 'open', 'open', '', 'nullam-gravida-sem-non-est-rhoncus-a-placerat-nibh-cursus-3', '', '', '2017-09-27 18:21:31', '2017-09-27 18:21:31', '', 0, 'http://localhost/vizologi/?p=125', 0, 'post', '', 0),
(126, 1, '2017-09-27 18:20:46', '2017-09-27 18:20:46', '', 'Nullam gravida sem non est rhoncus, a placerat nibh cursus.', '', 'publish', 'open', 'open', '', 'nullam-gravida-sem-non-est-rhoncus-a-placerat-nibh-cursus-2', '', '', '2017-09-27 18:20:56', '2017-09-27 18:20:56', '', 0, 'http://localhost/vizologi/?p=126', 0, 'post', '', 0),
(127, 1, '2017-09-27 18:20:19', '2017-09-27 18:20:19', '', 'HOW MIDCENTURY MODERN BECAME THE PUMPKIN SPICE LETTER OF INTERIOR DESIGN MODERN BECAME.', '', 'publish', 'open', 'open', '', 'how-midcentury-modern-became-the-pumpkin-spice-letter-of-interior-design-modern-became', '', '', '2017-09-27 18:20:30', '2017-09-27 18:20:30', '', 0, 'http://localhost/vizologi/?p=127', 0, 'post', '', 0),
(128, 1, '2017-09-27 18:19:35', '2017-09-27 18:19:35', '', 'Nullam gravida sem non est rhoncus, a placerat nibh cursus.', '', 'publish', 'open', 'open', '', 'nullam-gravida-sem-non-est-rhoncus-a-placerat-nibh-cursus', '', '', '2017-09-27 18:19:45', '2017-09-27 18:19:45', '', 0, 'http://localhost/vizologi/?p=128', 0, 'post', '', 0),
(129, 1, '2017-09-27 18:19:35', '2017-09-27 18:19:35', '', 'Nullam gravida sem non est rhoncus, a placerat nibh cursus.', '', 'inherit', 'closed', 'closed', '', '128-revision-v1', '', '', '2017-09-27 18:19:35', '2017-09-27 18:19:35', '', 128, 'http://localhost/vizologi/128-revision-v1/', 0, 'revision', '', 0),
(130, 1, '2017-09-27 18:20:19', '2017-09-27 18:20:19', '', 'HOW MIDCENTURY MODERN BECAME THE PUMPKIN SPICE LETTER OF INTERIOR DESIGN MODERN BECAME.', '', 'inherit', 'closed', 'closed', '', '127-revision-v1', '', '', '2017-09-27 18:20:19', '2017-09-27 18:20:19', '', 127, 'http://localhost/vizologi/127-revision-v1/', 0, 'revision', '', 0),
(131, 1, '2017-09-27 18:20:46', '2017-09-27 18:20:46', '', 'Nullam gravida sem non est rhoncus, a placerat nibh cursus.', '', 'inherit', 'closed', 'closed', '', '126-revision-v1', '', '', '2017-09-27 18:20:46', '2017-09-27 18:20:46', '', 126, 'http://localhost/vizologi/126-revision-v1/', 0, 'revision', '', 0),
(132, 1, '2017-09-27 18:21:14', '2017-09-27 18:21:14', '', 'Nullam gravida sem non est rhoncus, a placerat nibh cursus', '', 'inherit', 'closed', 'closed', '', '125-revision-v1', '', '', '2017-09-27 18:21:14', '2017-09-27 18:21:14', '', 125, 'http://localhost/vizologi/125-revision-v1/', 0, 'revision', '', 0),
(133, 1, '2017-09-27 18:21:40', '2017-09-27 18:21:40', '', 'HOW MIDCENTURY MODERN BECAME THE PUMPKIN SPICE LETTER OF INTERIOR DESIGN MODERN BECAME.', '', 'inherit', 'closed', 'closed', '', '124-revision-v1', '', '', '2017-09-27 18:21:40', '2017-09-27 18:21:40', '', 124, 'http://localhost/vizologi/124-revision-v1/', 0, 'revision', '', 0),
(134, 1, '2017-09-27 18:22:32', '2017-09-27 18:22:32', '', 'Nullam gravida sem non est rhoncus, a placerat nibh cursus.', '', 'inherit', 'closed', 'closed', '', '123-revision-v1', '', '', '2017-09-27 18:22:32', '2017-09-27 18:22:32', '', 123, 'http://localhost/vizologi/123-revision-v1/', 0, 'revision', '', 0),
(135, 1, '2017-09-27 18:30:04', '2017-09-27 18:30:04', '', 'Canvas', '', 'publish', 'closed', 'closed', '', 'canvas', '', '', '2017-09-27 18:30:11', '2017-09-27 18:30:11', '', 0, 'http://localhost/vizologi/?page_id=135', 0, 'page', '', 0),
(136, 1, '2017-09-27 18:30:04', '2017-09-27 18:30:04', '', 'Canvas', '', 'inherit', 'closed', 'closed', '', '135-revision-v1', '', '', '2017-09-27 18:30:04', '2017-09-27 18:30:04', '', 135, 'http://localhost/vizologi/135-revision-v1/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext
) ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'Main Menu', 'main-menu', 0),
(3, 'Dropdown Menu', 'dropdown-menu', 0),
(4, 'Footer Menu 1', 'footer-menu-1', 0),
(5, 'Footer Menu 2', 'footer-menu-2', 0),
(6, 'tag1', 'tag1', 0),
(7, 'tag2', 'tag2', 0),
(8, 'tag3', 'tag3', 0),
(9, 'tag4', 'tag4', 0),
(10, 'Trending', 'trending', 0),
(11, 'New', 'new', 0),
(12, 'Side Menu', 'side-menu', 0),
(13, 'Category 1', 'category-1', 0),
(14, 'Category 2', 'category-2', 0),
(15, 'Category 1', 'category-1', 0),
(16, 'Category 2', 'category-2', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(13, 2, 0),
(14, 2, 0),
(15, 2, 0),
(32, 3, 0),
(33, 3, 0),
(34, 3, 0),
(35, 3, 0),
(36, 3, 0),
(37, 4, 0),
(38, 4, 0),
(39, 4, 0),
(40, 4, 0),
(41, 4, 0),
(42, 4, 0),
(43, 4, 0),
(44, 5, 0),
(45, 5, 0),
(46, 5, 0),
(51, 6, 0),
(51, 7, 0),
(51, 8, 0),
(51, 9, 0),
(51, 10, 0),
(52, 6, 0),
(52, 7, 0),
(52, 8, 0),
(52, 9, 0),
(52, 11, 0),
(53, 6, 0),
(53, 7, 0),
(53, 8, 0),
(53, 10, 0),
(53, 11, 0),
(54, 6, 0),
(54, 7, 0),
(54, 9, 0),
(54, 10, 0),
(54, 11, 0),
(63, 10, 0),
(64, 10, 0),
(65, 10, 0),
(70, 12, 0),
(71, 12, 0),
(72, 12, 0),
(105, 13, 0),
(106, 14, 0),
(107, 13, 0),
(108, 13, 0),
(109, 13, 0),
(110, 14, 0),
(123, 16, 0),
(124, 16, 0),
(125, 15, 0),
(126, 15, 0),
(127, 15, 0),
(128, 16, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0),
(2, 2, 'nav_menu', '', 0, 3),
(3, 3, 'nav_menu', '', 0, 5),
(4, 4, 'nav_menu', '', 0, 7),
(5, 5, 'nav_menu', '', 0, 3),
(6, 6, 'tag', '', 0, 4),
(7, 7, 'tag', '', 0, 4),
(8, 8, 'tag', '', 0, 3),
(9, 9, 'tag', '', 0, 3),
(10, 10, 'canvas_category', '', 0, 3),
(11, 11, 'canvas_category', '', 0, 3),
(12, 12, 'nav_menu', '', 0, 3),
(13, 13, 'blog_category', '', 0, 0),
(14, 14, 'blog_category', '', 0, 0),
(15, 15, 'category', '', 0, 3),
(16, 16, 'category', '', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext
) ;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'vizology'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'false'),
(10, 1, 'locale', ''),
(11, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(12, 1, 'wp_user_level', '10'),
(13, 1, 'dismissed_wp_pointers', ''),
(14, 1, 'show_welcome_panel', '0'),
(15, 1, 'session_tokens', 'a:1:{s:64:\"6c0e20ac3cac99a8f3c8ef94e99646deaf10ff96892770581195506ef541205e\";a:4:{s:10:\"expiration\";i:1506611653;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:56.0) Gecko/20100101 Firefox/56.0\";s:5:\"login\";i:1506438853;}}'),
(16, 1, 'wp_dashboard_quick_press_last_post_id', '119'),
(17, 1, 'community-events-location', 'a:1:{s:2:\"ip\";s:2:\"::\";}'),
(18, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(19, 1, 'metaboxhidden_nav-menus', 'a:1:{i:0;s:12:\"add-post_tag\";}'),
(20, 1, 'nav_menu_recently_edited', '2'),
(21, 1, 'wp_user-settings', 'libraryContent=browse&editor=html'),
(22, 1, 'wp_user-settings-time', '1506026922'),
(23, 1, 'closedpostboxes_canvas', 'a:1:{i:0;s:13:\"pageparentdiv\";}'),
(24, 1, 'metaboxhidden_canvas', 'a:1:{i:0;s:7:\"slugdiv\";}'),
(25, 1, 'closedpostboxes_blog', 'a:0:{}'),
(26, 1, 'metaboxhidden_blog', 'a:3:{i:0;s:13:\"pageparentdiv\";i:1;s:11:\"postexcerpt\";i:2;s:7:\"slugdiv\";}'),
(27, 1, 'closedpostboxes_page', 'a:0:{}'),
(28, 1, 'metaboxhidden_page', 'a:5:{i:0;s:10:\"postcustom\";i:1;s:16:\"commentstatusdiv\";i:2;s:11:\"commentsdiv\";i:3;s:7:\"slugdiv\";i:4;s:9:\"authordiv\";}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT ''
) ;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'vizology', '$P$B60ZaCZQeMLjaUaLxDrn7TaJ.O.FWh0', 'vizology', 'hilariogoes47@gmail.com', '', '2017-09-12 11:46:55', '', 0, 'vizology');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wp_alm`
--
ALTER TABLE `wp_alm`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wp_alm`
--
ALTER TABLE `wp_alm`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

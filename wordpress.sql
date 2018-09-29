-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 29, 2018 at 12:29 AM
-- Server version: 5.6.13
-- PHP Version: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wordpress`
--
CREATE DATABASE IF NOT EXISTS `wordpress` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `wordpress`;

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2018-09-19 00:19:19', '2018-09-19 00:19:19', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href="https://gravatar.com">Gravatar</a>.', 0, 'post-trashed', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=214 ;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/black/wordpress', 'yes'),
(2, 'home', 'http://localhost/black/wordpress', 'yes'),
(3, 'blogname', 'Yvee&#039;s Craft and Hobbies', 'yes'),
(4, 'blogdescription', '', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'ralphrevensd@gmail.com', 'yes'),
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
(28, 'permalink_structure', '', 'yes'),
(29, 'rewrite_rules', '', 'yes'),
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
(40, 'template', 'vw-photography', 'yes'),
(41, 'stylesheet', 'vw-photography', 'yes'),
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
(53, 'show_on_front', 'posts', 'yes'),
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
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:0:{}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '0', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '13', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '0', 'yes'),
(93, 'initial_db_version', '38590', 'yes'),
(94, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:61:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(95, 'fresh_site', '0', 'yes'),
(96, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(100, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(101, 'sidebars_widgets', 'a:2:{s:19:"wp_inactive_widgets";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:13:"array_version";i:3;}', 'yes'),
(102, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(103, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(104, 'widget_media_audio', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(105, 'widget_media_image', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(106, 'widget_media_gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(107, 'widget_media_video', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(108, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(109, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(110, 'widget_custom_html', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(111, 'cron', 'a:5:{i:1537924782;a:1:{s:34:"wp_privacy_delete_old_export_files";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1537964382;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1538007725;a:2:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:25:"delete_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1538008101;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(113, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.9.8.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.9.8.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.9.8-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.9.8-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.9.8";s:7:"version";s:5:"4.9.8";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.7";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1537921824;s:15:"version_checked";s:5:"4.9.8";s:12:"translations";a:0:{}}', 'no'),
(114, 'theme_mods_twentyseventeen', 'a:5:{s:18:"custom_css_post_id";i:-1;s:12:"header_image";s:20:"random-default-image";s:11:"colorscheme";s:4:"dark";s:11:"custom_logo";i:10;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1537573427;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(117, '_site_transient_update_plugins', 'O:8:"stdClass":5:{s:12:"last_checked";i:1537919107;s:7:"checked";a:2:{s:19:"akismet/akismet.php";s:5:"4.0.8";s:9:"hello.php";s:3:"1.7";}s:8:"response";a:0:{}s:12:"translations";a:0:{}s:9:"no_update";a:2:{s:19:"akismet/akismet.php";O:8:"stdClass":9:{s:2:"id";s:21:"w.org/plugins/akismet";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"4.0.8";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.4.0.8.zip";s:5:"icons";a:2:{s:2:"2x";s:59:"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272";s:2:"1x";s:59:"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272";}s:7:"banners";a:1:{s:2:"1x";s:61:"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904";}s:11:"banners_rtl";a:0:{}}s:9:"hello.php";O:8:"stdClass":9:{s:2:"id";s:25:"w.org/plugins/hello-dolly";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";s:5:"icons";a:2:{s:2:"2x";s:63:"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907";s:2:"1x";s:63:"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=969907";}s:7:"banners";a:1:{s:2:"1x";s:65:"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342";}s:11:"banners_rtl";a:0:{}}}}', 'no'),
(126, 'can_compress_scripts', '1', 'no'),
(143, 'theme_mods_twentysixteen', 'a:1:{s:18:"custom_css_post_id";i:-1;}', 'yes'),
(145, '_transient_twentysixteen_categories', '1', 'yes'),
(148, 'widget_gist-featured-post', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(149, 'widget_gist-author', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(150, 'widget_gist-social-icons', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(151, 'theme_mods_gist-grid', 'a:1:{s:18:"custom_css_post_id";i:-1;}', 'yes'),
(153, 'theme_mods_kohaku', 'a:1:{s:18:"custom_css_post_id";i:-1;}', 'yes'),
(155, 'theme_mods_business-click', 'a:1:{s:18:"custom_css_post_id";i:-1;}', 'yes'),
(157, 'theme_mods_teruterubozu', 'a:3:{s:18:"custom_css_post_id";i:-1;s:18:"nav_menu_locations";a:0:{}s:16:"sidebars_widgets";a:2:{s:4:"time";i:1537574045;s:4:"data";a:1:{s:19:"wp_inactive_widgets";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes'),
(178, 'current_theme', 'VW Photography', 'yes'),
(179, 'theme_switched', '', 'yes'),
(181, 'widget_vw_photography_social_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(182, 'theme_mods_vw-photography', 'a:18:{s:18:"custom_css_post_id";i:58;s:12:"header_image";s:13:"remove-header";s:16:"background_image";s:66:"http://localhost/black/wordpress/wp-content/uploads/2018/09/bg.jpg";s:21:"background_position_x";s:6:"center";s:21:"background_position_y";s:3:"top";s:17:"background_repeat";s:9:"no-repeat";s:17:"background_preset";s:4:"fill";s:15:"background_size";s:5:"cover";s:21:"background_attachment";s:5:"fixed";s:18:"nav_menu_locations";a:3:{s:12:"primary-left";i:10;s:13:"primary-right";i:9;s:15:"responsive-menu";i:0;}s:28:"vw_photography_theme_options";s:10:"One Column";s:28:"vw_photography_slider_arrows";s:0:"";s:27:"vw_photography_slider_page1";i:40;s:27:"vw_photography_slider_page2";i:40;s:27:"vw_photography_slider_page3";i:40;s:27:"vw_photography_slider_page4";i:40;s:11:"custom_logo";i:50;s:16:"background_color";s:6:"ffffff";}', 'yes'),
(183, 'theme_switch_menu_locations', 'a:0:{}', 'yes'),
(184, 'theme_switched_via_customizer', '', 'yes'),
(185, 'customize_stashed_theme_mods', 'a:0:{}', 'no'),
(186, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1537919107;s:7:"checked";a:9:{s:14:"business-click";s:5:"1.0.2";s:9:"gist-grid";s:5:"1.0.0";s:4:"gist";s:5:"1.0.5";s:6:"kohaku";s:5:"1.0.0";s:12:"teruterubozu";s:5:"0.2.9";s:13:"twentyfifteen";s:3:"2.0";s:15:"twentyseventeen";s:3:"1.7";s:13:"twentysixteen";s:3:"1.5";s:14:"vw-photography";s:3:"0.1";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'no'),
(197, 'nav_menu_options', 'a:1:{s:8:"auto_add";a:0:{}}', 'yes'),
(210, 'category_children', 'a:0:{}', 'yes'),
(212, '_site_transient_timeout_theme_roots', '1537923595', 'no'),
(213, '_site_transient_theme_roots', 'a:9:{s:14:"business-click";s:7:"/themes";s:9:"gist-grid";s:7:"/themes";s:4:"gist";s:7:"/themes";s:6:"kohaku";s:7:"/themes";s:12:"teruterubozu";s:7:"/themes";s:13:"twentyfifteen";s:7:"/themes";s:15:"twentyseventeen";s:7:"/themes";s:13:"twentysixteen";s:7:"/themes";s:14:"vw-photography";s:7:"/themes";}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=167 ;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 5, '_edit_last', '1'),
(4, 5, '_edit_lock', '1537576061:1'),
(7, 7, '_edit_lock', '1537317505:1'),
(8, 7, '_wp_trash_meta_status', 'publish'),
(9, 7, '_wp_trash_meta_time', '1537317532'),
(11, 9, '_wp_attached_file', '2018/09/ych_logo_v2.png'),
(12, 9, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2480;s:6:"height";i:3508;s:4:"file";s:23:"2018/09/ych_logo_v2.png";s:5:"sizes";a:6:{s:9:"thumbnail";a:4:{s:4:"file";s:23:"ych_logo_v2-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:23:"ych_logo_v2-212x300.png";s:5:"width";i:212;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:12:"medium_large";a:4:{s:4:"file";s:24:"ych_logo_v2-768x1086.png";s:5:"width";i:768;s:6:"height";i:1086;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:24:"ych_logo_v2-724x1024.png";s:5:"width";i:724;s:6:"height";i:1024;s:9:"mime-type";s:9:"image/png";}s:30:"twentyseventeen-featured-image";a:4:{s:4:"file";s:25:"ych_logo_v2-2000x1200.png";s:5:"width";i:2000;s:6:"height";i:1200;s:9:"mime-type";s:9:"image/png";}s:32:"twentyseventeen-thumbnail-avatar";a:4:{s:4:"file";s:23:"ych_logo_v2-100x100.png";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(13, 10, '_wp_attached_file', '2018/09/cropped-ych_logo_v2.png'),
(14, 10, '_wp_attachment_context', 'custom-logo'),
(15, 10, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:250;s:6:"height";i:250;s:4:"file";s:31:"2018/09/cropped-ych_logo_v2.png";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:31:"cropped-ych_logo_v2-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:32:"twentyseventeen-thumbnail-avatar";a:4:{s:4:"file";s:31:"cropped-ych_logo_v2-100x100.png";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(17, 11, '_edit_lock', '1537318896:1'),
(18, 12, '_wp_attached_file', '2018/09/cropped-ych_logo_v2-1.png'),
(19, 12, '_wp_attachment_context', 'site-icon'),
(20, 12, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:512;s:6:"height";i:512;s:4:"file";s:33:"2018/09/cropped-ych_logo_v2-1.png";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:33:"cropped-ych_logo_v2-1-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:33:"cropped-ych_logo_v2-1-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:32:"twentyseventeen-thumbnail-avatar";a:4:{s:4:"file";s:33:"cropped-ych_logo_v2-1-100x100.png";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:9:"image/png";}s:13:"site_icon-270";a:4:{s:4:"file";s:33:"cropped-ych_logo_v2-1-270x270.png";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}s:13:"site_icon-192";a:4:{s:4:"file";s:33:"cropped-ych_logo_v2-1-192x192.png";s:5:"width";i:192;s:6:"height";i:192;s:9:"mime-type";s:9:"image/png";}s:13:"site_icon-180";a:4:{s:4:"file";s:33:"cropped-ych_logo_v2-1-180x180.png";s:5:"width";i:180;s:6:"height";i:180;s:9:"mime-type";s:9:"image/png";}s:12:"site_icon-32";a:4:{s:4:"file";s:31:"cropped-ych_logo_v2-1-32x32.png";s:5:"width";i:32;s:6:"height";i:32;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(21, 13, '_wp_attached_file', '2018/09/cropped-ych_logo_v2-2.png'),
(22, 13, '_wp_attachment_context', 'site-icon'),
(23, 13, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:512;s:6:"height";i:512;s:4:"file";s:33:"2018/09/cropped-ych_logo_v2-2.png";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:33:"cropped-ych_logo_v2-2-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:33:"cropped-ych_logo_v2-2-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:32:"twentyseventeen-thumbnail-avatar";a:4:{s:4:"file";s:33:"cropped-ych_logo_v2-2-100x100.png";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:9:"image/png";}s:13:"site_icon-270";a:4:{s:4:"file";s:33:"cropped-ych_logo_v2-2-270x270.png";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}s:13:"site_icon-192";a:4:{s:4:"file";s:33:"cropped-ych_logo_v2-2-192x192.png";s:5:"width";i:192;s:6:"height";i:192;s:9:"mime-type";s:9:"image/png";}s:13:"site_icon-180";a:4:{s:4:"file";s:33:"cropped-ych_logo_v2-2-180x180.png";s:5:"width";i:180;s:6:"height";i:180;s:9:"mime-type";s:9:"image/png";}s:12:"site_icon-32";a:4:{s:4:"file";s:31:"cropped-ych_logo_v2-2-32x32.png";s:5:"width";i:32;s:6:"height";i:32;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(24, 11, '_wp_trash_meta_status', 'publish'),
(25, 11, '_wp_trash_meta_time', '1537318955'),
(26, 1, '_wp_trash_meta_status', 'publish'),
(27, 1, '_wp_trash_meta_time', '1537573352'),
(28, 1, '_wp_desired_post_slug', 'hello-world'),
(29, 1, '_wp_trash_meta_comments_status', 'a:1:{i:1;s:1:"1";}'),
(30, 15, '_wp_attached_file', '2018/09/th0GUYWBBV.jpg'),
(31, 15, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:474;s:6:"height";i:474;s:4:"file";s:22:"2018/09/th0GUYWBBV.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:22:"th0GUYWBBV-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:22:"th0GUYWBBV-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:17:"teruterubozu-wide";a:4:{s:4:"file";s:22:"th0GUYWBBV-474x210.jpg";s:5:"width";i:474;s:6:"height";i:210;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(32, 16, '_wp_attached_file', '2018/09/cropped-th0GUYWBBV.jpg'),
(33, 16, '_wp_attachment_context', 'custom-header'),
(34, 16, '_wp_attachment_metadata', 'a:6:{s:5:"width";i:1600;s:6:"height";i:400;s:4:"file";s:30:"2018/09/cropped-th0GUYWBBV.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:4:{s:4:"file";s:30:"cropped-th0GUYWBBV-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:29:"cropped-th0GUYWBBV-300x75.jpg";s:5:"width";i:300;s:6:"height";i:75;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:30:"cropped-th0GUYWBBV-768x192.jpg";s:5:"width";i:768;s:6:"height";i:192;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:31:"cropped-th0GUYWBBV-1024x256.jpg";s:5:"width";i:1024;s:6:"height";i:256;s:9:"mime-type";s:10:"image/jpeg";}s:29:"vw-photography-homepage-thumb";a:4:{s:4:"file";s:30:"cropped-th0GUYWBBV-240x145.jpg";s:5:"width";i:240;s:6:"height";i:145;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}s:17:"attachment_parent";i:15;}'),
(37, 17, '_edit_lock', '1537574019:1'),
(38, 15, '_wp_attachment_is_custom_background', 'vw-photography'),
(39, 17, '_wp_trash_meta_status', 'publish'),
(40, 17, '_wp_trash_meta_time', '1537574046'),
(41, 18, '_edit_last', '1'),
(42, 18, '_edit_lock', '1537919119:1'),
(43, 20, '_wp_attached_file', '2018/09/th1C6EUEZ8.jpg'),
(44, 20, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:474;s:6:"height";i:296;s:4:"file";s:22:"2018/09/th1C6EUEZ8.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:22:"th1C6EUEZ8-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:22:"th1C6EUEZ8-300x187.jpg";s:5:"width";i:300;s:6:"height";i:187;s:9:"mime-type";s:10:"image/jpeg";}s:29:"vw-photography-homepage-thumb";a:4:{s:4:"file";s:22:"th1C6EUEZ8-240x145.jpg";s:5:"width";i:240;s:6:"height";i:145;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(45, 20, '_wp_attachment_is_custom_background', 'vw-photography'),
(47, 22, '_wp_attached_file', '2018/09/thQTY20AMT.jpg'),
(48, 22, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:300;s:6:"height";i:187;s:4:"file";s:22:"2018/09/thQTY20AMT.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:22:"thQTY20AMT-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:22:"thQTY20AMT-300x187.jpg";s:5:"width";i:300;s:6:"height";i:187;s:9:"mime-type";s:10:"image/jpeg";}s:29:"vw-photography-homepage-thumb";a:4:{s:4:"file";s:22:"thQTY20AMT-240x145.jpg";s:5:"width";i:240;s:6:"height";i:145;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(49, 22, '_wp_attachment_is_custom_background', 'vw-photography'),
(50, 23, '_wp_attached_file', '2018/09/Laeacco-Sunflower-Sunshine-Yellow-Portrait-Scene-Photography-Backgrounds-Custom-Vinyl-Photographic-Backdrops-For-Photo-Studio.jpg_640x640.jpg'),
(51, 23, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:640;s:6:"height";i:436;s:4:"file";s:149:"2018/09/Laeacco-Sunflower-Sunshine-Yellow-Portrait-Scene-Photography-Backgrounds-Custom-Vinyl-Photographic-Backdrops-For-Photo-Studio.jpg_640x640.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:149:"Laeacco-Sunflower-Sunshine-Yellow-Portrait-Scene-Photography-Backgrounds-Custom-Vinyl-Photographic-Backdrops-For-Photo-Studio.jpg_640x640-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:149:"Laeacco-Sunflower-Sunshine-Yellow-Portrait-Scene-Photography-Backgrounds-Custom-Vinyl-Photographic-Backdrops-For-Photo-Studio.jpg_640x640-300x204.jpg";s:5:"width";i:300;s:6:"height";i:204;s:9:"mime-type";s:10:"image/jpeg";}s:29:"vw-photography-homepage-thumb";a:4:{s:4:"file";s:149:"Laeacco-Sunflower-Sunshine-Yellow-Portrait-Scene-Photography-Backgrounds-Custom-Vinyl-Photographic-Backdrops-For-Photo-Studio.jpg_640x640-240x145.jpg";s:5:"width";i:240;s:6:"height";i:145;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(52, 23, '_wp_attachment_is_custom_background', 'vw-photography'),
(53, 24, '_wp_attached_file', '2018/09/thKUOS04IE.jpg'),
(54, 24, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:474;s:6:"height";i:474;s:4:"file";s:22:"2018/09/thKUOS04IE.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:22:"thKUOS04IE-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:22:"thKUOS04IE-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:29:"vw-photography-homepage-thumb";a:4:{s:4:"file";s:22:"thKUOS04IE-240x145.jpg";s:5:"width";i:240;s:6:"height";i:145;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(55, 26, '_wp_attached_file', '2018/09/Licensed-Nerf-N-Strike-ELITE-Retaliator-4-in-1-Blaster-Toy-Gun-Refill-Clip-Darts-nerf.jpg'),
(56, 26, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:97:"2018/09/Licensed-Nerf-N-Strike-ELITE-Retaliator-4-in-1-Blaster-Toy-Gun-Refill-Clip-Darts-nerf.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:97:"Licensed-Nerf-N-Strike-ELITE-Retaliator-4-in-1-Blaster-Toy-Gun-Refill-Clip-Darts-nerf-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:97:"Licensed-Nerf-N-Strike-ELITE-Retaliator-4-in-1-Blaster-Toy-Gun-Refill-Clip-Darts-nerf-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:97:"Licensed-Nerf-N-Strike-ELITE-Retaliator-4-in-1-Blaster-Toy-Gun-Refill-Clip-Darts-nerf-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:29:"vw-photography-homepage-thumb";a:4:{s:4:"file";s:97:"Licensed-Nerf-N-Strike-ELITE-Retaliator-4-in-1-Blaster-Toy-Gun-Refill-Clip-Darts-nerf-240x145.jpg";s:5:"width";i:240;s:6:"height";i:145;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(61, 30, '_wp_attached_file', '2018/09/nerf-elite-alpha-trooper-cs-12-blaster-1024x512.png'),
(62, 30, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1024;s:6:"height";i:512;s:4:"file";s:59:"2018/09/nerf-elite-alpha-trooper-cs-12-blaster-1024x512.png";s:5:"sizes";a:5:{s:9:"thumbnail";a:4:{s:4:"file";s:59:"nerf-elite-alpha-trooper-cs-12-blaster-1024x512-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:59:"nerf-elite-alpha-trooper-cs-12-blaster-1024x512-300x150.png";s:5:"width";i:300;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:12:"medium_large";a:4:{s:4:"file";s:59:"nerf-elite-alpha-trooper-cs-12-blaster-1024x512-768x384.png";s:5:"width";i:768;s:6:"height";i:384;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:60:"nerf-elite-alpha-trooper-cs-12-blaster-1024x512-1024x512.png";s:5:"width";i:1024;s:6:"height";i:512;s:9:"mime-type";s:9:"image/png";}s:29:"vw-photography-homepage-thumb";a:4:{s:4:"file";s:59:"nerf-elite-alpha-trooper-cs-12-blaster-1024x512-240x145.png";s:5:"width";i:240;s:6:"height";i:145;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(63, 31, '_wp_attached_file', '2018/09/Nerf_IL2-1.jpg'),
(64, 31, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2064;s:6:"height";i:1548;s:4:"file";s:22:"2018/09/Nerf_IL2-1.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:4:{s:4:"file";s:22:"Nerf_IL2-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:22:"Nerf_IL2-1-300x225.jpg";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:22:"Nerf_IL2-1-768x576.jpg";s:5:"width";i:768;s:6:"height";i:576;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:23:"Nerf_IL2-1-1024x768.jpg";s:5:"width";i:1024;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:29:"vw-photography-homepage-thumb";a:4:{s:4:"file";s:22:"Nerf_IL2-1-240x145.jpg";s:5:"width";i:240;s:6:"height";i:145;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(65, 33, '_wp_attached_file', '2018/09/nerf_flipfury_zombie_strike_blaster_t.jpg'),
(66, 33, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:600;s:6:"height";i:500;s:4:"file";s:49:"2018/09/nerf_flipfury_zombie_strike_blaster_t.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:49:"nerf_flipfury_zombie_strike_blaster_t-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:49:"nerf_flipfury_zombie_strike_blaster_t-300x250.jpg";s:5:"width";i:300;s:6:"height";i:250;s:9:"mime-type";s:10:"image/jpeg";}s:29:"vw-photography-homepage-thumb";a:4:{s:4:"file";s:49:"nerf_flipfury_zombie_strike_blaster_t-240x145.jpg";s:5:"width";i:240;s:6:"height";i:145;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(67, 34, '_wp_attached_file', '2018/09/thS59FJLT0.jpg'),
(68, 34, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:474;s:6:"height";i:474;s:4:"file";s:22:"2018/09/thS59FJLT0.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:22:"thS59FJLT0-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:22:"thS59FJLT0-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:29:"vw-photography-homepage-thumb";a:4:{s:4:"file";s:22:"thS59FJLT0-240x145.jpg";s:5:"width";i:240;s:6:"height";i:145;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(73, 38, '_customize_restore_dismissed', '1'),
(74, 21, '_customize_restore_dismissed', '1'),
(75, 21, '_customize_restore_dismissed', '1'),
(76, 38, '_edit_lock', '1537577444:1'),
(77, 38, '_wp_trash_meta_status', 'publish'),
(78, 38, '_wp_trash_meta_time', '1537577556'),
(79, 2, '_wp_trash_meta_status', 'publish'),
(80, 2, '_wp_trash_meta_time', '1537577615'),
(81, 2, '_wp_desired_post_slug', 'sample-page'),
(82, 40, '_edit_last', '1'),
(83, 40, '_edit_lock', '1537577843:1'),
(84, 40, '_wp_page_template', 'default'),
(85, 44, '_wp_trash_meta_status', 'publish'),
(86, 44, '_wp_trash_meta_time', '1537577819'),
(93, 46, '_edit_last', '1'),
(94, 46, '_edit_lock', '1537578537:1'),
(95, 48, '_edit_lock', '1537578943:1'),
(96, 49, '_wp_attached_file', '2018/09/cropped-ych_logo_v2-3.png'),
(97, 49, '_wp_attachment_context', 'custom-logo'),
(98, 49, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:240;s:6:"height";i:256;s:4:"file";s:33:"2018/09/cropped-ych_logo_v2-3.png";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:33:"cropped-ych_logo_v2-3-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:29:"vw-photography-homepage-thumb";a:4:{s:4:"file";s:33:"cropped-ych_logo_v2-3-240x145.png";s:5:"width";i:240;s:6:"height";i:145;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(99, 9, '_edit_lock', '1537578937:1'),
(100, 50, '_wp_attached_file', '2018/09/cropped-ych_logo_v2-4.png'),
(101, 50, '_wp_attachment_context', 'custom-logo'),
(102, 50, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:240;s:6:"height";i:240;s:4:"file";s:33:"2018/09/cropped-ych_logo_v2-4.png";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:33:"cropped-ych_logo_v2-4-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:29:"vw-photography-homepage-thumb";a:4:{s:4:"file";s:33:"cropped-ych_logo_v2-4-240x145.png";s:5:"width";i:240;s:6:"height";i:145;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(103, 48, '_wp_trash_meta_status', 'publish'),
(104, 48, '_wp_trash_meta_time', '1537578955'),
(106, 52, '_wp_attached_file', '2018/09/cropped-ych_logo_v2-5.png'),
(107, 52, '_wp_attachment_context', 'custom-logo'),
(108, 52, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:240;s:6:"height";i:240;s:4:"file";s:33:"2018/09/cropped-ych_logo_v2-5.png";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:33:"cropped-ych_logo_v2-5-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:29:"vw-photography-homepage-thumb";a:4:{s:4:"file";s:33:"cropped-ych_logo_v2-5-240x145.png";s:5:"width";i:240;s:6:"height";i:145;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(109, 53, '_edit_last', '1'),
(110, 53, '_edit_lock', '1537919673:1'),
(111, 51, '_customize_restore_dismissed', '1'),
(112, 56, '_edit_lock', '1537921750:1'),
(113, 57, '_wp_attached_file', '2018/09/bg.jpg'),
(114, 57, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:600;s:6:"height";i:400;s:4:"file";s:14:"2018/09/bg.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:14:"bg-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:14:"bg-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:29:"vw-photography-homepage-thumb";a:4:{s:4:"file";s:14:"bg-240x145.jpg";s:5:"width";i:240;s:6:"height";i:145;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(115, 57, '_wp_attachment_is_custom_background', 'vw-photography'),
(116, 60, '_menu_item_type', 'taxonomy'),
(117, 60, '_menu_item_menu_item_parent', '0'),
(118, 60, '_menu_item_object_id', '7'),
(119, 60, '_menu_item_object', 'category'),
(120, 60, '_menu_item_target', ''),
(121, 60, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(122, 60, '_menu_item_xfn', ''),
(123, 60, '_menu_item_url', ''),
(124, 61, '_menu_item_type', 'taxonomy'),
(125, 61, '_menu_item_menu_item_parent', '0'),
(126, 61, '_menu_item_object_id', '6'),
(127, 61, '_menu_item_object', 'category'),
(128, 61, '_menu_item_target', ''),
(129, 61, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(130, 61, '_menu_item_xfn', ''),
(131, 61, '_menu_item_url', ''),
(132, 62, '_menu_item_type', 'taxonomy'),
(133, 62, '_menu_item_menu_item_parent', '0'),
(134, 62, '_menu_item_object_id', '8'),
(135, 62, '_menu_item_object', 'category'),
(136, 62, '_menu_item_target', ''),
(137, 62, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(138, 62, '_menu_item_xfn', ''),
(139, 62, '_menu_item_url', ''),
(140, 63, '_menu_item_type', 'taxonomy'),
(141, 63, '_menu_item_menu_item_parent', '0'),
(142, 63, '_menu_item_object_id', '1'),
(143, 63, '_menu_item_object', 'category'),
(144, 63, '_menu_item_target', ''),
(145, 63, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(146, 63, '_menu_item_xfn', ''),
(147, 63, '_menu_item_url', ''),
(148, 56, '_wp_trash_meta_status', 'publish'),
(149, 56, '_wp_trash_meta_time', '1537921790'),
(150, 64, '_edit_last', '1'),
(151, 64, '_edit_lock', '1537921852:1'),
(152, 66, '_edit_last', '1'),
(153, 66, '_edit_lock', '1537924655:1'),
(154, 68, '_customize_draft_post_name', 'hello'),
(155, 68, '_customize_changeset_uuid', 'e312bbec-3ae4-431e-ae09-7c4a040fdd72'),
(156, 69, '_customize_draft_post_name', 'yo'),
(157, 69, '_customize_changeset_uuid', 'e312bbec-3ae4-431e-ae09-7c4a040fdd72'),
(159, 71, '_wp_attached_file', '2018/09/JRock_5_before.png'),
(160, 71, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:540;s:6:"height";i:960;s:4:"file";s:26:"2018/09/JRock_5_before.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:26:"JRock_5_before-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:26:"JRock_5_before-169x300.png";s:5:"width";i:169;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:29:"vw-photography-homepage-thumb";a:4:{s:4:"file";s:26:"JRock_5_before-240x145.png";s:5:"width";i:240;s:6:"height";i:145;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(161, 72, '_wp_attached_file', '2018/09/Octacon_before.jpg'),
(162, 72, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1040;s:6:"height";i:780;s:4:"file";s:26:"2018/09/Octacon_before.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:4:{s:4:"file";s:26:"Octacon_before-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:26:"Octacon_before-300x225.jpg";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:26:"Octacon_before-768x576.jpg";s:5:"width";i:768;s:6:"height";i:576;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:27:"Octacon_before-1024x768.jpg";s:5:"width";i:1024;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:29:"vw-photography-homepage-thumb";a:4:{s:4:"file";s:26:"Octacon_before-240x145.jpg";s:5:"width";i:240;s:6:"height";i:145;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"2";s:6:"credit";s:0:"";s:6:"camera";s:10:"ASUS_X00ID";s:7:"caption";s:0:"";s:17:"created_timestamp";s:10:"1532683577";s:9:"copyright";s:0:"";s:12:"focal_length";s:4:"3.42";s:3:"iso";s:3:"400";s:13:"shutter_speed";s:17:"0.058823529411765";s:5:"title";s:0:"";s:11:"orientation";s:1:"1";s:8:"keywords";a:0:{}}}'),
(163, 73, '_wp_attached_file', '2018/09/HexCon__18_before.jpg'),
(164, 73, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1040;s:6:"height";i:780;s:4:"file";s:29:"2018/09/HexCon__18_before.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:4:{s:4:"file";s:29:"HexCon__18_before-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:29:"HexCon__18_before-300x225.jpg";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:29:"HexCon__18_before-768x576.jpg";s:5:"width";i:768;s:6:"height";i:576;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:30:"HexCon__18_before-1024x768.jpg";s:5:"width";i:1024;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:29:"vw-photography-homepage-thumb";a:4:{s:4:"file";s:29:"HexCon__18_before-240x145.jpg";s:5:"width";i:240;s:6:"height";i:145;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"2";s:6:"credit";s:0:"";s:6:"camera";s:10:"ASUS_X00ID";s:7:"caption";s:0:"";s:17:"created_timestamp";s:10:"1535798399";s:9:"copyright";s:0:"";s:12:"focal_length";s:4:"3.42";s:3:"iso";s:3:"800";s:13:"shutter_speed";s:17:"0.083333333333333";s:5:"title";s:0:"";s:11:"orientation";s:1:"1";s:8:"keywords";a:0:{}}}'),
(165, 74, '_wp_attached_file', '2018/09/JRock_5_before.jpg'),
(166, 74, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:540;s:6:"height";i:960;s:4:"file";s:26:"2018/09/JRock_5_before.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:26:"JRock_5_before-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:26:"JRock_5_before-169x300.jpg";s:5:"width";i:169;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:29:"vw-photography-homepage-thumb";a:4:{s:4:"file";s:26:"JRock_5_before-240x145.jpg";s:5:"width";i:240;s:6:"height";i:145;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:3:"2.2";s:6:"credit";s:0:"";s:6:"camera";s:5:"5045T";s:7:"caption";s:0:"";s:17:"created_timestamp";s:10:"1510406884";s:9:"copyright";s:0:"";s:12:"focal_length";s:3:"3.5";s:3:"iso";s:3:"146";s:13:"shutter_speed";s:8:"0.099999";s:5:"title";s:0:"";s:11:"orientation";s:1:"1";s:8:"keywords";a:0:{}}}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=80 ;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2018-09-19 00:19:19', '2018-09-19 00:19:19', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'trash', 'open', 'open', '', 'hello-world__trashed', '', '', '2018-09-21 23:42:32', '2018-09-21 23:42:32', '', 0, 'http://localhost/black/wordpress/?p=1', 0, 'post', '', 1),
(2, 1, '2018-09-19 00:19:19', '2018-09-19 00:19:19', 'This is an example page. It''s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I''m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin'' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href="http://localhost/black/wordpress/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'trash', 'closed', 'open', '', 'sample-page__trashed', '', '', '2018-09-22 00:53:35', '2018-09-22 00:53:35', '', 0, 'http://localhost/black/wordpress/?page_id=2', 0, 'page', '', 0),
(3, 1, '2018-09-19 00:19:19', '2018-09-19 00:19:19', '<h2>Who we are</h2><p>Our website address is: http://localhost/black/wordpress.</p><h2>What personal data we collect and why we collect it</h2><h3>Comments</h3><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><h3>Media</h3><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><h3>Contact forms</h3><h3>Cookies</h3><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><p>If you have an account and you log in to this site, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><h3>Embedded content from other websites</h3><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><h3>Analytics</h3><h2>Who we share your data with</h2><h2>How long we retain your data</h2><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><h2>What rights you have over your data</h2><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><h2>Where we send your data</h2><p>Visitor comments may be checked through an automated spam detection service.</p><h2>Your contact information</h2><h2>Additional information</h2><h3>How we protect your data</h3><h3>What data breach procedures we have in place</h3><h3>What third parties we receive data from</h3><h3>What automated decision making and/or profiling we do with user data</h3><h3>Industry regulatory disclosure requirements</h3>', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2018-09-19 00:19:19', '2018-09-19 00:19:19', '', 0, 'http://localhost/black/wordpress/?page_id=3', 0, 'page', '', 0),
(5, 1, '2018-09-19 00:30:09', '2018-09-19 00:30:09', 'Welcome!!!\r\n\r\nThis is where we will be posting all updates about our new crafts and collections.\r\n\r\n&nbsp;', 'Welcome to Yvee''s Craft and Hobbies', '', 'publish', 'open', 'open', '', 'my-first-post', '', '', '2018-09-22 00:25:43', '2018-09-22 00:25:43', '', 0, 'http://localhost/black/wordpress/?p=5', 0, 'post', '', 0),
(6, 1, '2018-09-19 00:30:09', '2018-09-19 00:30:09', 'Let us rock the universe!!!', 'My First Post', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2018-09-19 00:30:09', '2018-09-19 00:30:09', '', 5, 'http://localhost/black/wordpress/?p=6', 0, 'revision', '', 0),
(7, 1, '2018-09-19 00:38:52', '2018-09-19 00:38:52', '{\n    "twentyseventeen::header_image": {\n        "value": "random-default-image",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-19 00:36:25"\n    },\n    "twentyseventeen::header_image_data": {\n        "value": "random-default-image",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-19 00:36:25"\n    },\n    "twentyseventeen::colorscheme": {\n        "value": "dark",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-19 00:36:25"\n    },\n    "blogname": {\n        "value": "Black is not a Color",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-19 00:38:25"\n    },\n    "blogdescription": {\n        "value": "It is a Hue",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-19 00:38:25"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '9914a507-672f-4775-a2fc-fed3d2419944', '', '', '2018-09-19 00:38:52', '2018-09-19 00:38:52', '', 0, 'http://localhost/black/wordpress/?p=7', 0, 'customize_changeset', '', 0),
(9, 1, '2018-09-19 00:55:52', '2018-09-19 00:55:52', '', 'ych_logo_v2', '', 'inherit', 'open', 'closed', '', 'ych_logo_v2', '', '', '2018-09-19 00:55:52', '2018-09-19 00:55:52', '', 0, 'http://localhost/black/wordpress/wp-content/uploads/2018/09/ych_logo_v2.png', 0, 'attachment', 'image/png', 0),
(10, 1, '2018-09-19 00:58:00', '2018-09-19 00:58:00', 'http://localhost/black/wordpress/wp-content/uploads/2018/09/cropped-ych_logo_v2.png', 'cropped-ych_logo_v2.png', '', 'inherit', 'open', 'closed', '', 'cropped-ych_logo_v2-png', '', '', '2018-09-19 00:58:00', '2018-09-19 00:58:00', '', 0, 'http://localhost/black/wordpress/wp-content/uploads/2018/09/cropped-ych_logo_v2.png', 0, 'attachment', 'image/png', 0),
(11, 1, '2018-09-19 01:02:35', '2018-09-19 01:02:35', '{\n    "blogname": {\n        "value": "Yvee''s Craft and Hobbies",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-19 01:01:36"\n    },\n    "twentyseventeen::custom_logo": {\n        "value": 10,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-19 00:59:38"\n    },\n    "blogdescription": {\n        "value": "",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-19 01:01:36"\n    },\n    "site_icon": {\n        "value": 13,\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-19 01:02:35"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '3664fd46-40a4-47d4-8d97-6539d45e5fd7', '', '', '2018-09-19 01:02:35', '2018-09-19 01:02:35', '', 0, 'http://localhost/black/wordpress/?p=11', 0, 'customize_changeset', '', 0),
(12, 1, '2018-09-19 01:01:29', '2018-09-19 01:01:29', 'http://localhost/black/wordpress/wp-content/uploads/2018/09/cropped-ych_logo_v2-1.png', 'cropped-ych_logo_v2-1.png', '', 'inherit', 'open', 'closed', '', 'cropped-ych_logo_v2-1-png', '', '', '2018-09-19 01:01:29', '2018-09-19 01:01:29', '', 0, 'http://localhost/black/wordpress/wp-content/uploads/2018/09/cropped-ych_logo_v2-1.png', 0, 'attachment', 'image/png', 0),
(13, 1, '2018-09-19 01:02:30', '2018-09-19 01:02:30', 'http://localhost/black/wordpress/wp-content/uploads/2018/09/cropped-ych_logo_v2-2.png', 'cropped-ych_logo_v2-2.png', '', 'inherit', 'open', 'closed', '', 'cropped-ych_logo_v2-2-png', '', '', '2018-09-19 01:02:30', '2018-09-19 01:02:30', '', 0, 'http://localhost/black/wordpress/wp-content/uploads/2018/09/cropped-ych_logo_v2-2.png', 0, 'attachment', 'image/png', 0),
(14, 1, '2018-09-21 23:42:32', '2018-09-21 23:42:32', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2018-09-21 23:42:32', '2018-09-21 23:42:32', '', 1, 'http://localhost/black/wordpress/?p=14', 0, 'revision', '', 0),
(15, 1, '2018-09-21 23:48:30', '2018-09-21 23:48:30', '', 'th0GUYWBBV', '', 'inherit', 'open', 'closed', '', 'th0guywbbv', '', '', '2018-09-21 23:48:30', '2018-09-21 23:48:30', '', 0, 'http://localhost/black/wordpress/wp-content/uploads/2018/09/th0GUYWBBV.jpg', 0, 'attachment', 'image/jpeg', 0),
(16, 1, '2018-09-21 23:48:38', '2018-09-21 23:48:38', '', 'cropped-th0GUYWBBV.jpg', '', 'inherit', 'open', 'closed', '', 'cropped-th0guywbbv-jpg', '', '', '2018-09-21 23:48:38', '2018-09-21 23:48:38', '', 0, 'http://localhost/black/wordpress/wp-content/uploads/2018/09/cropped-th0GUYWBBV.jpg', 0, 'attachment', 'image/jpeg', 0),
(17, 1, '2018-09-21 23:54:05', '2018-09-21 23:54:05', '{\n    "old_sidebars_widgets_data": {\n        "value": {\n            "wp_inactive_widgets": [\n                "search-2",\n                "recent-posts-2",\n                "recent-comments-2",\n                "archives-2",\n                "categories-2",\n                "meta-2"\n            ]\n        },\n        "type": "global_variable",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-21 23:49:39"\n    },\n    "vw-photography::header_image": {\n        "value": "remove-header",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-21 23:49:39"\n    },\n    "vw-photography::header_image_data": {\n        "value": "remove-header",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-21 23:49:39"\n    },\n    "vw-photography::background_image": {\n        "value": "http://localhost/black/wordpress/wp-content/uploads/2018/09/th0GUYWBBV.jpg",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-21 23:50:39"\n    },\n    "vw-photography::background_position_x": {\n        "value": "center",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-21 23:52:39"\n    },\n    "vw-photography::background_position_y": {\n        "value": "bottom",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-21 23:52:39"\n    },\n    "vw-photography::background_repeat": {\n        "value": "no-repeat",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-21 23:51:39"\n    },\n    "vw-photography::background_preset": {\n        "value": "fill",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-21 23:51:39"\n    },\n    "vw-photography::background_size": {\n        "value": "cover",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-21 23:51:39"\n    },\n    "vw-photography::background_attachment": {\n        "value": "fixed",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-21 23:51:39"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '2f682cf3-9fd6-4c67-9557-7836e158f285', '', '', '2018-09-21 23:54:05', '2018-09-21 23:54:05', '', 0, 'http://localhost/black/wordpress/?p=17', 0, 'customize_changeset', '', 0),
(18, 1, '2018-09-22 00:46:48', '2018-09-22 00:46:48', 'For years, collecting nerf blasters is one of my hobbies.\r\n\r\nThis is my top 5 blaster from my arsenal:\r\n<ol>\r\n 	<li>Raptorstike from AccuStrike Series <img class="size-full wp-image-24 aligncenter" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/thKUOS04IE.jpg" alt="" width="474" height="474" /></li>\r\n 	<li>Retaliator from N-Strike Elite<img class="size-full wp-image-26 aligncenter" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/Licensed-Nerf-N-Strike-ELITE-Retaliator-4-in-1-Blaster-Toy-Gun-Refill-Clip-Darts-nerf.jpg" alt="" width="800" height="800" /></li>\r\n 	<li>Alphatrooper CS-12 from N-Strike Elite<img class="size-full wp-image-30 aligncenter" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/nerf-elite-alpha-trooper-cs-12-blaster-1024x512.png" alt="" width="1024" height="512" /></li>\r\n 	<li>Flipfury from Zombie Strike<img class="size-full wp-image-33 aligncenter" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/nerf_flipfury_zombie_strike_blaster_t.jpg" alt="" width="600" height="500" /></li>\r\n 	<li>Jolt from N-Strike Elite<img class="size-full wp-image-34 aligncenter" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/thS59FJLT0.jpg" alt="" width="474" height="474" /></li>\r\n</ol>\r\n&nbsp;', 'My Nerf Arsenal Top 5!!!', '', 'publish', 'open', 'open', '', 'my-nerf-arsenal-top-5', '', '', '2018-09-22 01:01:16', '2018-09-22 01:01:16', '', 0, 'http://localhost/black/wordpress/?p=18', 0, 'post', '', 0),
(19, 1, '2018-09-22 00:03:17', '2018-09-22 00:03:17', 'For years, collecting nerf blasters is one of my hobbies.\r\n\r\nThis is\r\n\r\n&nbsp;', 'Nerf Arsenal!!!', '', 'inherit', 'closed', 'closed', '', '18-revision-v1', '', '', '2018-09-22 00:03:17', '2018-09-22 00:03:17', '', 18, 'http://localhost/black/wordpress/?p=19', 0, 'revision', '', 0),
(20, 1, '2018-09-22 00:03:43', '2018-09-22 00:03:43', '', 'th1C6EUEZ8', '', 'inherit', 'open', 'closed', '', 'th1c6euez8', '', '', '2018-09-22 00:03:43', '2018-09-22 00:03:43', '', 0, 'http://localhost/black/wordpress/wp-content/uploads/2018/09/th1C6EUEZ8.jpg', 0, 'attachment', 'image/jpeg', 0),
(21, 1, '2018-09-22 00:11:23', '0000-00-00 00:00:00', '{\n    "vw-photography::background_image": {\n        "value": "http://localhost/black/wordpress/wp-content/uploads/2018/09/Laeacco-Sunflower-Sunshine-Yellow-Portrait-Scene-Photography-Backgrounds-Custom-Vinyl-Photographic-Backdrops-For-Photo-Studio.jpg_640x640.jpg",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-22 00:11:23"\n    },\n    "vw-photography::background_position_x": {\n        "value": "center",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-22 00:04:01"\n    },\n    "vw-photography::background_position_y": {\n        "value": "bottom",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-22 00:04:01"\n    }\n}', '', '', 'auto-draft', 'closed', 'closed', '', '35dac060-c152-4090-a14a-7c4170ca5da9', '', '', '2018-09-22 00:11:23', '2018-09-22 00:11:23', '', 0, 'http://localhost/black/wordpress/?p=21', 0, 'customize_changeset', '', 0),
(22, 1, '2018-09-22 00:05:30', '2018-09-22 00:05:30', '', 'thQTY20AMT', '', 'inherit', 'open', 'closed', '', 'thqty20amt', '', '', '2018-09-22 00:05:30', '2018-09-22 00:05:30', '', 0, 'http://localhost/black/wordpress/wp-content/uploads/2018/09/thQTY20AMT.jpg', 0, 'attachment', 'image/jpeg', 0),
(23, 1, '2018-09-22 00:11:13', '2018-09-22 00:11:13', '', 'Laeacco-Sunflower-Sunshine-Yellow-Portrait-Scene-Photography-Backgrounds-Custom-Vinyl-Photographic-Backdrops-For-Photo-Studio.jpg_640x640', '', 'inherit', 'open', 'closed', '', 'laeacco-sunflower-sunshine-yellow-portrait-scene-photography-backgrounds-custom-vinyl-photographic-backdrops-for-photo-studio-jpg_640x640', '', '', '2018-09-22 00:11:13', '2018-09-22 00:11:13', '', 0, 'http://localhost/black/wordpress/wp-content/uploads/2018/09/Laeacco-Sunflower-Sunshine-Yellow-Portrait-Scene-Photography-Backgrounds-Custom-Vinyl-Photographic-Backdrops-For-Photo-Studio.jpg_640x640.jpg', 0, 'attachment', 'image/jpeg', 0),
(24, 1, '2018-09-22 00:14:27', '2018-09-22 00:14:27', '', 'thKUOS04IE', '', 'inherit', 'open', 'closed', '', 'thkuos04ie', '', '', '2018-09-22 00:14:27', '2018-09-22 00:14:27', '', 18, 'http://localhost/black/wordpress/wp-content/uploads/2018/09/thKUOS04IE.jpg', 0, 'attachment', 'image/jpeg', 0),
(25, 1, '2018-09-22 00:16:34', '2018-09-22 00:16:34', 'For years, collecting nerf blasters is one of my hobbies.\r\n\r\nThis is my top 10 blaster from my arsenal\r\n<ol>\r\n 	<li>Raptorstike\r\n<img class="aligncenter wp-image-24 size-full" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/thKUOS04IE.jpg" alt="" width="474" height="474" /></li>\r\n 	<li>Retaliator</li>\r\n 	<li>Alphatrooper CS-12</li>\r\n 	<li>Flipfury</li>\r\n 	<li></li>\r\n</ol>\r\n&nbsp;', 'Nerf Arsenal!!!', '', 'inherit', 'closed', 'closed', '', '18-revision-v1', '', '', '2018-09-22 00:16:34', '2018-09-22 00:16:34', '', 18, 'http://localhost/black/wordpress/?p=25', 0, 'revision', '', 0),
(26, 1, '2018-09-22 00:21:22', '2018-09-22 00:21:22', '', 'Licensed-Nerf-N-Strike-ELITE-Retaliator-4-in-1-Blaster-Toy-Gun-Refill-Clip-Darts-nerf', '', 'inherit', 'open', 'closed', '', 'licensed-nerf-n-strike-elite-retaliator-4-in-1-blaster-toy-gun-refill-clip-darts-nerf', '', '', '2018-09-22 00:21:22', '2018-09-22 00:21:22', '', 18, 'http://localhost/black/wordpress/wp-content/uploads/2018/09/Licensed-Nerf-N-Strike-ELITE-Retaliator-4-in-1-Blaster-Toy-Gun-Refill-Clip-Darts-nerf.jpg', 0, 'attachment', 'image/jpeg', 0),
(27, 1, '2018-09-22 00:22:39', '2018-09-22 00:22:39', 'For years, collecting nerf blasters is one of my hobbies.\r\n\r\nThis is my top 5 blaster from my arsenal\r\n<ol>\r\n 	<li>Raptorstike\r\n<img class="aligncenter wp-image-24 size-full" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/thKUOS04IE.jpg" alt="" width="474" height="474" /></li>\r\n 	<li>Retaliator<img class="alignnone size-full wp-image-26" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/Licensed-Nerf-N-Strike-ELITE-Retaliator-4-in-1-Blaster-Toy-Gun-Refill-Clip-Darts-nerf.jpg" alt="" width="800" height="800" /></li>\r\n 	<li>Alphatrooper CS-12</li>\r\n 	<li>Flipfury</li>\r\n 	<li>Jolt</li>\r\n</ol>\r\n&nbsp;', 'Nerf Arsenal!!!', '', 'inherit', 'closed', 'closed', '', '18-revision-v1', '', '', '2018-09-22 00:22:39', '2018-09-22 00:22:39', '', 18, 'http://localhost/black/wordpress/?p=27', 0, 'revision', '', 0),
(28, 1, '2018-09-22 00:24:01', '2018-09-22 00:24:01', 'Welcome!!!\n\nThis is where we will be posting all updates involving new crafts and collections', 'Welcome to Yvee''s Craft and Hobbies', '', 'inherit', 'closed', 'closed', '', '5-autosave-v1', '', '', '2018-09-22 00:24:01', '2018-09-22 00:24:01', '', 5, 'http://localhost/black/wordpress/?p=28', 0, 'revision', '', 0),
(29, 1, '2018-09-22 00:24:16', '2018-09-22 00:24:16', 'Welcome!!!\r\n\r\nThis is where we will be posting all updates about our new crafts and collections.\r\n\r\n&nbsp;', 'Welcome to Yvee''s Craft and Hobbies', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2018-09-22 00:24:16', '2018-09-22 00:24:16', '', 5, 'http://localhost/black/wordpress/?p=29', 0, 'revision', '', 0),
(30, 1, '2018-09-22 00:37:34', '2018-09-22 00:37:34', '', 'nerf-elite-alpha-trooper-cs-12-blaster-1024x512', '', 'inherit', 'open', 'closed', '', 'nerf-elite-alpha-trooper-cs-12-blaster-1024x512', '', '', '2018-09-22 00:37:34', '2018-09-22 00:37:34', '', 18, 'http://localhost/black/wordpress/wp-content/uploads/2018/09/nerf-elite-alpha-trooper-cs-12-blaster-1024x512.png', 0, 'attachment', 'image/png', 0),
(31, 1, '2018-09-22 00:38:30', '2018-09-22 00:38:30', '', 'Nerf_IL2-1', '', 'inherit', 'open', 'closed', '', 'nerf_il2-1', '', '', '2018-09-22 00:38:30', '2018-09-22 00:38:30', '', 18, 'http://localhost/black/wordpress/wp-content/uploads/2018/09/Nerf_IL2-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(32, 1, '2018-09-22 00:40:34', '2018-09-22 00:40:34', 'For years, collecting nerf blasters is one of my hobbies.\r\n\r\nThis is my top 5 blaster from my arsenal\r\n<ol>\r\n 	<li>Raptorstike from Accustrike Series <img class="alignnone size-full wp-image-31" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/Nerf_IL2-1.jpg" alt="" width="2064" height="1548" /></li>\r\n 	<li>Retaliator from N-Strike Elite<img class="alignnone size-full wp-image-26" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/Licensed-Nerf-N-Strike-ELITE-Retaliator-4-in-1-Blaster-Toy-Gun-Refill-Clip-Darts-nerf.jpg" alt="" width="800" height="800" /></li>\r\n 	<li>Alphatrooper CS-12 from N-Strike<img class="alignnone size-full wp-image-30" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/nerf-elite-alpha-trooper-cs-12-blaster-1024x512.png" alt="" width="1024" height="512" /></li>\r\n 	<li>Flipfury from Zombie Strike</li>\r\n 	<li>Jolt from N-Strike Elite</li>\r\n</ol>\r\n&nbsp;', 'Nerf Arsenal!!!', '', 'inherit', 'closed', 'closed', '', '18-revision-v1', '', '', '2018-09-22 00:40:34', '2018-09-22 00:40:34', '', 18, 'http://localhost/black/wordpress/?p=32', 0, 'revision', '', 0),
(33, 1, '2018-09-22 00:41:37', '2018-09-22 00:41:37', '', 'nerf_flipfury_zombie_strike_blaster_t', '', 'inherit', 'open', 'closed', '', 'nerf_flipfury_zombie_strike_blaster_t', '', '', '2018-09-22 00:41:37', '2018-09-22 00:41:37', '', 18, 'http://localhost/black/wordpress/wp-content/uploads/2018/09/nerf_flipfury_zombie_strike_blaster_t.jpg', 0, 'attachment', 'image/jpeg', 0),
(34, 1, '2018-09-22 00:44:58', '2018-09-22 00:44:58', '', 'thS59FJLT0', '', 'inherit', 'open', 'closed', '', 'ths59fjlt0', '', '', '2018-09-22 00:44:58', '2018-09-22 00:44:58', '', 18, 'http://localhost/black/wordpress/wp-content/uploads/2018/09/thS59FJLT0.jpg', 0, 'attachment', 'image/jpeg', 0),
(35, 1, '2018-09-22 00:45:26', '2018-09-22 00:45:26', 'For years, collecting nerf blasters is one of my hobbies.\r\n\r\nThis is my top 5 blaster from my arsenal\r\n<ol>\r\n 	<li>Raptorstike from Accustrike Series <img class="alignnone size-full wp-image-24" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/thKUOS04IE.jpg" alt="" width="474" height="474" /></li>\r\n 	<li>Retaliator from N-Strike Elite<img class="alignnone size-full wp-image-26" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/Licensed-Nerf-N-Strike-ELITE-Retaliator-4-in-1-Blaster-Toy-Gun-Refill-Clip-Darts-nerf.jpg" alt="" width="800" height="800" /></li>\r\n 	<li>Alphatrooper CS-12 from N-Strike Elite<img class="alignnone size-full wp-image-30" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/nerf-elite-alpha-trooper-cs-12-blaster-1024x512.png" alt="" width="1024" height="512" /></li>\r\n 	<li>Flipfury from Zombie Strike<img class="alignnone size-full wp-image-33" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/nerf_flipfury_zombie_strike_blaster_t.jpg" alt="" width="600" height="500" /></li>\r\n 	<li>Jolt from N-Strike Elite<img class="alignnone size-full wp-image-34" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/thS59FJLT0.jpg" alt="" width="474" height="474" /></li>\r\n</ol>\r\n&nbsp;', 'Nerf Arsenal!!!', '', 'inherit', 'closed', 'closed', '', '18-revision-v1', '', '', '2018-09-22 00:45:26', '2018-09-22 00:45:26', '', 18, 'http://localhost/black/wordpress/?p=35', 0, 'revision', '', 0),
(36, 1, '2018-09-22 00:46:48', '2018-09-22 00:46:48', 'For years, collecting nerf blasters is one of my hobbies.\r\n\r\nThis is my top 5 blaster from my arsenal:\r\n<ol>\r\n 	<li>Raptorstike from Accustrike Series <img class="alignnone size-full wp-image-24" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/thKUOS04IE.jpg" alt="" width="474" height="474" /></li>\r\n 	<li>Retaliator from N-Strike Elite<img class="alignnone size-full wp-image-26" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/Licensed-Nerf-N-Strike-ELITE-Retaliator-4-in-1-Blaster-Toy-Gun-Refill-Clip-Darts-nerf.jpg" alt="" width="800" height="800" /></li>\r\n 	<li>Alphatrooper CS-12 from N-Strike Elite<img class="alignnone size-full wp-image-30" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/nerf-elite-alpha-trooper-cs-12-blaster-1024x512.png" alt="" width="1024" height="512" /></li>\r\n 	<li>Flipfury from Zombie Strike<img class="alignnone size-full wp-image-33" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/nerf_flipfury_zombie_strike_blaster_t.jpg" alt="" width="600" height="500" /></li>\r\n 	<li>Jolt from N-Strike Elite<img class="alignnone size-full wp-image-34" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/thS59FJLT0.jpg" alt="" width="474" height="474" /></li>\r\n</ol>\r\n&nbsp;', 'My Nerf Arsenal Top 5!!!', '', 'inherit', 'closed', 'closed', '', '18-revision-v1', '', '', '2018-09-22 00:46:48', '2018-09-22 00:46:48', '', 18, 'http://localhost/black/wordpress/?p=36', 0, 'revision', '', 0),
(37, 1, '2018-09-22 00:47:00', '2018-09-22 00:47:00', 'For years, collecting nerf blasters is one of my hobbies.\r\n\r\nThis is my top 5 blaster from my arsenal:\r\n<ol>\r\n 	<li>Raptorstike from AccuStrike Series <img class="alignnone size-full wp-image-24" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/thKUOS04IE.jpg" alt="" width="474" height="474" /></li>\r\n 	<li>Retaliator from N-Strike Elite<img class="alignnone size-full wp-image-26" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/Licensed-Nerf-N-Strike-ELITE-Retaliator-4-in-1-Blaster-Toy-Gun-Refill-Clip-Darts-nerf.jpg" alt="" width="800" height="800" /></li>\r\n 	<li>Alphatrooper CS-12 from N-Strike Elite<img class="alignnone size-full wp-image-30" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/nerf-elite-alpha-trooper-cs-12-blaster-1024x512.png" alt="" width="1024" height="512" /></li>\r\n 	<li>Flipfury from Zombie Strike<img class="alignnone size-full wp-image-33" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/nerf_flipfury_zombie_strike_blaster_t.jpg" alt="" width="600" height="500" /></li>\r\n 	<li>Jolt from N-Strike Elite<img class="alignnone size-full wp-image-34" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/thS59FJLT0.jpg" alt="" width="474" height="474" /></li>\r\n</ol>\r\n&nbsp;', 'My Nerf Arsenal Top 5!!!', '', 'inherit', 'closed', 'closed', '', '18-revision-v1', '', '', '2018-09-22 00:47:00', '2018-09-22 00:47:00', '', 18, 'http://localhost/black/wordpress/?p=37', 0, 'revision', '', 0),
(38, 1, '2018-09-22 00:52:36', '2018-09-22 00:52:36', '{\n    "vw-photography::nav_menu_locations[primary-left]": {\n        "value": -1348810926,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-22 00:50:44"\n    },\n    "vw-photography::nav_menu_locations[primary-right]": {\n        "value": -261541493,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-22 00:50:44"\n    },\n    "nav_menu[-1348810926]": {\n        "value": {\n            "name": "Crafts",\n            "description": "",\n            "parent": 0,\n            "auto_add": false\n        },\n        "type": "nav_menu",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-22 00:50:44"\n    },\n    "nav_menu[-261541493]": {\n        "value": {\n            "name": "Hobbies",\n            "description": "",\n            "parent": 0,\n            "auto_add": false\n        },\n        "type": "nav_menu",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-22 00:50:44"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '93e063fa-ff58-4cd8-8ccc-9dc8a5876f2e', '', '', '2018-09-22 00:52:36', '2018-09-22 00:52:36', '', 0, 'http://localhost/black/wordpress/?p=38', 0, 'customize_changeset', '', 0),
(39, 1, '2018-09-22 00:53:35', '2018-09-22 00:53:35', 'This is an example page. It''s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I''m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin'' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href="http://localhost/black/wordpress/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2018-09-22 00:53:35', '2018-09-22 00:53:35', '', 2, 'http://localhost/black/wordpress/?p=39', 0, 'revision', '', 0),
(40, 1, '2018-09-22 00:54:13', '2018-09-22 00:54:13', 'Hello!', 'About Yvee''s Craft and Hobbies', '', 'publish', 'closed', 'closed', '', 'crafts', '', '', '2018-09-22 00:55:26', '2018-09-22 00:55:26', '', 0, 'http://localhost/black/wordpress/?page_id=40', 0, 'page', '', 0),
(41, 1, '2018-09-22 00:54:13', '2018-09-22 00:54:13', 'Hello', 'Crafts', '', 'inherit', 'closed', 'closed', '', '40-revision-v1', '', '', '2018-09-22 00:54:13', '2018-09-22 00:54:13', '', 40, 'http://localhost/black/wordpress/?p=41', 0, 'revision', '', 0),
(42, 1, '2018-09-22 00:55:05', '2018-09-22 00:55:05', 'Hello!', 'About Yvee''s Craft and Hobbies', '', 'inherit', 'closed', 'closed', '', '40-autosave-v1', '', '', '2018-09-22 00:55:05', '2018-09-22 00:55:05', '', 40, 'http://localhost/black/wordpress/?p=42', 0, 'revision', '', 0),
(43, 1, '2018-09-22 00:55:26', '2018-09-22 00:55:26', 'Hello!', 'About Yvee''s Craft and Hobbies', '', 'inherit', 'closed', 'closed', '', '40-revision-v1', '', '', '2018-09-22 00:55:26', '2018-09-22 00:55:26', '', 40, 'http://localhost/black/wordpress/?p=43', 0, 'revision', '', 0),
(44, 1, '2018-09-22 00:56:58', '2018-09-22 00:56:58', '{\n    "vw-photography::nav_menu_locations[primary-left]": {\n        "value": 0,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-22 00:56:58"\n    },\n    "vw-photography::nav_menu_locations[primary-right]": {\n        "value": 0,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-22 00:56:58"\n    },\n    "vw-photography::nav_menu_locations[responsive-menu]": {\n        "value": 0,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-22 00:56:58"\n    },\n    "nav_menu[2]": {\n        "value": false,\n        "type": "nav_menu",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-22 00:56:58"\n    },\n    "nav_menu[3]": {\n        "value": false,\n        "type": "nav_menu",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-22 00:56:58"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '21d2a3b0-5bdd-4f8b-b9e5-d32c6a8176ac', '', '', '2018-09-22 00:56:58', '2018-09-22 00:56:58', '', 0, 'http://localhost/black/wordpress/?p=44', 0, 'customize_changeset', '', 0),
(45, 1, '2018-09-22 00:59:14', '2018-09-22 00:59:14', 'For years, collecting nerf blasters is one of my hobbies.\r\n\r\nThis is my top 5 blaster from my arsenal:\r\n<ol>\r\n 	<li>Raptorstike from AccuStrike Series <img class="size-full wp-image-24 aligncenter" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/thKUOS04IE.jpg" alt="" width="474" height="474" /></li>\r\n 	<li>Retaliator from N-Strike Elite<img class="size-full wp-image-26 aligncenter" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/Licensed-Nerf-N-Strike-ELITE-Retaliator-4-in-1-Blaster-Toy-Gun-Refill-Clip-Darts-nerf.jpg" alt="" width="800" height="800" /></li>\r\n 	<li>Alphatrooper CS-12 from N-Strike Elite<img class="size-full wp-image-30 aligncenter" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/nerf-elite-alpha-trooper-cs-12-blaster-1024x512.png" alt="" width="1024" height="512" /></li>\r\n 	<li>Flipfury from Zombie Strike<img class="size-full wp-image-33 aligncenter" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/nerf_flipfury_zombie_strike_blaster_t.jpg" alt="" width="600" height="500" /></li>\r\n 	<li>Jolt from N-Strike Elite<img class="size-full wp-image-34 aligncenter" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/thS59FJLT0.jpg" alt="" width="474" height="474" /></li>\r\n</ol>\r\n&nbsp;', 'My Nerf Arsenal Top 5!!!', '', 'inherit', 'closed', 'closed', '', '18-revision-v1', '', '', '2018-09-22 00:59:14', '2018-09-22 00:59:14', '', 18, 'http://localhost/black/wordpress/?p=45', 0, 'revision', '', 0),
(46, 1, '2018-09-22 01:08:56', '0000-00-00 00:00:00', 'It has been a year since I have started perler beading', 'One Year of Perler Beading!!!', '', 'draft', 'open', 'open', '', '', '', '', '2018-09-22 01:08:56', '2018-09-22 01:08:56', '', 0, 'http://localhost/black/wordpress/?p=46', 0, 'post', '', 0),
(47, 1, '2018-09-22 01:08:56', '2018-09-22 01:08:56', 'It has been a year since I have started perler beading', 'One Year of Perler Beading!!!', '', 'inherit', 'closed', 'closed', '', '46-revision-v1', '', '', '2018-09-22 01:08:56', '2018-09-22 01:08:56', '', 46, 'http://localhost/black/wordpress/?p=47', 0, 'revision', '', 0),
(48, 1, '2018-09-22 01:15:55', '2018-09-22 01:15:55', '{\n    "vw-photography::vw_photography_theme_options": {\n        "value": "One Column",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-22 01:12:51"\n    },\n    "vw-photography::vw_photography_slider_arrows": {\n        "value": false,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-22 01:12:51"\n    },\n    "vw-photography::vw_photography_slider_page1": {\n        "value": "40",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-22 01:12:51"\n    },\n    "vw-photography::vw_photography_slider_page2": {\n        "value": "40",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-22 01:12:51"\n    },\n    "vw-photography::vw_photography_slider_page3": {\n        "value": "40",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-22 01:12:51"\n    },\n    "vw-photography::vw_photography_slider_page4": {\n        "value": "40",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-22 01:12:51"\n    },\n    "vw-photography::custom_logo": {\n        "value": 50,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-22 01:15:54"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '6828ba84-759e-4795-9260-ece5078b4952', '', '', '2018-09-22 01:15:55', '2018-09-22 01:15:55', '', 0, 'http://localhost/black/wordpress/?p=48', 0, 'customize_changeset', '', 0),
(49, 1, '2018-09-22 01:13:35', '2018-09-22 01:13:35', 'http://localhost/black/wordpress/wp-content/uploads/2018/09/cropped-ych_logo_v2-3.png', 'cropped-ych_logo_v2-3.png', '', 'inherit', 'open', 'closed', '', 'cropped-ych_logo_v2-3-png', '', '', '2018-09-22 01:13:35', '2018-09-22 01:13:35', '', 0, 'http://localhost/black/wordpress/wp-content/uploads/2018/09/cropped-ych_logo_v2-3.png', 0, 'attachment', 'image/png', 0),
(50, 1, '2018-09-22 01:15:38', '2018-09-22 01:15:38', 'http://localhost/black/wordpress/wp-content/uploads/2018/09/cropped-ych_logo_v2-4.png', 'cropped-ych_logo_v2-4.png', '', 'inherit', 'open', 'closed', '', 'cropped-ych_logo_v2-4-png', '', '', '2018-09-22 01:15:38', '2018-09-22 01:15:38', '', 0, 'http://localhost/black/wordpress/wp-content/uploads/2018/09/cropped-ych_logo_v2-4.png', 0, 'attachment', 'image/png', 0),
(51, 1, '2018-09-22 01:19:58', '0000-00-00 00:00:00', '{\n    "vw-photography::custom_logo": {\n        "value": "",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-22 01:17:57"\n    },\n    "vw-photography::vw_photography_slider_page1": {\n        "value": "0",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-22 01:17:57"\n    },\n    "vw-photography::vw_photography_slider_page2": {\n        "value": "0",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-22 01:17:57"\n    },\n    "vw-photography::vw_photography_slider_page3": {\n        "value": "0",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-22 01:17:57"\n    },\n    "vw-photography::vw_photography_slider_page4": {\n        "value": "0",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-22 01:17:57"\n    },\n    "vw-photography::vw_photography_slider_arrows": {\n        "value": true,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-22 01:18:57"\n    },\n    "sidebars_widgets[footer-1]": {\n        "value": [\n            "media_gallery-3"\n        ],\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-22 01:19:58"\n    },\n    "widget_media_gallery[3]": {\n        "value": [\n\n        ],\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-22 01:19:58"\n    }\n}', '', '', 'auto-draft', 'closed', 'closed', '', 'd21ebafd-51d4-4d89-8c24-eca15e71f3d7', '', '', '2018-09-22 01:19:58', '2018-09-22 01:19:58', '', 0, 'http://localhost/black/wordpress/?p=51', 0, 'customize_changeset', '', 0),
(52, 1, '2018-09-22 01:18:13', '2018-09-22 01:18:13', 'http://localhost/black/wordpress/wp-content/uploads/2018/09/cropped-ych_logo_v2-5.png', 'cropped-ych_logo_v2-5.png', '', 'inherit', 'open', 'closed', '', 'cropped-ych_logo_v2-5-png', '', '', '2018-09-22 01:18:13', '2018-09-22 01:18:13', '', 0, 'http://localhost/black/wordpress/wp-content/uploads/2018/09/cropped-ych_logo_v2-5.png', 0, 'attachment', 'image/png', 0),
(53, 1, '2018-09-25 23:54:32', '0000-00-00 00:00:00', 'We will be having a booth on JRock 6 this November 10 at Old Baguio Boys located at Nevada Square, Loakan Rd., Baguio City.\r\n\r\nWe will be selling our fuse bead crafts at our booth so be sure to check it out and buy our crafts.', 'JRock 6!', '', 'draft', 'open', 'open', '', '', '', '', '2018-09-25 23:54:32', '2018-09-25 23:54:32', '', 0, 'http://localhost/black/wordpress/?p=53', 0, 'post', '', 0),
(54, 1, '2018-09-25 23:52:19', '2018-09-25 23:52:19', 'We will be having a booth on JRock 6 this November 10 at Old Baguio Boys located at Nevada Square, Loakan Rd., Baguio City.\r\n\r\nWe will be selling our fuse bead crafts at our booth so be sure to check it out.', 'JRock 6!', '', 'inherit', 'closed', 'closed', '', '53-revision-v1', '', '', '2018-09-25 23:52:19', '2018-09-25 23:52:19', '', 53, 'http://localhost/black/wordpress/?p=54', 0, 'revision', '', 0),
(55, 1, '2018-09-25 23:54:32', '2018-09-25 23:54:32', 'We will be having a booth on JRock 6 this November 10 at Old Baguio Boys located at Nevada Square, Loakan Rd., Baguio City.\r\n\r\nWe will be selling our fuse bead crafts at our booth so be sure to check it out and buy our crafts.', 'JRock 6!', '', 'inherit', 'closed', 'closed', '', '53-revision-v1', '', '', '2018-09-25 23:54:32', '2018-09-25 23:54:32', '', 53, 'http://localhost/black/wordpress/?p=55', 0, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(56, 1, '2018-09-26 00:29:46', '2018-09-26 00:29:46', '{\n    "custom_css[vw-photography]": {\n        "value": "",\n        "type": "custom_css",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:00:46"\n    },\n    "vw-photography::nav_menu_locations[primary-left]": {\n        "value": -531472353,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:29:46"\n    },\n    "nav_menu[-479374804]": {\n        "value": false,\n        "type": "nav_menu",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:03:10"\n    },\n    "nav_menu_item[-2038880556]": {\n        "value": {\n            "object_id": 40,\n            "object": "page",\n            "menu_item_parent": 0,\n            "position": 3,\n            "type": "post_type",\n            "title": "About Yvee''s Craft and Hobbies",\n            "url": "http://localhost/black/wordpress/?page_id=40",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "About Yvee''s Craft and Hobbies",\n            "nav_menu_term_id": -479374804,\n            "_invalid": false,\n            "type_label": "Page"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:01:46"\n    },\n    "nav_menu_item[-1933148173]": {\n        "value": {\n            "object_id": 18,\n            "object": "post",\n            "menu_item_parent": 0,\n            "position": 4,\n            "type": "post_type",\n            "title": "My Nerf Arsenal Top 5!!!",\n            "url": "http://localhost/black/wordpress/?p=18",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "My Nerf Arsenal Top 5!!!",\n            "nav_menu_term_id": -479374804,\n            "_invalid": false,\n            "type_label": "Post"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:01:46"\n    },\n    "nav_menu_item[-577577160]": {\n        "value": {\n            "object_id": 8,\n            "object": "category",\n            "menu_item_parent": 0,\n            "position": 1,\n            "type": "taxonomy",\n            "title": "Events",\n            "url": "http://localhost/black/wordpress/?cat=8",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "Events",\n            "nav_menu_term_id": -479374804,\n            "_invalid": false,\n            "type_label": "Category"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:01:46"\n    },\n    "nav_menu_item[-1675072501]": {\n        "value": {\n            "object_id": 6,\n            "object": "category",\n            "menu_item_parent": 0,\n            "position": 2,\n            "type": "taxonomy",\n            "title": "Crafts",\n            "url": "http://localhost/black/wordpress/?cat=6",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "Crafts",\n            "nav_menu_term_id": -479374804,\n            "_invalid": false,\n            "type_label": "Category"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:01:46"\n    },\n    "nav_menu_item[-651652058]": {\n        "value": {\n            "object_id": 7,\n            "object": "category",\n            "menu_item_parent": 0,\n            "position": 7,\n            "type": "taxonomy",\n            "title": "Hobbies",\n            "url": "http://localhost/black/wordpress/?cat=7",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "Hobbies",\n            "nav_menu_term_id": -479374804,\n            "_invalid": false,\n            "type_label": "Category"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:01:46"\n    },\n    "nav_menu_item[-394152033]": {\n        "value": false,\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:02:46"\n    },\n    "nav_menu_item[-1615048322]": {\n        "value": false,\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:29:46"\n    },\n    "nav_menu_item[-1498347735]": {\n        "value": false,\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:02:46"\n    },\n    "vw-photography::background_color": {\n        "value": "#ffffff",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:17:42"\n    },\n    "vw-photography::background_position_x": {\n        "value": "center",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:17:42"\n    },\n    "vw-photography::background_position_y": {\n        "value": "top",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:19:42"\n    },\n    "vw-photography::background_image": {\n        "value": "http://localhost/black/wordpress/wp-content/uploads/2018/09/bg.jpg",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:19:42"\n    },\n    "vw-photography::nav_menu_locations[responsive-menu]": {\n        "value": 0,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:21:42"\n    },\n    "nav_menu[-234392758]": {\n        "value": false,\n        "type": "nav_menu",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:21:42"\n    },\n    "nav_menu_item[-784476244]": {\n        "value": {\n            "object_id": 40,\n            "object": "page",\n            "menu_item_parent": 0,\n            "position": 1,\n            "type": "post_type",\n            "title": "About Yvee''s Craft and Hobbies",\n            "url": "http://localhost/black/wordpress/?page_id=40",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "About Yvee''s Craft and Hobbies",\n            "nav_menu_term_id": -234392758,\n            "_invalid": false,\n            "type_label": "Page"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:19:42"\n    },\n    "nav_menu_item[-89225830]": {\n        "value": {\n            "object_id": 18,\n            "object": "post",\n            "menu_item_parent": 0,\n            "position": 2,\n            "type": "post_type",\n            "title": "My Nerf Arsenal Top 5!!!",\n            "url": "http://localhost/black/wordpress/?p=18",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "My Nerf Arsenal Top 5!!!",\n            "nav_menu_term_id": -234392758,\n            "_invalid": false,\n            "type_label": "Post"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:19:42"\n    },\n    "nav_menu_item[-747317995]": {\n        "value": {\n            "object_id": 5,\n            "object": "post",\n            "menu_item_parent": 0,\n            "position": 4,\n            "type": "post_type",\n            "title": "Welcome to Yvee''s Craft and Hobbies",\n            "url": "http://localhost/black/wordpress/?p=5",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "Welcome to Yvee''s Craft and Hobbies",\n            "nav_menu_term_id": -234392758,\n            "_invalid": false,\n            "type_label": "Post"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:21:42"\n    },\n    "nav_menu_item[-943285256]": {\n        "value": {\n            "object_id": 1,\n            "object": "category",\n            "menu_item_parent": 0,\n            "position": 3,\n            "type": "taxonomy",\n            "title": "Uncategorized",\n            "url": "http://localhost/black/wordpress/?cat=1",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "Uncategorized",\n            "nav_menu_term_id": -234392758,\n            "_invalid": false,\n            "type_label": "Category"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:21:42"\n    },\n    "nav_menu_item[-1203899409]": {\n        "value": {\n            "object_id": 7,\n            "object": "category",\n            "menu_item_parent": 0,\n            "position": 6,\n            "type": "taxonomy",\n            "title": "Hobbies",\n            "url": "http://localhost/black/wordpress/?cat=7",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "Hobbies",\n            "nav_menu_term_id": -234392758,\n            "_invalid": false,\n            "type_label": "Category"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:20:42"\n    },\n    "nav_menu_item[-439094589]": {\n        "value": {\n            "object_id": 6,\n            "object": "category",\n            "menu_item_parent": 0,\n            "position": 7,\n            "type": "taxonomy",\n            "title": "Crafts",\n            "url": "http://localhost/black/wordpress/?cat=6",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "Crafts",\n            "nav_menu_term_id": -234392758,\n            "_invalid": false,\n            "type_label": "Category"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:20:42"\n    },\n    "nav_menu_item[-1549021403]": {\n        "value": {\n            "object_id": 8,\n            "object": "category",\n            "menu_item_parent": 0,\n            "position": 8,\n            "type": "taxonomy",\n            "title": "Events",\n            "url": "http://localhost/black/wordpress/?cat=8",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "Events",\n            "nav_menu_term_id": -234392758,\n            "_invalid": false,\n            "type_label": "Category"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:20:42"\n    },\n    "nav_menu_item[-1554314384]": {\n        "value": {\n            "object_id": 4,\n            "object": "post_tag",\n            "menu_item_parent": 0,\n            "position": 9,\n            "type": "taxonomy",\n            "title": "Crafts",\n            "url": "http://localhost/black/wordpress/?tag=crafts",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "Crafts",\n            "nav_menu_term_id": -234392758,\n            "_invalid": false,\n            "type_label": "Tag"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:20:42"\n    },\n    "nav_menu_item[-716150957]": {\n        "value": {\n            "object_id": 5,\n            "object": "post_tag",\n            "menu_item_parent": 0,\n            "position": 10,\n            "type": "taxonomy",\n            "title": "Hobbies",\n            "url": "http://localhost/black/wordpress/?tag=hobbies",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "Hobbies",\n            "nav_menu_term_id": -234392758,\n            "_invalid": false,\n            "type_label": "Tag"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:20:42"\n    },\n    "vw-photography::nav_menu_locations[primary-right]": {\n        "value": -1932852667,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:21:42"\n    },\n    "nav_menu[-1932852667]": {\n        "value": {\n            "name": "Categories",\n            "description": "",\n            "parent": 0,\n            "auto_add": false\n        },\n        "type": "nav_menu",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:21:42"\n    },\n    "nav_menu_item[-1979910218]": {\n        "value": {\n            "object_id": 7,\n            "object": "category",\n            "menu_item_parent": 0,\n            "position": 1,\n            "type": "taxonomy",\n            "title": "Hobbies",\n            "url": "http://localhost/black/wordpress/?cat=7",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "Hobbies",\n            "nav_menu_term_id": -1932852667,\n            "_invalid": false,\n            "type_label": "Category"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:21:42"\n    },\n    "nav_menu_item[-1063185103]": {\n        "value": {\n            "object_id": 6,\n            "object": "category",\n            "menu_item_parent": 0,\n            "position": 2,\n            "type": "taxonomy",\n            "title": "Crafts",\n            "url": "http://localhost/black/wordpress/?cat=6",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "Crafts",\n            "nav_menu_term_id": -1932852667,\n            "_invalid": false,\n            "type_label": "Category"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:21:42"\n    },\n    "nav_menu_item[-499362980]": {\n        "value": {\n            "object_id": 8,\n            "object": "category",\n            "menu_item_parent": 0,\n            "position": 3,\n            "type": "taxonomy",\n            "title": "Events",\n            "url": "http://localhost/black/wordpress/?cat=8",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "Events",\n            "nav_menu_term_id": -1932852667,\n            "_invalid": false,\n            "type_label": "Category"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:21:42"\n    },\n    "nav_menu_item[-1690604008]": {\n        "value": {\n            "object_id": 1,\n            "object": "category",\n            "menu_item_parent": 0,\n            "position": 4,\n            "type": "taxonomy",\n            "title": "Uncategorized",\n            "url": "http://localhost/black/wordpress/?cat=1",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "Uncategorized",\n            "nav_menu_term_id": -1932852667,\n            "_invalid": false,\n            "type_label": "Category"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:22:42"\n    },\n    "nav_menu[-531472353]": {\n        "value": {\n            "name": "Crafts",\n            "description": "",\n            "parent": 0,\n            "auto_add": false\n        },\n        "type": "nav_menu",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:29:46"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'a347fa41-a5e2-46de-8ce1-9553a360ee0f', '', '', '2018-09-26 00:29:46', '2018-09-26 00:29:46', '', 0, 'http://localhost/black/wordpress/?p=56', 0, 'customize_changeset', '', 0),
(57, 1, '2018-09-26 00:18:34', '2018-09-26 00:18:34', '', 'bg', '', 'inherit', 'open', 'closed', '', 'bg', '', '', '2018-09-26 00:18:34', '2018-09-26 00:18:34', '', 0, 'http://localhost/black/wordpress/wp-content/uploads/2018/09/bg.jpg', 0, 'attachment', 'image/jpeg', 0),
(58, 1, '2018-09-26 00:29:46', '2018-09-26 00:29:46', '', 'vw-photography', '', 'publish', 'closed', 'closed', '', 'vw-photography', '', '', '2018-09-26 00:29:46', '2018-09-26 00:29:46', '', 0, 'http://localhost/black/wordpress/?p=58', 0, 'custom_css', '', 0),
(59, 1, '2018-09-26 00:29:46', '2018-09-26 00:29:46', '', 'vw-photography', '', 'inherit', 'closed', 'closed', '', '58-revision-v1', '', '', '2018-09-26 00:29:46', '2018-09-26 00:29:46', '', 58, 'http://localhost/black/wordpress/?p=59', 0, 'revision', '', 0),
(60, 1, '2018-09-26 00:29:47', '2018-09-26 00:29:47', ' ', '', '', 'publish', 'closed', 'closed', '', '60', '', '', '2018-09-26 00:29:47', '2018-09-26 00:29:47', '', 0, 'http://localhost/black/wordpress/?p=60', 1, 'nav_menu_item', '', 0),
(61, 1, '2018-09-26 00:29:48', '2018-09-26 00:29:48', ' ', '', '', 'publish', 'closed', 'closed', '', '61', '', '', '2018-09-26 00:29:48', '2018-09-26 00:29:48', '', 0, 'http://localhost/black/wordpress/?p=61', 2, 'nav_menu_item', '', 0),
(62, 1, '2018-09-26 00:29:49', '2018-09-26 00:29:49', ' ', '', '', 'publish', 'closed', 'closed', '', '62', '', '', '2018-09-26 00:29:49', '2018-09-26 00:29:49', '', 0, 'http://localhost/black/wordpress/?p=62', 3, 'nav_menu_item', '', 0),
(63, 1, '2018-09-26 00:29:49', '2018-09-26 00:29:49', ' ', '', '', 'publish', 'closed', 'closed', '', '63', '', '', '2018-09-26 00:29:49', '2018-09-26 00:29:49', '', 0, 'http://localhost/black/wordpress/?p=63', 4, 'nav_menu_item', '', 0),
(64, 1, '2018-09-26 00:30:51', '0000-00-00 00:00:00', 'New crafts has been added in the inventory this week. Check them out.', 'New Crafts!', '', 'draft', 'open', 'open', '', '', '', '', '2018-09-26 00:30:51', '2018-09-26 00:30:51', '', 0, 'http://localhost/black/wordpress/?p=64', 0, 'post', '', 0),
(65, 1, '2018-09-26 00:30:51', '2018-09-26 00:30:51', 'New crafts has been added in the inventory this week. Check them out.', 'New Crafts!', '', 'inherit', 'closed', 'closed', '', '64-revision-v1', '', '', '2018-09-26 00:30:51', '2018-09-26 00:30:51', '', 64, 'http://localhost/black/wordpress/?p=65', 0, 'revision', '', 0),
(66, 1, '2018-09-26 01:15:00', '2018-09-26 01:15:00', 'Jrock 5\r\n\r\n<img class="size-full wp-image-74 alignnone" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/JRock_5_before.jpg" alt="" width="540" height="960" />\r\n\r\nOctacon\r\n\r\n<img class="alignnone size-full wp-image-72" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/Octacon_before.jpg" alt="" width="1040" height="780" />\r\n\r\nHexCon ''18\r\n\r\n<img class="alignnone size-full wp-image-73" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/HexCon__18_before.jpg" alt="" width="1040" height="780" />', 'Check Our Booths From Past Events!', '', 'publish', 'open', 'open', '', 'check-our-booth-from-past-events', '', '', '2018-09-26 01:17:33', '2018-09-26 01:17:33', '', 0, 'http://localhost/black/wordpress/?p=66', 0, 'post', '', 0),
(67, 1, '2018-09-26 00:41:05', '2018-09-26 00:41:05', '', 'Check Our Booth From Past Events!', '', 'inherit', 'closed', 'closed', '', '66-revision-v1', '', '', '2018-09-26 00:41:05', '2018-09-26 00:41:05', '', 66, 'http://localhost/black/wordpress/?p=67', 0, 'revision', '', 0),
(68, 1, '2018-09-26 00:42:38', '0000-00-00 00:00:00', '', 'Hello', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-26 00:41:55', '0000-00-00 00:00:00', '', 0, 'http://localhost/black/wordpress/?page_id=68', 0, 'page', '', 0),
(69, 1, '2018-09-26 00:42:38', '0000-00-00 00:00:00', '', 'YO', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-26 00:42:09', '0000-00-00 00:00:00', '', 0, 'http://localhost/black/wordpress/?page_id=69', 0, 'page', '', 0),
(70, 1, '2018-09-26 00:42:38', '0000-00-00 00:00:00', '{\n    "show_on_front": {\n        "value": "page",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:42:38"\n    },\n    "page_on_front": {\n        "value": "69",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:42:38"\n    },\n    "page_for_posts": {\n        "value": "68",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:42:38"\n    },\n    "nav_menus_created_posts": {\n        "value": [\n            68,\n            69\n        ],\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-09-26 00:42:38"\n    }\n}', '', '', 'auto-draft', 'closed', 'closed', '', 'e312bbec-3ae4-431e-ae09-7c4a040fdd72', '', '', '2018-09-26 00:42:38', '0000-00-00 00:00:00', '', 0, 'http://localhost/black/wordpress/?p=70', 0, 'customize_changeset', '', 0),
(71, 1, '2018-09-26 01:11:27', '2018-09-26 01:11:27', '', 'JRock_5_before', '', 'inherit', 'open', 'closed', '', 'jrock_5_before', '', '', '2018-09-26 01:11:27', '2018-09-26 01:11:27', '', 66, 'http://localhost/black/wordpress/wp-content/uploads/2018/09/JRock_5_before.png', 0, 'attachment', 'image/png', 0),
(72, 1, '2018-09-26 01:12:47', '2018-09-26 01:12:47', '', 'Octacon_before', '', 'inherit', 'open', 'closed', '', 'octacon_before', '', '', '2018-09-26 01:12:47', '2018-09-26 01:12:47', '', 66, 'http://localhost/black/wordpress/wp-content/uploads/2018/09/Octacon_before.jpg', 0, 'attachment', 'image/jpeg', 0),
(73, 1, '2018-09-26 01:13:51', '2018-09-26 01:13:51', '', 'HexCon__18_before', '', 'inherit', 'open', 'closed', '', 'hexcon__18_before', '', '', '2018-09-26 01:13:51', '2018-09-26 01:13:51', '', 66, 'http://localhost/black/wordpress/wp-content/uploads/2018/09/HexCon__18_before.jpg', 0, 'attachment', 'image/jpeg', 0),
(74, 1, '2018-09-26 01:14:42', '2018-09-26 01:14:42', '', 'JRock_5_before', '', 'inherit', 'open', 'closed', '', 'jrock_5_before-2', '', '', '2018-09-26 01:14:42', '2018-09-26 01:14:42', '', 66, 'http://localhost/black/wordpress/wp-content/uploads/2018/09/JRock_5_before.jpg', 0, 'attachment', 'image/jpeg', 0),
(75, 1, '2018-09-26 01:14:57', '2018-09-26 01:14:57', 'Jrock 5<img class="alignnone size-full wp-image-74" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/JRock_5_before.jpg" alt="" width="540" height="960" />\r\n\r\nOctacon<img class="alignnone size-full wp-image-72" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/Octacon_before.jpg" alt="" width="1040" height="780" />\r\n\r\nHexCon ''18<img class="alignnone size-full wp-image-73" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/HexCon__18_before.jpg" alt="" width="1040" height="780" />', 'Check Our Booth From Past Events!', '', 'inherit', 'closed', 'closed', '', '66-revision-v1', '', '', '2018-09-26 01:14:57', '2018-09-26 01:14:57', '', 66, 'http://localhost/black/wordpress/?p=75', 0, 'revision', '', 0),
(76, 1, '2018-09-26 01:15:53', '2018-09-26 01:15:53', 'Jrock 5<img class="size-full wp-image-74 alignnone" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/JRock_5_before.jpg" alt="" width="540" height="960" />\r\n\r\nOctacon<img class="alignnone size-full wp-image-72" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/Octacon_before.jpg" alt="" width="1040" height="780" />\r\n\r\nHexCon ''18<img class="alignnone size-full wp-image-73" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/HexCon__18_before.jpg" alt="" width="1040" height="780" />', 'Check Our Booth From Past Events!', '', 'inherit', 'closed', 'closed', '', '66-revision-v1', '', '', '2018-09-26 01:15:53', '2018-09-26 01:15:53', '', 66, 'http://localhost/black/wordpress/?p=76', 0, 'revision', '', 0),
(77, 1, '2018-09-26 01:16:06', '2018-09-26 01:16:06', 'Jrock 5\r\n\r\n<img class="size-full wp-image-74 alignnone" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/JRock_5_before.jpg" alt="" width="540" height="960" />\r\n\r\nOctacon<img class="alignnone size-full wp-image-72" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/Octacon_before.jpg" alt="" width="1040" height="780" />\r\n\r\nHexCon ''18<img class="alignnone size-full wp-image-73" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/HexCon__18_before.jpg" alt="" width="1040" height="780" />', 'Check Our Booth From Past Events!', '', 'inherit', 'closed', 'closed', '', '66-revision-v1', '', '', '2018-09-26 01:16:06', '2018-09-26 01:16:06', '', 66, 'http://localhost/black/wordpress/?p=77', 0, 'revision', '', 0),
(78, 1, '2018-09-26 01:17:04', '2018-09-26 01:17:04', 'Jrock 5\r\n\r\n<img class="size-full wp-image-74 alignnone" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/JRock_5_before.jpg" alt="" width="540" height="960" />\r\n\r\nOctacon\r\n\r\n<img class="alignnone size-full wp-image-72" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/Octacon_before.jpg" alt="" width="1040" height="780" />\r\n\r\nHexCon ''18\r\n\r\n<img class="alignnone size-full wp-image-73" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/HexCon__18_before.jpg" alt="" width="1040" height="780" />', 'Check Our Booth From Past Events!', '', 'inherit', 'closed', 'closed', '', '66-revision-v1', '', '', '2018-09-26 01:17:04', '2018-09-26 01:17:04', '', 66, 'http://localhost/black/wordpress/?p=78', 0, 'revision', '', 0),
(79, 1, '2018-09-26 01:17:33', '2018-09-26 01:17:33', 'Jrock 5\r\n\r\n<img class="size-full wp-image-74 alignnone" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/JRock_5_before.jpg" alt="" width="540" height="960" />\r\n\r\nOctacon\r\n\r\n<img class="alignnone size-full wp-image-72" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/Octacon_before.jpg" alt="" width="1040" height="780" />\r\n\r\nHexCon ''18\r\n\r\n<img class="alignnone size-full wp-image-73" src="http://localhost/black/wordpress/wp-content/uploads/2018/09/HexCon__18_before.jpg" alt="" width="1040" height="780" />', 'Check Our Booths From Past Events!', '', 'inherit', 'closed', 'closed', '', '66-revision-v1', '', '', '2018-09-26 01:17:33', '2018-09-26 01:17:33', '', 66, 'http://localhost/black/wordpress/?p=79', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

CREATE TABLE IF NOT EXISTS `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(4, 'Crafts', 'crafts', 0),
(5, 'Hobbies', 'hobbies', 0),
(6, 'Crafts', 'crafts', 0),
(7, 'Hobbies', 'hobbies', 0),
(8, 'Events', 'events', 0),
(9, 'Categories', 'categories', 0),
(10, 'Crafts', 'crafts', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(5, 1, 0),
(18, 7, 0),
(46, 6, 0),
(53, 8, 0),
(60, 9, 0),
(61, 9, 0),
(62, 9, 0),
(63, 9, 0),
(64, 6, 0),
(66, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 2),
(4, 4, 'post_tag', '', 0, 0),
(5, 5, 'post_tag', '', 0, 0),
(6, 6, 'category', '', 0, 0),
(7, 7, 'category', '', 0, 1),
(8, 8, 'category', '', 0, 0),
(9, 9, 'nav_menu', '', 0, 4),
(10, 10, 'nav_menu', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=20 ;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'Owner'),
(2, 1, 'first_name', 'Ralph Reven'),
(3, 1, 'last_name', 'Dionisio'),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'wp496_privacy'),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:1:{s:64:"29a164a510b4d148c1bd01136db487019493d1ed57ffcacd93c36fec3c624887";a:4:{s:10:"expiration";i:1538091918;s:2:"ip";s:3:"::1";s:2:"ua";s:129:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134";s:5:"login";i:1537919118;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '4'),
(18, 1, 'wp_user-settings', 'libraryContent=browse&imgsize=full&editor=tinymce'),
(19, 1, 'wp_user-settings-time', '1537577740');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'username', '$P$BrkjRMmY5xh78GPKlu1Ad6V/Qlh0Zk.', 'username', 'ralphrevensd@gmail.com', '', '2018-09-19 00:19:18', '', 0, 'Owner');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

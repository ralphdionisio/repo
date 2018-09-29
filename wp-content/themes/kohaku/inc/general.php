<?php
/**
 * General functions.
 *
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly.
}

if ( ! function_exists( 'kohaku_scripts' ) ) {
	add_action( 'wp_enqueue_scripts', 'kohaku_scripts' );
	/**
	 * Enqueue scripts and styles
	 */
	function kohaku_scripts() {
		$kohaku_settings = wp_parse_args(
			get_option( 'kohaku_settings', array() ),
			kohaku_get_defaults()
		);

		$suffix = defined( 'SCRIPT_DEBUG' ) && SCRIPT_DEBUG ? '' : '.min';
		$dir_uri = get_template_directory_uri();

		wp_enqueue_style( 'kohaku-style-grid', $dir_uri . "/css/unsemantic-grid{$suffix}.css", false, KOHAKU_VERSION, 'all' );
		wp_enqueue_style( 'kohaku-style', $dir_uri . "/style{$suffix}.css", array( 'kohaku-style-grid' ), KOHAKU_VERSION, 'all' );
		wp_enqueue_style( 'kohaku-mobile-style', $dir_uri . "/css/mobile{$suffix}.css", array( 'kohaku-style' ), KOHAKU_VERSION, 'all' );

		if ( is_child_theme() ) {
			wp_enqueue_style( 'kohaku-child', get_stylesheet_uri(), array( 'kohaku-style' ), filemtime( get_stylesheet_directory() . '/style.css' ), 'all' );
		}

		wp_enqueue_style( 'font-awesome', $dir_uri . "/css/font-awesome{$suffix}.css", false, '5.1', 'all' );

		if ( function_exists( 'wp_script_add_data' ) ) {
			wp_enqueue_script( 'kohaku-classlist', $dir_uri . "/js/classList{$suffix}.js", array(), KOHAKU_VERSION, true );
			wp_script_add_data( 'kohaku-classlist', 'conditional', 'lte IE 11' );
		}

		wp_enqueue_script( 'kohaku-menu', $dir_uri . "/js/menu{$suffix}.js", array( 'jquery'), KOHAKU_VERSION, true );
		wp_enqueue_script( 'kohaku-a11y', $dir_uri . "/js/a11y{$suffix}.js", array(), KOHAKU_VERSION, true );

		if ( 'click' == $kohaku_settings[ 'nav_dropdown_type' ] || 'click-arrow' == $kohaku_settings[ 'nav_dropdown_type' ] ) {
			wp_enqueue_script( 'kohaku-dropdown-click', $dir_uri . "/js/dropdown-click{$suffix}.js", array( 'kohaku-menu' ), KOHAKU_VERSION, true );
		}

		if ( 'enable' == $kohaku_settings['nav_search'] ) {
			wp_enqueue_script( 'kohaku-navigation-search', $dir_uri . "/js/navigation-search{$suffix}.js", array( 'kohaku-menu' ), KOHAKU_VERSION, true );
		}

		if ( 'enable' == $kohaku_settings['back_to_top'] ) {
			wp_enqueue_script( 'kohaku-back-to-top', $dir_uri . "/js/back-to-top{$suffix}.js", array(), KOHAKU_VERSION, true );
		}

		if ( is_singular() && comments_open() && get_option( 'thread_comments' ) ) {
			wp_enqueue_script( 'comment-reply' );
		}
	}
}

if ( ! function_exists( 'kohaku_widgets_init' ) ) {
	add_action( 'widgets_init', 'kohaku_widgets_init' );
	/**
	 * Register widgetized area and update sidebar with default widgets
	 */
	function kohaku_widgets_init() {
		$widgets = array(
			'sidebar-1' => __( 'Right Sidebar', 'kohaku' ),
			'sidebar-2' => __( 'Left Sidebar', 'kohaku' ),
			'header' => __( 'Header', 'kohaku' ),
			'footer-1' => __( 'Footer Widget 1', 'kohaku' ),
			'footer-2' => __( 'Footer Widget 2', 'kohaku' ),
			'footer-3' => __( 'Footer Widget 3', 'kohaku' ),
			'footer-4' => __( 'Footer Widget 4', 'kohaku' ),
			'footer-5' => __( 'Footer Widget 5', 'kohaku' ),
			'footer-bar' => __( 'Footer Bar','kohaku' ),
			'top-bar' => __( 'Top Bar','kohaku' ),
		);

		foreach ( $widgets as $id => $name ) {
			register_sidebar( array(
				'name'          => $name,
				'id'            => $id,
				'before_widget' => '<aside id="%1$s" class="widget inner-padding %2$s">',
				'after_widget'  => '</aside>',
				'before_title'  => apply_filters( 'kohaku_start_widget_title', '<h2 class="widget-title">' ),
				'after_title'   => apply_filters( 'kohaku_end_widget_title', '</h2>' ),
			) );
		}
	}
}

if ( ! function_exists( 'kohaku_smart_content_width' ) ) {
	add_action( 'wp', 'kohaku_smart_content_width' );
	/**
	 * Set the $content_width depending on layout of current page
	 * Hook into "wp" so we have the correct layout setting from kohaku_get_layout()
	 * Hooking into "after_setup_theme" doesn't get the correct layout setting
	 */
	function kohaku_smart_content_width() {
		global $content_width;

		$container_width = kohaku_get_setting( 'container_width' );
		$right_sidebar_width = apply_filters( 'kohaku_right_sidebar_width', '25' );
		$left_sidebar_width = apply_filters( 'kohaku_left_sidebar_width', '25' );
		$layout = kohaku_get_layout();

		if ( 'left-sidebar' == $layout ) {
			$content_width = $container_width * ( ( 100 - $left_sidebar_width ) / 100 );
		} elseif ( 'right-sidebar' == $layout ) {
			$content_width = $container_width * ( ( 100 - $right_sidebar_width ) / 100 );
		} elseif ( 'no-sidebar' == $layout ) {
			$content_width = $container_width;
		} else {
			$content_width = $container_width * ( ( 100 - ( $left_sidebar_width + $right_sidebar_width ) ) / 100 );
		}
	}
}

if ( ! function_exists( 'kohaku_page_menu_args' ) ) {
	add_filter( 'wp_page_menu_args', 'kohaku_page_menu_args' );
	/**
	 * Get our wp_nav_menu() fallback, wp_page_menu(), to show a home link.
	 *
	 *
	 * @param array $args The existing menu args.
	 * @return array Menu args.
	 */
	function kohaku_page_menu_args( $args ) {
		$args['show_home'] = true;
		return $args;
	}
}

if ( ! function_exists( 'kohaku_disable_title' ) ) {
	add_filter( 'kohaku_show_title', 'kohaku_disable_title' );
	/**
	 * Remove our title if set.
	 *
	 *
	 * @return bool Whether to display the content title.
	 */
	function kohaku_disable_title() {
		global $post;

		$disable_headline = ( isset( $post ) ) ? get_post_meta( $post->ID, '_kohaku-disable-headline', true ) : '';

		if ( ! empty( $disable_headline ) && false !== $disable_headline ) {
			return false;
		}

		return true;
	}
}

if ( ! function_exists( 'kohaku_resource_hints' ) ) {
	add_filter( 'wp_resource_hints', 'kohaku_resource_hints', 10, 2 );
	/**
	 * Add resource hints to our Google fonts call.
	 *
	 *
	 * @param array  $urls           URLs to print for resource hints.
	 * @param string $relation_type  The relation type the URLs are printed.
	 * @return array $urls           URLs to print for resource hints.
	 */
	function kohaku_resource_hints( $urls, $relation_type ) {
		if ( wp_style_is( 'kohaku-fonts', 'queue' ) && 'preconnect' === $relation_type ) {
			if ( version_compare( $GLOBALS['wp_version'], '4.7-alpha', '>=' ) ) {
				$urls[] = array(
					'href' => 'https://fonts.gstatic.com',
					'crossorigin',
				);
			} else {
				$urls[] = 'https://fonts.gstatic.com';
			}
		}
		return $urls;
	}
}

if ( ! function_exists( 'kohaku_remove_caption_padding' ) ) {
	add_filter( 'img_caption_shortcode_width', 'kohaku_remove_caption_padding' );
	/**
	 * Remove WordPress's default padding on images with captions
	 *
	 * @param int $width Default WP .wp-caption width (image width + 10px)
	 * @return int Updated width to remove 10px padding
	 */
	function kohaku_remove_caption_padding( $width ) {
		return $width - 10;
	}
}

if ( ! function_exists( 'kohaku_enhanced_image_navigation' ) ) {
	add_filter( 'attachment_link', 'kohaku_enhanced_image_navigation', 10, 2 );
	/**
	 * Filter in a link to a content ID attribute for the next/previous image links on image attachment pages
	 */
	function kohaku_enhanced_image_navigation( $url, $id ) {
		if ( ! is_attachment() && ! wp_attachment_is_image( $id ) ) {
			return $url;
		}

		$image = get_post( $id );
		if ( ! empty( $image->post_parent ) && $image->post_parent != $id ) {
			$url .= '#main';
		}

		return $url;
	}
}

if ( ! function_exists( 'kohaku_categorized_blog' ) ) {
	/**
	 * Determine whether blog/site has more than one category.
	 *
	 *
	 * @return bool True of there is more than one category, false otherwise.
	 */
	function kohaku_categorized_blog() {
		if ( false === ( $all_the_cool_cats = get_transient( 'kohaku_categories' ) ) ) {
			// Create an array of all the categories that are attached to posts.
			$all_the_cool_cats = get_categories( array(
				'fields'     => 'ids',
				'hide_empty' => 1,

				// We only need to know if there is more than one category.
				'number'     => 2,
			) );

			// Count the number of categories that are attached to the posts.
			$all_the_cool_cats = count( $all_the_cool_cats );

			set_transient( 'kohaku_categories', $all_the_cool_cats );
		}

		if ( $all_the_cool_cats > 1 ) {
			// This blog has more than 1 category so twentyfifteen_categorized_blog should return true.
			return true;
		} else {
			// This blog has only 1 category so twentyfifteen_categorized_blog should return false.
			return false;
		}
	}
}

if ( ! function_exists( 'kohaku_category_transient_flusher' ) ) {
	add_action( 'edit_category', 'kohaku_category_transient_flusher' );
	add_action( 'save_post',     'kohaku_category_transient_flusher' );
	/**
	 * Flush out the transients used in {@see kohaku_categorized_blog()}.
	 *
	 */
	function kohaku_category_transient_flusher() {
		// Like, beat it. Dig?
		delete_transient( 'kohaku_categories' );
	}
}

add_filter( 'kohaku_fontawesome_essentials', 'kohaku_set_font_awesome_essentials' );
/**
 * Check to see if we should include the full Font Awesome library or not.
 *
 *
 * @param bool $essentials
 * @return bool
 */
function kohaku_set_font_awesome_essentials( $essentials ) {
	if ( kohaku_get_setting( 'font_awesome_essentials' ) ) {
		return true;
	}

	return $essentials;
}
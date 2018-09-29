<?php
/**
 * Header elements.
 *
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly.
}

if ( ! function_exists( 'kohaku_construct_header' ) ) {
	add_action( 'kohaku_header', 'kohaku_construct_header' );
	/**
	 * Build the header.
	 *
	 */
	function kohaku_construct_header() {
		?>
		<header itemtype="https://schema.org/WPHeader" itemscope="itemscope" id="masthead" <?php kohaku_header_class(); ?> style="background-image: url(<?php header_image(); ?>)">
			<div <?php kohaku_inside_header_class(); ?>>
            	<div class="header-content-h">
				<?php
				/**
				 * kohaku_before_header_content hook.
				 *
				 */
				do_action( 'kohaku_before_header_content' );

				// Add our main header items.
				kohaku_header_items();

				/**
				 * kohaku_after_header_content hook.
				 *
				 *
				 * @hooked kohaku_add_navigation_float_right - 5
				 */
				do_action( 'kohaku_after_header_content' );
				?>
                </div><!-- .header-content-h -->
			</div><!-- .inside-header -->
		</header><!-- #masthead -->
		<?php
	}
}

if ( ! function_exists( 'kohaku_header_items' ) ) {
	/**
	 * Build the header contents.
	 * Wrapping this into a function allows us to customize the order.
	 *
	 */
	function kohaku_header_items() {
		kohaku_construct_header_widget();
		kohaku_construct_site_title();
		kohaku_construct_logo();
	}
}

if ( ! function_exists( 'kohaku_construct_logo' ) ) {
	/**
	 * Build the logo
	 *
	 */
	function kohaku_construct_logo() {
		$logo_url = ( function_exists( 'the_custom_logo' ) && get_theme_mod( 'custom_logo' ) ) ? wp_get_attachment_image_src( get_theme_mod( 'custom_logo' ), 'full' ) : false;
		$logo_url = ( $logo_url ) ? $logo_url[0] : '';

		$logo_url = esc_url( apply_filters( 'kohaku_logo', $logo_url ) );
		$retina_logo_url = esc_url( apply_filters( 'kohaku_retina_logo', '' ) );

		// If we don't have a logo, bail.
		if ( empty( $logo_url ) ) {
			return;
		}

		/**
		 * kohaku_before_logo hook.
		 *
		 */
		do_action( 'kohaku_before_logo' );

		$attr = apply_filters( 'kohaku_logo_attributes', array(
			'class' => 'header-image',
			'src'	=> $logo_url,
			'title'	=> esc_attr( apply_filters( 'kohaku_logo_title', get_bloginfo( 'name', 'display' ) ) ),
		) );

		if ( '' !== $retina_logo_url ) {
			$attr[ 'srcset' ] = $logo_url . ' 1x, ' . $retina_logo_url . ' 2x';

			// Add dimensions to image if retina is set. This fixes a container width bug in Firefox.
			if ( function_exists( 'the_custom_logo' ) && get_theme_mod( 'custom_logo' ) ) {
				$data = wp_get_attachment_metadata( get_theme_mod( 'custom_logo' ) );

				if ( ! empty( $data ) ) {
					$attr['width'] = $data['width'];
					$attr['height'] = $data['height'];
				}
			}
		}

		$attr = array_map( 'esc_attr', $attr );

		$html_attr = '';
		foreach ( $attr as $name => $value ) {
			$html_attr .= " $name=" . '"' . $value . '"';
		}

		// Print our HTML.
		echo apply_filters( 'kohaku_logo_output', sprintf( // WPCS: XSS ok, sanitization ok.
			'<div class="site-logo">
				<a href="%1$s" title="%2$s" rel="home">
					<img %3$s />
				</a>
			</div>',
			esc_url( apply_filters( 'kohaku_logo_href' , home_url( '/' ) ) ),
			esc_attr( apply_filters( 'kohaku_logo_title', get_bloginfo( 'name', 'display' ) ) ),
			$html_attr
		), $logo_url, $html_attr );

		/**
		 * kohaku_after_logo hook.
		 *
		 */
		do_action( 'kohaku_after_logo' );
	}
}

if ( ! function_exists( 'kohaku_construct_site_title' ) ) {
	/**
	 * Build the site title and tagline.
	 *
	 */
	function kohaku_construct_site_title() {
		$kohaku_settings = wp_parse_args(
			get_option( 'kohaku_settings', array() ),
			kohaku_get_defaults()
		);

		// Get the title and tagline.
		$title = get_bloginfo( 'title' );
		$tagline = get_bloginfo( 'description' );

		// If the disable title checkbox is checked, or the title field is empty, return true.
		$disable_title = ( '1' == $kohaku_settings[ 'hide_title' ] || '' == $title ) ? true : false;

		// If the disable tagline checkbox is checked, or the tagline field is empty, return true.
		$disable_tagline = ( '1' == $kohaku_settings[ 'hide_tagline' ] || '' == $tagline ) ? true : false;

		// Build our site title.
		$site_title = apply_filters( 'kohaku_site_title_output', sprintf(
			'<%1$s class="main-title" itemprop="headline">
				<a href="%2$s" rel="home">
					%3$s
				</a>
			</%1$s>',
			( is_front_page() && is_home() ) ? 'h1' : 'p',
			esc_url( apply_filters( 'kohaku_site_title_href', home_url( '/' ) ) ),
			get_bloginfo( 'name' )
		) );

		// Build our tagline.
		$site_tagline = apply_filters( 'kohaku_site_description_output', sprintf(
			'<p class="site-description">
				%1$s
			</p>',
			html_entity_decode( get_bloginfo( 'description', 'display' ) )
		) );

		// Site title and tagline.
		if ( false == $disable_title || false == $disable_tagline ) {
			echo apply_filters( 'kohaku_site_branding_output', sprintf( // WPCS: XSS ok, sanitization ok.
				'<div class="site-branding">
					%1$s
					%2$s
				</div>',
				( ! $disable_title ) ? $site_title : '',
				( ! $disable_tagline ) ? $site_tagline : ''
			) );
		}
	}
}

if ( ! function_exists( 'kohaku_construct_header_widget' ) ) {
	/**
	 * Build the header widget.
	 *
	 */
	function kohaku_construct_header_widget() {
		if ( is_active_sidebar('header') ) : ?>
			<div class="header-widget">
				<?php dynamic_sidebar( 'header' ); ?>
			</div>
		<?php endif;
	}
}

if ( ! function_exists( 'kohaku_top_bar' ) ) {
	add_action( 'kohaku_before_header', 'kohaku_top_bar', 5 );
	/**
	 * Build our top bar.
	 *
	 */
	function kohaku_top_bar() {
		if ( ! is_active_sidebar( 'top-bar' ) ) {
			return;
		}
		?>
		<div <?php kohaku_top_bar_class(); ?>>
			<div class="inside-top-bar<?php if ( 'contained' == kohaku_get_setting( 'top_bar_inner_width' ) ) echo ' grid-container grid-parent'; ?>">
				<?php dynamic_sidebar( 'top-bar' ); ?>
			</div>
		</div>
		<?php
	}
}

if ( ! function_exists( 'kohaku_pingback_header' ) ) {
	add_action( 'wp_head', 'kohaku_pingback_header' );
	/**
	 * Add a pingback url auto-discovery header for singularly identifiable articles.
	 *
	 */
	function kohaku_pingback_header() {
		if ( is_singular() && pings_open() ) {
			printf( '<link rel="pingback" href="%s">' . "\n", esc_url( get_bloginfo( 'pingback_url' ) ) );
		}
	}
}

if ( ! function_exists( 'kohaku_add_viewport' ) ) {
	add_action( 'wp_head', 'kohaku_add_viewport' );
	/**
	 * Add viewport to wp_head.
	 *
	 */
	function kohaku_add_viewport() {
		echo apply_filters( 'kohaku_meta_viewport', '<meta name="viewport" content="width=device-width, initial-scale=1">' ); // WPCS: XSS ok.
	}
}

add_action( 'kohaku_before_header', 'kohaku_do_skip_to_content_link', 2 );
/**
 * Add skip to content link before the header.
 *
 */
function kohaku_do_skip_to_content_link() {
	printf( '<a class="screen-reader-text skip-link" href="#content" title="%1$s">%2$s</a>',
		esc_attr__( 'Skip to content', 'kohaku' ),
		esc_html__( 'Skip to content', 'kohaku' )
	);
}

add_action( 'kohaku_before_header', 'kohaku_side_padding', 1 );
/**
 * Add holder div if sidebar padding is enabled
 *
 */
function kohaku_side_padding() { 
	$kohaku_settings = wp_parse_args(
		get_option( 'kohaku_spacing_settings', array() ),
		kohaku_spacing_get_defaults()
	);
	
	if ( ( $kohaku_settings[ 'side_top' ] != 0 ) || ( $kohaku_settings[ 'side_right' ] != 0 ) || ( $kohaku_settings[ 'side_bottom' ] != 0 ) || ( $kohaku_settings[ 'side_left' ] != 0 ) ) {
	?>
	<div class="kohaku-side-padding-inside">
	<?php
	}
}

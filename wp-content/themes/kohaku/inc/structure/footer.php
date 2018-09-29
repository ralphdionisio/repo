<?php
/**
 * Footer elements.
 *
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly.
}

if ( ! function_exists( 'kohaku_construct_footer' ) ) {
	add_action( 'kohaku_footer', 'kohaku_construct_footer' );
	/**
	 * Build our footer.
	 *
	 */
	function kohaku_construct_footer() {
		?>
		<footer class="site-info" itemtype="https://schema.org/WPFooter" itemscope="itemscope">
			<div class="inside-site-info <?php if ( 'full-width' !== kohaku_get_setting( 'footer_inner_width' ) ) : ?>grid-container grid-parent<?php endif; ?>">
				<?php
				/**
				 * kohaku_before_copyright hook.
				 *
				 *
				 * @hooked kohaku_footer_bar - 15
				 */
				do_action( 'kohaku_before_copyright' );
				?>
				<div class="copyright-bar">
					<?php
					/**
					 * kohaku_credits hook.
					 *
					 *
					 * @hooked kohaku_add_footer_info - 10
					 */
					do_action( 'kohaku_credits' );
					?>
				</div>
			</div>
		</footer><!-- .site-info -->
		<?php
	}
}

if ( ! function_exists( 'kohaku_footer_bar' ) ) {
	add_action( 'kohaku_before_copyright', 'kohaku_footer_bar', 15 );
	/**
	 * Build our footer bar
	 *
	 */
	function kohaku_footer_bar() {
		if ( ! is_active_sidebar( 'footer-bar' ) ) {
			return;
		}
		?>
		<div class="footer-bar">
			<?php dynamic_sidebar( 'footer-bar' ); ?>
		</div>
		<?php
	}
}

if ( ! function_exists( 'kohaku_add_footer_info' ) ) {
	add_action( 'kohaku_credits', 'kohaku_add_footer_info' );
	/**
	 * Add the copyright to the footer
	 *
	 */
	function kohaku_add_footer_info() {
		// Get Customizer options
		$kohaku_settings = wp_parse_args(
			get_option( 'kohaku_settings', array() ),
			kohaku_get_defaults()
		);

		// Get the copyright text
		$copyright = $kohaku_settings['footer_copyright'];

		echo wp_kses_post( $copyright ); // WPCS: XSS ok.
	}
}

/**
 * Build our individual footer widgets.
 * Displays a sample widget if no widget is found in the area.
 *
 *
 * @param int $widget_width The width class of our widget.
 * @param int $widget The ID of our widget.
 */
function kohaku_do_footer_widget( $widget_width, $widget ) {
	$widget_width = apply_filters( "kohaku_footer_widget_{$widget}_width", $widget_width );
	$tablet_widget_width = apply_filters( "kohaku_footer_widget_{$widget}_tablet_width", '50' );
	?>
	<div class="footer-widget-<?php echo absint( $widget ); ?> grid-parent grid-<?php echo absint( $widget_width ); ?> tablet-grid-<?php echo absint( $tablet_widget_width ); ?> mobile-grid-100">
		<?php if ( ! dynamic_sidebar( 'footer-' . absint( $widget ) ) ) :
	        $current_user = wp_get_current_user();
	        if (user_can( $current_user, 'administrator' )) { ?>
			<aside class="widget inner-padding widget_text">
				<h4 class="widget-title"><?php esc_html_e( 'Footer Widget', 'kohaku' );?></h4>
				<div class="textwidget">
					<p>
						<?php
						printf( // WPCS: XSS ok.
							/* translators: 1: admin URL */
							__( 'Replace this widget content by going to <a href="%1$s"><strong>Appearance / Widgets</strong></a> and dragging widgets into this widget area.', 'kohaku' ),
							esc_url( admin_url( 'widgets.php' ) )
						);
						?>
					</p>
					<p>
						<?php
						printf( // WPCS: XSS ok.
							/* translators: 1: admin URL */
							__( 'To remove or choose the number of footer widgets, go to <a href="%1$s"><strong>Appearance / Customize / Layout / Footer Widgets</strong></a>.', 'kohaku' ),
							esc_url( admin_url( 'customize.php' ) )
						);
						?>
					</p>
				</div>
			</aside>
		<?php } endif; ?>
	</div>
	<?php
}

if ( ! function_exists( 'kohaku_construct_footer_widgets' ) ) {
	add_action( 'kohaku_footer', 'kohaku_construct_footer_widgets', 5 );
	/**
	 * Build our footer widgets.
	 *
	 */
	function kohaku_construct_footer_widgets() {
		// Get how many widgets to show.
		$widgets = kohaku_get_footer_widgets();

		if ( ! empty( $widgets ) && 0 !== $widgets ) :

			// Set up the widget width.
			$widget_width = '';
			if ( $widgets == 1 ) {
				$widget_width = '100';
			}

			if ( $widgets == 2 ) {
				$widget_width = '50';
			}

			if ( $widgets == 3 ) {
				$widget_width = '33';
			}

			if ( $widgets == 4 ) {
				$widget_width = '25';
			}

			if ( $widgets == 5 ) {
				$widget_width = '20';
			}
			?>
			<div id="footer-widgets" class="site footer-widgets">
				<div <?php kohaku_inside_footer_class(); ?>>
					<div class="inside-footer-widgets">
						<?php
						if ( $widgets >= 1 ) {
							kohaku_do_footer_widget( $widget_width, 1 );
						}

						if ( $widgets >= 2 ) {
							kohaku_do_footer_widget( $widget_width, 2 );
						}

						if ( $widgets >= 3 ) {
							kohaku_do_footer_widget( $widget_width, 3 );
						}

						if ( $widgets >= 4 ) {
							kohaku_do_footer_widget( $widget_width, 4 );
						}

						if ( $widgets >= 5 ) {
							kohaku_do_footer_widget( $widget_width, 5 );
						}
						?>
					</div>
				</div>
			</div>
		<?php
		endif;

		/**
		 * kohaku_after_footer_widgets hook.
		 *
		 */
		do_action( 'kohaku_after_footer_widgets' );
	}
}

if ( ! function_exists( 'kohaku_back_to_top' ) ) {
	add_action( 'kohaku_after_footer', 'kohaku_back_to_top', 2 );
	/**
	 * Build the back to top button
	 *
	 */
	function kohaku_back_to_top() {
		$kohaku_settings = wp_parse_args(
			get_option( 'kohaku_settings', array() ),
			kohaku_get_defaults()
		);

		if ( 'enable' !== $kohaku_settings[ 'back_to_top' ] ) {
			return;
		}

		echo apply_filters( 'kohaku_back_to_top_output', sprintf( // WPCS: XSS ok.
			'<a title="%1$s" rel="nofollow" href="#" class="kohaku-back-to-top" style="opacity:0;visibility:hidden;" data-scroll-speed="%2$s" data-start-scroll="%3$s">
				<span class="screen-reader-text">%5$s</span>
			</a>',
			esc_attr__( 'Scroll back to top', 'kohaku' ),
			absint( apply_filters( 'kohaku_back_to_top_scroll_speed', 400 ) ),
			absint( apply_filters( 'kohaku_back_to_top_start_scroll', 300 ) ),
			esc_attr( apply_filters( 'kohaku_back_to_top_icon', 'fa-angle-up' ) ),
			esc_html__( 'Scroll back to top', 'kohaku' )
		) );
	}
}

add_action( 'kohaku_after_footer', 'kohaku_side_padding_footer', 5 );
/**
 * Add holder div if sidebar padding is enabled
 *
 */
function kohaku_side_padding_footer() { 
	$kohaku_settings = wp_parse_args(
		get_option( 'kohaku_spacing_settings', array() ),
		kohaku_spacing_get_defaults()
	);
	
	$fixed_side_content =  kohaku_get_setting( 'fixed_side_content' ); 
	
	if ( ( $kohaku_settings[ 'side_top' ] != 0 ) || ( $kohaku_settings[ 'side_right' ] != 0 ) || ( $kohaku_settings[ 'side_bottom' ] != 0 ) || ( $kohaku_settings[ 'side_left' ] != 0 ) ) { ?>
    	<div class="kohaku-side-left-cover"></div>
    	<div class="kohaku-side-right-cover"></div>
	</div>
	<?php } 
	if (  $fixed_side_content != '' ) { ?>
    <div class="kohaku-side-left-content">
        <?php echo wp_kses_post( $fixed_side_content ); ?>
    </div>
    <?php
	}
}

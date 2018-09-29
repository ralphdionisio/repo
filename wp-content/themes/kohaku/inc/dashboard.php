<?php
/**
 * Builds our admin page.
 *
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly.
}

if ( ! function_exists( 'kohaku_create_menu' ) ) {
	add_action( 'admin_menu', 'kohaku_create_menu' );
	/**
	 * Adds our "Kohaku" dashboard menu item
	 *
	 */
	function kohaku_create_menu() {
		$kohaku_page = add_theme_page( 'Kohaku', 'Kohaku', apply_filters( 'kohaku_dashboard_page_capability', 'edit_theme_options' ), 'kohaku-options', 'kohaku_settings_page' );
		add_action( "admin_print_styles-$kohaku_page", 'kohaku_options_styles' );
	}
}

if ( ! function_exists( 'kohaku_options_styles' ) ) {
	/**
	 * Adds any necessary scripts to the Kohaku dashboard page
	 *
	 */
	function kohaku_options_styles() {
		wp_enqueue_style( 'kohaku-options', get_template_directory_uri() . '/css/admin/admin-style.css', array(), KOHAKU_VERSION );
	}
}

if ( ! function_exists( 'kohaku_settings_page' ) ) {
	/**
	 * Builds the content of our Kohaku dashboard page
	 *
	 */
	function kohaku_settings_page() {
		?>
		<div class="wrap">
			<div class="metabox-holder">
				<div class="kohaku-masthead clearfix">
					<div class="kohaku-container">
						<div class="kohaku-title">
							<a href="<?php echo esc_url(KOHAKU_THEME_URL); ?>" target="_blank"><?php esc_html_e( 'Kohaku', 'kohaku' ); ?></a> <span class="kohaku-version"><?php echo KOHAKU_VERSION; ?></span>
						</div>
						<div class="kohaku-masthead-links">
							<?php if ( ! defined( 'KOHAKU_PREMIUM_VERSION' ) ) : ?>
								<a class="kohaku-masthead-links-bold" href="<?php echo esc_url(KOHAKU_THEME_URL); ?>" target="_blank"><?php esc_html_e( 'Premium', 'kohaku' );?></a>
							<?php endif; ?>
							<a href="<?php echo esc_url(KOHAKU_WPKOI_AUTHOR_URL); ?>" target="_blank"><?php esc_html_e( 'WPKoi', 'kohaku' ); ?></a>
                            <a href="<?php echo esc_url(KOHAKU_DOCUMENTATION); ?>" target="_blank"><?php esc_html_e( 'Documentation', 'kohaku' ); ?></a>
						</div>
					</div>
				</div>

				<?php
				/**
				 * kohaku_dashboard_after_header hook.
				 *
				 */
				 do_action( 'kohaku_dashboard_after_header' );
				 ?>

				<div class="kohaku-container">
					<div class="postbox-container clearfix" style="float: none;">
						<div class="grid-container grid-parent">

							<?php
							/**
							 * kohaku_dashboard_inside_container hook.
							 *
							 */
							 do_action( 'kohaku_dashboard_inside_container' );
							 ?>

							<div class="form-metabox grid-70" style="padding-left: 0;">
								<h2 style="height:0;margin:0;"><!-- admin notices below this element --></h2>
								<form method="post" action="options.php">
									<?php settings_fields( 'kohaku-settings-group' ); ?>
									<?php do_settings_sections( 'kohaku-settings-group' ); ?>
									<div class="customize-button hide-on-desktop">
										<?php
										printf( '<a id="kohaku_customize_button" class="button button-primary" href="%1$s">%2$s</a>',
											esc_url( admin_url( 'customize.php' ) ),
											esc_html__( 'Customize', 'kohaku' )
										);
										?>
									</div>

									<?php
									/**
									 * kohaku_inside_options_form hook.
									 *
									 */
									 do_action( 'kohaku_inside_options_form' );
									 ?>
								</form>

								<?php
								$modules = array(
									'Backgrounds' => array(
											'url' => KOHAKU_THEME_URL,
									),
									'Blog' => array(
											'url' => KOHAKU_THEME_URL,
									),
									'Colors' => array(
											'url' => KOHAKU_THEME_URL,
									),
									'Disable Elements' => array(
											'url' => KOHAKU_THEME_URL,
									),
									'Demo Import' => array(
											'url' => KOHAKU_THEME_URL,
									),
									'Hooks' => array(
											'url' => KOHAKU_THEME_URL,
									),
									'Import / Export' => array(
											'url' => KOHAKU_THEME_URL,
									),
									'Menu Plus' => array(
											'url' => KOHAKU_THEME_URL,
									),
									'Page Header' => array(
											'url' => KOHAKU_THEME_URL,
									),
									'Secondary Nav' => array(
											'url' => KOHAKU_THEME_URL,
									),
									'Spacing' => array(
											'url' => KOHAKU_THEME_URL,
									),
									'Typography' => array(
											'url' => KOHAKU_THEME_URL,
									),
									'Elementor Addon' => array(
											'url' => KOHAKU_THEME_URL,
									)
								);

								if ( ! defined( 'KOHAKU_PREMIUM_VERSION' ) ) : ?>
									<div class="postbox kohaku-metabox">
										<h3 class="hndle"><?php esc_html_e( 'Premium Modules', 'kohaku' ); ?></h3>
										<div class="inside" style="margin:0;padding:0;">
											<div class="premium-addons">
												<?php foreach( $modules as $module => $info ) { ?>
												<div class="add-on activated kohaku-clear addon-container grid-parent">
													<div class="addon-name column-addon-name" style="">
														<a href="<?php echo esc_url( $info[ 'url' ] ); ?>" target="_blank"><?php echo esc_html( $module ); ?></a>
													</div>
													<div class="addon-action addon-addon-action" style="text-align:right;">
														<a href="<?php echo esc_url( $info[ 'url' ] ); ?>" target="_blank"><?php esc_html_e( 'Learn more', 'kohaku' ); ?></a>
													</div>
												</div>
												<div class="kohaku-clear"></div>
												<?php } ?>
											</div>
										</div>
									</div>
								<?php
								endif;

								/**
								 * kohaku_options_items hook.
								 *
								 */
								do_action( 'kohaku_options_items' );
								?>
							</div>

							<div class="kohaku-right-sidebar grid-30" style="padding-right: 0;">
								<div class="customize-button hide-on-mobile">
									<?php
									printf( '<a id="kohaku_customize_button" class="button button-primary" href="%1$s">%2$s</a>',
										esc_url( admin_url( 'customize.php' ) ),
										esc_html__( 'Customize', 'kohaku' )
									);
									?>
								</div>

								<?php
								/**
								 * kohaku_admin_right_panel hook.
								 *
								 */
								 do_action( 'kohaku_admin_right_panel' );

								  ?>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<?php
	}
}

if ( ! function_exists( 'kohaku_admin_errors' ) ) {
	add_action( 'admin_notices', 'kohaku_admin_errors' );
	/**
	 * Add our admin notices
	 *
	 */
	function kohaku_admin_errors() {
		$screen = get_current_screen();

		if ( 'appearance_page_kohaku-options' !== $screen->base ) {
			return;
		}

		if ( isset( $_GET['settings-updated'] ) && 'true' == $_GET['settings-updated'] ) {
			 add_settings_error( 'kohaku-notices', 'true', esc_html__( 'Settings saved.', 'kohaku' ), 'updated' );
		}

		if ( isset( $_GET['status'] ) && 'imported' == $_GET['status'] ) {
			 add_settings_error( 'kohaku-notices', 'imported', esc_html__( 'Import successful.', 'kohaku' ), 'updated' );
		}

		if ( isset( $_GET['status'] ) && 'reset' == $_GET['status'] ) {
			 add_settings_error( 'kohaku-notices', 'reset', esc_html__( 'Settings removed.', 'kohaku' ), 'updated' );
		}

		settings_errors( 'kohaku-notices' );
	}
}

<?php
/**
 * Builds our Customizer controls.
 *
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly.
}

add_action( 'customize_register', 'kohaku_set_customizer_helpers', 1 );
/**
 * Set up helpers early so they're always available.
 * Other modules might need access to them at some point.
 *
 */
function kohaku_set_customizer_helpers( $wp_customize ) {
	// Load helpers
	require_once trailingslashit( get_template_directory() ) . 'inc/customizer/customizer-helpers.php';
}

if ( ! function_exists( 'kohaku_customize_register' ) ) {
	add_action( 'customize_register', 'kohaku_customize_register' );
	/**
	 * Add our base options to the Customizer.
	 *
	 * @param WP_Customize_Manager $wp_customize Theme Customizer object.
	 */
	function kohaku_customize_register( $wp_customize ) {
		// Get our default values
		$defaults = kohaku_get_defaults();

		// Load helpers
		require_once trailingslashit( get_template_directory() ) . 'inc/customizer/customizer-helpers.php';

		if ( $wp_customize->get_control( 'blogdescription' ) ) {
			$wp_customize->get_control('blogdescription')->priority = 3;
			$wp_customize->get_setting( 'blogdescription' )->transport = 'postMessage';
		}

		if ( $wp_customize->get_control( 'blogname' ) ) {
			$wp_customize->get_control('blogname')->priority = 1;
			$wp_customize->get_setting( 'blogname' )->transport = 'postMessage';
		}

		if ( $wp_customize->get_control( 'custom_logo' ) ) {
			$wp_customize->get_setting( 'custom_logo' )->transport = 'refresh';
		}

		// Add control types so controls can be built using JS
		if ( method_exists( $wp_customize, 'register_control_type' ) ) {
			$wp_customize->register_control_type( 'Kohaku_Customize_Misc_Control' );
			$wp_customize->register_control_type( 'Kohaku_Range_Slider_Control' );
		}

		// Add upsell section type
		if ( method_exists( $wp_customize, 'register_section_type' ) ) {
			$wp_customize->register_section_type( 'Kohaku_Upsell_Section' );
		}

		// Add selective refresh to site title and description
		if ( isset( $wp_customize->selective_refresh ) ) {
			$wp_customize->selective_refresh->add_partial( 'blogname', array(
				'selector' => '.main-title a',
				'render_callback' => 'kohaku_customize_partial_blogname',
			) );

			$wp_customize->selective_refresh->add_partial( 'blogdescription', array(
				'selector' => '.site-description',
				'render_callback' => 'kohaku_customize_partial_blogdescription',
			) );
		}

		// Remove title
		$wp_customize->add_setting(
			'kohaku_settings[hide_title]',
			array(
				'default' => $defaults['hide_title'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_checkbox'
			)
		);

		$wp_customize->add_control(
			'kohaku_settings[hide_title]',
			array(
				'type' => 'checkbox',
				'label' => __( 'Hide site title', 'kohaku' ),
				'section' => 'title_tagline',
				'priority' => 2
			)
		);

		// Remove tagline
		$wp_customize->add_setting(
			'kohaku_settings[hide_tagline]',
			array(
				'default' => $defaults['hide_tagline'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_checkbox'
			)
		);

		$wp_customize->add_control(
			'kohaku_settings[hide_tagline]',
			array(
				'type' => 'checkbox',
				'label' => __( 'Hide site tagline', 'kohaku' ),
				'section' => 'title_tagline',
				'priority' => 4
			)
		);

		$wp_customize->add_setting(
			'kohaku_settings[retina_logo]',
			array(
				'type' => 'option',
				'sanitize_callback' => 'esc_url_raw'
			)
		);

		$wp_customize->add_control(
			new WP_Customize_Image_Control(
				$wp_customize,
				'kohaku_settings[retina_logo]',
				array(
					'label' => __( 'Retina Logo', 'kohaku' ),
					'section' => 'title_tagline',
					'settings' => 'kohaku_settings[retina_logo]',
					'active_callback' => 'kohaku_has_custom_logo_callback'
				)
			)
		);

		$wp_customize->add_setting(
			'kohaku_settings[side_inside_color]', array(
				'default' => $defaults['side_inside_color'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_hex_color',
				'transport' => 'postMessage',
			)
		);

		$wp_customize->add_control(
			new WP_Customize_Color_Control(
				$wp_customize,
				'kohaku_settings[side_inside_color]',
				array(
					'label' => __( 'Inside padding', 'kohaku' ),
					'section' => 'colors',
					'settings' => 'kohaku_settings[side_inside_color]',
					'active_callback' => 'kohaku_is_side_padding_active',
				)
			)
		);

		$wp_customize->add_setting(
			'kohaku_settings[text_color]', array(
				'default' => $defaults['text_color'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_hex_color',
				'transport' => 'postMessage',
			)
		);

		$wp_customize->add_control(
			new WP_Customize_Color_Control(
				$wp_customize,
				'kohaku_settings[text_color]',
				array(
					'label' => __( 'Text Color', 'kohaku' ),
					'section' => 'colors',
					'settings' => 'kohaku_settings[text_color]'
				)
			)
		);

		$wp_customize->add_setting(
			'kohaku_settings[link_color]', array(
				'default' => $defaults['link_color'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_hex_color',
				'transport' => 'postMessage',
			)
		);

		$wp_customize->add_control(
			new WP_Customize_Color_Control(
				$wp_customize,
				'kohaku_settings[link_color]',
				array(
					'label' => __( 'Link Color', 'kohaku' ),
					'section' => 'colors',
					'settings' => 'kohaku_settings[link_color]'
				)
			)
		);

		$wp_customize->add_setting(
			'kohaku_settings[link_color_hover]', array(
				'default' => $defaults['link_color_hover'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_hex_color',
				'transport' => 'postMessage',
			)
		);

		$wp_customize->add_control(
			new WP_Customize_Color_Control(
				$wp_customize,
				'kohaku_settings[link_color_hover]',
				array(
					'label' => __( 'Link Color Hover', 'kohaku' ),
					'section' => 'colors',
					'settings' => 'kohaku_settings[link_color_hover]'
				)
			)
		);

		$wp_customize->add_setting(
			'kohaku_settings[link_color_visited]', array(
				'default' => $defaults['link_color_visited'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_hex_color',
				'transport' => 'refresh',
			)
		);

		$wp_customize->add_control(
			new WP_Customize_Color_Control(
				$wp_customize,
				'kohaku_settings[link_color_visited]',
				array(
					'label' => __( 'Link Color Visited', 'kohaku' ),
					'section' => 'colors',
					'settings' => 'kohaku_settings[link_color_visited]'
				)
			)
		);

		if ( ! function_exists( 'kohaku_colors_customize_register' ) && ! defined( 'KOHAKU_PREMIUM_VERSION' ) ) {
			$wp_customize->add_control(
				new Kohaku_Customize_Misc_Control(
					$wp_customize,
					'colors_get_addon_desc',
					array(
						'section' => 'colors',
						'type' => 'addon',
						'label' => __( 'More info', 'kohaku' ),
						'description' => __( 'More colors are available in Kohaku premium version. Visit wpkoi.com for more info.', 'kohaku' ),
						'url' => esc_url( KOHAKU_THEME_URL ),
						'priority' => 30,
						'settings' => ( isset( $wp_customize->selective_refresh ) ) ? array() : 'blogname'
					)
				)
			);
		}

		if ( class_exists( 'WP_Customize_Panel' ) ) {
			if ( ! $wp_customize->get_panel( 'kohaku_layout_panel' ) ) {
				$wp_customize->add_panel( 'kohaku_layout_panel', array(
					'priority' => 25,
					'title' => __( 'Layout', 'kohaku' ),
				) );
			}
		}

		// Add Layout section
		$wp_customize->add_section(
			'kohaku_layout_container',
			array(
				'title' => __( 'Container', 'kohaku' ),
				'priority' => 10,
				'panel' => 'kohaku_layout_panel'
			)
		);

		// Container width
		$wp_customize->add_setting(
			'kohaku_settings[container_width]',
			array(
				'default' => $defaults['container_width'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_integer',
				'transport' => 'postMessage'
			)
		);

		$wp_customize->add_control(
			new Kohaku_Range_Slider_Control(
				$wp_customize,
				'kohaku_settings[container_width]',
				array(
					'type' => 'kohaku-range-slider',
					'label' => __( 'Container Width', 'kohaku' ),
					'section' => 'kohaku_layout_container',
					'settings' => array(
						'desktop' => 'kohaku_settings[container_width]',
					),
					'choices' => array(
						'desktop' => array(
							'min' => 700,
							'max' => 2000,
							'step' => 5,
							'edit' => true,
							'unit' => 'px',
						),
					),
					'priority' => 0,
				)
			)
		);

		// Add Top Bar section
		$wp_customize->add_section(
			'kohaku_top_bar',
			array(
				'title' => __( 'Top Bar', 'kohaku' ),
				'priority' => 15,
				'panel' => 'kohaku_layout_panel',
			)
		);

		// Add Top Bar width
		$wp_customize->add_setting(
			'kohaku_settings[top_bar_width]',
			array(
				'default' => $defaults['top_bar_width'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_choices',
				'transport' => 'postMessage'
			)
		);

		// Add Top Bar width control
		$wp_customize->add_control(
			'kohaku_settings[top_bar_width]',
			array(
				'type' => 'select',
				'label' => __( 'Top Bar Width', 'kohaku' ),
				'section' => 'kohaku_top_bar',
				'choices' => array(
					'full' => __( 'Full', 'kohaku' ),
					'contained' => __( 'Contained', 'kohaku' )
				),
				'settings' => 'kohaku_settings[top_bar_width]',
				'priority' => 5,
				'active_callback' => 'kohaku_is_top_bar_active',
			)
		);

		// Add Top Bar inner width
		$wp_customize->add_setting(
			'kohaku_settings[top_bar_inner_width]',
			array(
				'default' => $defaults['top_bar_inner_width'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_choices',
				'transport' => 'postMessage'
			)
		);

		// Add Top Bar width control
		$wp_customize->add_control(
			'kohaku_settings[top_bar_inner_width]',
			array(
				'type' => 'select',
				'label' => __( 'Top Bar Inner Width', 'kohaku' ),
				'section' => 'kohaku_top_bar',
				'choices' => array(
					'full' => __( 'Full', 'kohaku' ),
					'contained' => __( 'Contained', 'kohaku' )
				),
				'settings' => 'kohaku_settings[top_bar_inner_width]',
				'priority' => 10,
				'active_callback' => 'kohaku_is_top_bar_active',
			)
		);

		// Add top bar alignment
		$wp_customize->add_setting(
			'kohaku_settings[top_bar_alignment]',
			array(
				'default' => $defaults['top_bar_alignment'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_choices',
				'transport' => 'postMessage'
			)
		);

		// Add navigation control
		$wp_customize->add_control(
			'kohaku_settings[top_bar_alignment]',
			array(
				'type' => 'select',
				'label' => __( 'Top Bar Alignment', 'kohaku' ),
				'section' => 'kohaku_top_bar',
				'choices' => array(
					'left' => __( 'Left', 'kohaku' ),
					'center' => __( 'Center', 'kohaku' ),
					'right' => __( 'Right', 'kohaku' )
				),
				'settings' => 'kohaku_settings[top_bar_alignment]',
				'priority' => 15,
				'active_callback' => 'kohaku_is_top_bar_active',
			)
		);

		// Add Header section
		$wp_customize->add_section(
			'kohaku_layout_header',
			array(
				'title' => __( 'Header', 'kohaku' ),
				'priority' => 20,
				'panel' => 'kohaku_layout_panel'
			)
		);

		// Add Header Layout setting
		$wp_customize->add_setting(
			'kohaku_settings[header_layout_setting]',
			array(
				'default' => $defaults['header_layout_setting'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_choices',
				'transport' => 'postMessage'
			)
		);

		// Add Header Layout control
		$wp_customize->add_control(
			'kohaku_settings[header_layout_setting]',
			array(
				'type' => 'select',
				'label' => __( 'Header Width', 'kohaku' ),
				'section' => 'kohaku_layout_header',
				'choices' => array(
					'fluid-header' => __( 'Full', 'kohaku' ),
					'contained-header' => __( 'Contained', 'kohaku' )
				),
				'settings' => 'kohaku_settings[header_layout_setting]',
				'priority' => 5
			)
		);

		// Add Inside Header Layout setting
		$wp_customize->add_setting(
			'kohaku_settings[header_inner_width]',
			array(
				'default' => $defaults['header_inner_width'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_choices',
				'transport' => 'postMessage'
			)
		);

		// Add Header Layout control
		$wp_customize->add_control(
			'kohaku_settings[header_inner_width]',
			array(
				'type' => 'select',
				'label' => __( 'Inner Header Width', 'kohaku' ),
				'section' => 'kohaku_layout_header',
				'choices' => array(
					'contained' => __( 'Contained', 'kohaku' ),
					'full-width' => __( 'Full', 'kohaku' )
				),
				'settings' => 'kohaku_settings[header_inner_width]',
				'priority' => 6
			)
		);

		// Add navigation setting
		$wp_customize->add_setting(
			'kohaku_settings[header_alignment_setting]',
			array(
				'default' => $defaults['header_alignment_setting'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_choices',
				'transport' => 'postMessage'
			)
		);

		// Add navigation control
		$wp_customize->add_control(
			'kohaku_settings[header_alignment_setting]',
			array(
				'type' => 'select',
				'label' => __( 'Header Alignment', 'kohaku' ),
				'section' => 'kohaku_layout_header',
				'choices' => array(
					'left' => __( 'Left', 'kohaku' ),
					'center' => __( 'Center', 'kohaku' ),
					'right' => __( 'Right', 'kohaku' )
				),
				'settings' => 'kohaku_settings[header_alignment_setting]',
				'priority' => 10
			)
		);

		$wp_customize->add_section(
			'kohaku_layout_navigation',
			array(
				'title' => __( 'Primary Navigation', 'kohaku' ),
				'priority' => 30,
				'panel' => 'kohaku_layout_panel'
			)
		);

		// Add navigation setting
		$wp_customize->add_setting(
			'kohaku_settings[nav_layout_setting]',
			array(
				'default' => $defaults['nav_layout_setting'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_choices',
				'transport' => 'postMessage'
			)
		);

		// Add navigation control
		$wp_customize->add_control(
			'kohaku_settings[nav_layout_setting]',
			array(
				'type' => 'select',
				'label' => __( 'Navigation Width', 'kohaku' ),
				'section' => 'kohaku_layout_navigation',
				'choices' => array(
					'fluid-nav' => __( 'Full', 'kohaku' ),
					'contained-nav' => __( 'Contained', 'kohaku' )
				),
				'settings' => 'kohaku_settings[nav_layout_setting]',
				'priority' => 15
			)
		);

		// Add navigation setting
		$wp_customize->add_setting(
			'kohaku_settings[nav_inner_width]',
			array(
				'default' => $defaults['nav_inner_width'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_choices',
				'transport' => 'postMessage'
			)
		);

		// Add navigation control
		$wp_customize->add_control(
			'kohaku_settings[nav_inner_width]',
			array(
				'type' => 'select',
				'label' => __( 'Inner Navigation Width', 'kohaku' ),
				'section' => 'kohaku_layout_navigation',
				'choices' => array(
					'contained' => __( 'Contained', 'kohaku' ),
					'full-width' => __( 'Full', 'kohaku' )
				),
				'settings' => 'kohaku_settings[nav_inner_width]',
				'priority' => 16
			)
		);

		// Add navigation setting
		$wp_customize->add_setting(
			'kohaku_settings[nav_alignment_setting]',
			array(
				'default' => $defaults['nav_alignment_setting'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_choices',
				'transport' => 'postMessage'
			)
		);

		// Add navigation control
		$wp_customize->add_control(
			'kohaku_settings[nav_alignment_setting]',
			array(
				'type' => 'select',
				'label' => __( 'Navigation Alignment', 'kohaku' ),
				'section' => 'kohaku_layout_navigation',
				'choices' => array(
					'left' => __( 'Left', 'kohaku' ),
					'center' => __( 'Center', 'kohaku' ),
					'right' => __( 'Right', 'kohaku' )
				),
				'settings' => 'kohaku_settings[nav_alignment_setting]',
				'priority' => 20
			)
		);

		// Add navigation setting
		$wp_customize->add_setting(
			'kohaku_settings[nav_position_setting]',
			array(
				'default' => $defaults['nav_position_setting'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_choices',
				'transport' => ( '' !== kohaku_get_setting( 'nav_position_setting' ) ) ? 'postMessage' : 'refresh'
			)
		);

		// Add navigation control
		$wp_customize->add_control(
			'kohaku_settings[nav_position_setting]',
			array(
				'type' => 'select',
				'label' => __( 'Navigation Location', 'kohaku' ),
				'section' => 'kohaku_layout_navigation',
				'choices' => array(
					'nav-below-header' => __( 'Below Header', 'kohaku' ),
					'nav-above-header' => __( 'Above Header', 'kohaku' ),
					'nav-float-right' => __( 'Float Right', 'kohaku' ),
					'nav-float-left' => __( 'Float Left', 'kohaku' ),
					'nav-left-sidebar' => __( 'Left Sidebar', 'kohaku' ),
					'nav-right-sidebar' => __( 'Right Sidebar', 'kohaku' ),
					'' => __( 'No Navigation', 'kohaku' )
				),
				'settings' => 'kohaku_settings[nav_position_setting]',
				'priority' => 22
			)
		);

		// Add navigation setting
		$wp_customize->add_setting(
			'kohaku_settings[nav_dropdown_type]',
			array(
				'default' => $defaults['nav_dropdown_type'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_choices'
			)
		);

		// Add navigation control
		$wp_customize->add_control(
			'kohaku_settings[nav_dropdown_type]',
			array(
				'type' => 'select',
				'label' => __( 'Navigation Dropdown', 'kohaku' ),
				'section' => 'kohaku_layout_navigation',
				'choices' => array(
					'hover' => __( 'Hover', 'kohaku' ),
					'click' => __( 'Click - Menu Item', 'kohaku' ),
					'click-arrow' => __( 'Click - Arrow', 'kohaku' )
				),
				'settings' => 'kohaku_settings[nav_dropdown_type]',
				'priority' => 22
			)
		);

		// Add navigation setting
		$wp_customize->add_setting(
			'kohaku_settings[nav_search]',
			array(
				'default' => $defaults['nav_search'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_choices'
			)
		);

		// Add navigation control
		$wp_customize->add_control(
			'kohaku_settings[nav_search]',
			array(
				'type' => 'select',
				'label' => __( 'Navigation Search', 'kohaku' ),
				'section' => 'kohaku_layout_navigation',
				'choices' => array(
					'enable' => __( 'Enable', 'kohaku' ),
					'disable' => __( 'Disable', 'kohaku' )
				),
				'settings' => 'kohaku_settings[nav_search]',
				'priority' => 23
			)
		);

		// Add content setting
		$wp_customize->add_setting(
			'kohaku_settings[content_layout_setting]',
			array(
				'default' => $defaults['content_layout_setting'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_choices',
				'transport' => 'postMessage'
			)
		);

		// Add content control
		$wp_customize->add_control(
			'kohaku_settings[content_layout_setting]',
			array(
				'type' => 'select',
				'label' => __( 'Content Layout', 'kohaku' ),
				'section' => 'kohaku_layout_container',
				'choices' => array(
					'separate-containers' => __( 'Separate Containers', 'kohaku' ),
					'one-container' => __( 'One Container', 'kohaku' )
				),
				'settings' => 'kohaku_settings[content_layout_setting]',
				'priority' => 25
			)
		);

		$wp_customize->add_section(
			'kohaku_layout_sidecontent',
			array(
				'title' => __( 'Fixed Side Content', 'kohaku' ),
				'priority' => 39,
				'panel' => 'kohaku_layout_panel'
			)
		);
		
		$wp_customize->add_setting(
			'kohaku_settings[fixed_side_content]',
			array(
				'default' => $defaults['fixed_side_content'],
				'type' => 'option',
				'sanitize_callback' => 'wp_kses_post',
			)
		);

		$wp_customize->add_control(
			'kohaku_settings[fixed_side_content]',
			array(
				'type' 		 => 'textarea',
				'label'      => __( 'Fixed Side Content', 'kohaku' ),
				'description'=> __( 'Content that You want to display fixed on the left.', 'kohaku' ),
				'section'    => 'kohaku_layout_sidecontent',
				'settings'   => 'kohaku_settings[fixed_side_content]',
			)
		);

		$wp_customize->add_section(
			'kohaku_layout_sidebars',
			array(
				'title' => __( 'Sidebars', 'kohaku' ),
				'priority' => 40,
				'panel' => 'kohaku_layout_panel'
			)
		);

		// Add Layout setting
		$wp_customize->add_setting(
			'kohaku_settings[layout_setting]',
			array(
				'default' => $defaults['layout_setting'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_choices'
			)
		);

		// Add Layout control
		$wp_customize->add_control(
			'kohaku_settings[layout_setting]',
			array(
				'type' => 'select',
				'label' => __( 'Sidebar Layout', 'kohaku' ),
				'section' => 'kohaku_layout_sidebars',
				'choices' => array(
					'left-sidebar' => __( 'Sidebar / Content', 'kohaku' ),
					'right-sidebar' => __( 'Content / Sidebar', 'kohaku' ),
					'no-sidebar' => __( 'Content (no sidebars)', 'kohaku' ),
					'both-sidebars' => __( 'Sidebar / Content / Sidebar', 'kohaku' ),
					'both-left' => __( 'Sidebar / Sidebar / Content', 'kohaku' ),
					'both-right' => __( 'Content / Sidebar / Sidebar', 'kohaku' )
				),
				'settings' => 'kohaku_settings[layout_setting]',
				'priority' => 30
			)
		);

		// Add Layout setting
		$wp_customize->add_setting(
			'kohaku_settings[blog_layout_setting]',
			array(
				'default' => $defaults['blog_layout_setting'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_choices'
			)
		);

		// Add Layout control
		$wp_customize->add_control(
			'kohaku_settings[blog_layout_setting]',
			array(
				'type' => 'select',
				'label' => __( 'Blog Sidebar Layout', 'kohaku' ),
				'section' => 'kohaku_layout_sidebars',
				'choices' => array(
					'left-sidebar' => __( 'Sidebar / Content', 'kohaku' ),
					'right-sidebar' => __( 'Content / Sidebar', 'kohaku' ),
					'no-sidebar' => __( 'Content (no sidebars)', 'kohaku' ),
					'both-sidebars' => __( 'Sidebar / Content / Sidebar', 'kohaku' ),
					'both-left' => __( 'Sidebar / Sidebar / Content', 'kohaku' ),
					'both-right' => __( 'Content / Sidebar / Sidebar', 'kohaku' )
				),
				'settings' => 'kohaku_settings[blog_layout_setting]',
				'priority' => 35
			)
		);

		// Add Layout setting
		$wp_customize->add_setting(
			'kohaku_settings[single_layout_setting]',
			array(
				'default' => $defaults['single_layout_setting'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_choices'
			)
		);

		// Add Layout control
		$wp_customize->add_control(
			'kohaku_settings[single_layout_setting]',
			array(
				'type' => 'select',
				'label' => __( 'Single Post Sidebar Layout', 'kohaku' ),
				'section' => 'kohaku_layout_sidebars',
				'choices' => array(
					'left-sidebar' => __( 'Sidebar / Content', 'kohaku' ),
					'right-sidebar' => __( 'Content / Sidebar', 'kohaku' ),
					'no-sidebar' => __( 'Content (no sidebars)', 'kohaku' ),
					'both-sidebars' => __( 'Sidebar / Content / Sidebar', 'kohaku' ),
					'both-left' => __( 'Sidebar / Sidebar / Content', 'kohaku' ),
					'both-right' => __( 'Content / Sidebar / Sidebar', 'kohaku' )
				),
				'settings' => 'kohaku_settings[single_layout_setting]',
				'priority' => 36
			)
		);

		$wp_customize->add_section(
			'kohaku_layout_footer',
			array(
				'title' => __( 'Footer', 'kohaku' ),
				'priority' => 50,
				'panel' => 'kohaku_layout_panel'
			)
		);

		// Add footer setting
		$wp_customize->add_setting(
			'kohaku_settings[footer_layout_setting]',
			array(
				'default' => $defaults['footer_layout_setting'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_choices',
				'transport' => 'postMessage'
			)
		);

		// Add content control
		$wp_customize->add_control(
			'kohaku_settings[footer_layout_setting]',
			array(
				'type' => 'select',
				'label' => __( 'Footer Width', 'kohaku' ),
				'section' => 'kohaku_layout_footer',
				'choices' => array(
					'fluid-footer' => __( 'Full', 'kohaku' ),
					'contained-footer' => __( 'Contained', 'kohaku' )
				),
				'settings' => 'kohaku_settings[footer_layout_setting]',
				'priority' => 40
			)
		);

		// Add footer setting
		$wp_customize->add_setting(
			'kohaku_settings[footer_widgets_inner_width]',
			array(
				'default' => $defaults['footer_widgets_inner_width'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_choices',
			)
		);

		// Add content control
		$wp_customize->add_control(
			'kohaku_settings[footer_widgets_inner_width]',
			array(
				'type' => 'select',
				'label' => __( 'Inner Footer Widgets Width', 'kohaku' ),
				'section' => 'kohaku_layout_footer',
				'choices' => array(
					'contained' => __( 'Contained', 'kohaku' ),
					'full-width' => __( 'Full', 'kohaku' )
				),
				'settings' => 'kohaku_settings[footer_widgets_inner_width]',
				'priority' => 41
			)
		);

		// Add footer setting
		$wp_customize->add_setting(
			'kohaku_settings[footer_inner_width]',
			array(
				'default' => $defaults['footer_inner_width'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_choices',
				'transport' => 'postMessage'
			)
		);

		// Add content control
		$wp_customize->add_control(
			'kohaku_settings[footer_inner_width]',
			array(
				'type' => 'select',
				'label' => __( 'Inner Footer Width', 'kohaku' ),
				'section' => 'kohaku_layout_footer',
				'choices' => array(
					'contained' => __( 'Contained', 'kohaku' ),
					'full-width' => __( 'Full', 'kohaku' )
				),
				'settings' => 'kohaku_settings[footer_inner_width]',
				'priority' => 41
			)
		);

		// Add footer widget setting
		$wp_customize->add_setting(
			'kohaku_settings[footer_widget_setting]',
			array(
				'default' => $defaults['footer_widget_setting'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_choices',
				'transport' => 'postMessage'
			)
		);

		// Add footer widget control
		$wp_customize->add_control(
			'kohaku_settings[footer_widget_setting]',
			array(
				'type' => 'select',
				'label' => __( 'Footer Widgets', 'kohaku' ),
				'section' => 'kohaku_layout_footer',
				'choices' => array(
					'0' => '0',
					'1' => '1',
					'2' => '2',
					'3' => '3',
					'4' => '4',
					'5' => '5'
				),
				'settings' => 'kohaku_settings[footer_widget_setting]',
				'priority' => 45
			)
		);

		// Copyright
		$wp_customize->add_setting(
			'kohaku_settings[footer_copyright]',
			array(
				'default' => $defaults['footer_copyright'],
				'type' => 'option',
				'sanitize_callback' => 'wp_kses_post',
				'transport' => 'postMessage',
			)
		);

		$wp_customize->add_control(
			'kohaku_settings[footer_copyright]',
			array(
				'type' 		 => 'textarea',
				'label'      => __( 'Copyright', 'kohaku' ),
				'section'    => 'kohaku_layout_footer',
				'settings'   => 'kohaku_settings[footer_copyright]',
				'priority' => 50,
			)
		);

		// Add footer widget setting
		$wp_customize->add_setting(
			'kohaku_settings[footer_bar_alignment]',
			array(
				'default' => $defaults['footer_bar_alignment'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_choices',
				'transport' => 'postMessage'
			)
		);

		// Add footer widget control
		$wp_customize->add_control(
			'kohaku_settings[footer_bar_alignment]',
			array(
				'type' => 'select',
				'label' => __( 'Footer Bar Alignment', 'kohaku' ),
				'section' => 'kohaku_layout_footer',
				'choices' => array(
					'left' => __( 'Left','kohaku' ),
					'center' => __( 'Center','kohaku' ),
					'right' => __( 'Right','kohaku' )
				),
				'settings' => 'kohaku_settings[footer_bar_alignment]',
				'priority' => 47,
				'active_callback' => 'kohaku_is_footer_bar_active'
			)
		);

		// Add back to top setting
		$wp_customize->add_setting(
			'kohaku_settings[back_to_top]',
			array(
				'default' => $defaults['back_to_top'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_choices'
			)
		);

		// Add content control
		$wp_customize->add_control(
			'kohaku_settings[back_to_top]',
			array(
				'type' => 'select',
				'label' => __( 'Back to Top Button', 'kohaku' ),
				'section' => 'kohaku_layout_footer',
				'choices' => array(
					'enable' => __( 'Enable', 'kohaku' ),
					'' => __( 'Disable', 'kohaku' )
				),
				'settings' => 'kohaku_settings[back_to_top]',
				'priority' => 50
			)
		);

		// Add Layout section
		$wp_customize->add_section(
			'kohaku_blog_section',
			array(
				'title' => __( 'Blog', 'kohaku' ),
				'priority' => 55,
				'panel' => 'kohaku_layout_panel'
			)
		);

		$wp_customize->add_setting(
			'kohaku_settings[blog_header_image]',
			array(
				'default' => $defaults['blog_header_image'],
				'type' => 'option',
				'sanitize_callback' => 'esc_url_raw'
			)
		);

		$wp_customize->add_control(
			new WP_Customize_Image_Control(
				$wp_customize,
				'kohaku_settings[blog_header_image]',
				array(
					'label' => __( 'First Blog Header image', 'kohaku' ),
					'section' => 'kohaku_blog_section',
					'settings' => 'kohaku_settings[blog_header_image]',
					'description' => __( 'A standing image looks better. (Recommended size: 640*800px)', 'kohaku' )
				)
			)
		);

		$wp_customize->add_setting(
			'kohaku_settings[blog_header_image_2]',
			array(
				'default' => $defaults['blog_header_image_2'],
				'type' => 'option',
				'sanitize_callback' => 'esc_url_raw'
			)
		);

		$wp_customize->add_control(
			new WP_Customize_Image_Control(
				$wp_customize,
				'kohaku_settings[blog_header_image_2]',
				array(
					'label' => __( 'Second Blog Header image', 'kohaku' ),
					'section' => 'kohaku_blog_section',
					'settings' => 'kohaku_settings[blog_header_image_2]',
				)
			)
		);

		// Blog header texts
		$wp_customize->add_setting(
			'kohaku_settings[blog_header_title]',
			array(
				'default' => $defaults['blog_header_title'],
				'type' => 'option',
				'sanitize_callback' => 'wp_kses_post',
			)
		);

		$wp_customize->add_control(
			'kohaku_settings[blog_header_title]',
			array(
				'type' 		 => 'textarea',
				'label'      => __( 'Blog Header title', 'kohaku' ),
				'section'    => 'kohaku_blog_section',
				'settings'   => 'kohaku_settings[blog_header_title]',
			)
		);
		
		$wp_customize->add_setting(
			'kohaku_settings[blog_header_text]',
			array(
				'default' => $defaults['blog_header_text'],
				'type' => 'option',
				'sanitize_callback' => 'wp_kses_post',
			)
		);

		$wp_customize->add_control(
			'kohaku_settings[blog_header_text]',
			array(
				'type' 		 => 'textarea',
				'label'      => __( 'Blog Header text', 'kohaku' ),
				'section'    => 'kohaku_blog_section',
				'settings'   => 'kohaku_settings[blog_header_text]',
			)
		);
		
		$wp_customize->add_setting(
			'kohaku_settings[blog_header_button_text]',
			array(
				'default' => $defaults['blog_header_button_text'],
				'type' => 'option',
				'sanitize_callback' => 'esc_html',
			)
		);

		$wp_customize->add_control(
			'kohaku_settings[blog_header_button_text]',
			array(
				'type' 		 => 'text',
				'label'      => __( 'Blog Header button text', 'kohaku' ),
				'section'    => 'kohaku_blog_section',
				'settings'   => 'kohaku_settings[blog_header_button_text]',
			)
		);
		
		$wp_customize->add_setting(
			'kohaku_settings[blog_header_button_url]',
			array(
				'default' => $defaults['blog_header_button_url'],
				'type' => 'option',
				'sanitize_callback' => 'esc_url',
			)
		);

		$wp_customize->add_control(
			'kohaku_settings[blog_header_button_url]',
			array(
				'type' 		 => 'text',
				'label'      => __( 'Blog Header button url', 'kohaku' ),
				'section'    => 'kohaku_blog_section',
				'settings'   => 'kohaku_settings[blog_header_button_url]',
			)
		);

		// Add Layout setting
		$wp_customize->add_setting(
			'kohaku_settings[post_content]',
			array(
				'default' => $defaults['post_content'],
				'type' => 'option',
				'sanitize_callback' => 'kohaku_sanitize_blog_excerpt'
			)
		);

		// Add Layout control
		$wp_customize->add_control(
			'blog_content_control',
			array(
				'type' => 'select',
				'label' => __( 'Content Type', 'kohaku' ),
				'section' => 'kohaku_blog_section',
				'choices' => array(
					'full' => __( 'Full', 'kohaku' ),
					'excerpt' => __( 'Excerpt', 'kohaku' )
				),
				'settings' => 'kohaku_settings[post_content]',
				'priority' => 10
			)
		);

		if ( ! function_exists( 'kohaku_blog_customize_register' ) && ! defined( 'KOHAKU_PREMIUM_VERSION' ) ) {
			$wp_customize->add_control(
				new Kohaku_Customize_Misc_Control(
					$wp_customize,
					'blog_get_addon_desc',
					array(
						'section' => 'kohaku_blog_section',
						'type' => 'addon',
						'label' => __( 'Learn more', 'kohaku' ),
						'description' => __( 'More options are available for this section in our premium version.', 'kohaku' ),
						'url' => esc_url( KOHAKU_THEME_URL ),
						'priority' => 30,
						'settings' => ( isset( $wp_customize->selective_refresh ) ) ? array() : 'blogname'
					)
				)
			);
		}

		// Add Performance section
		$wp_customize->add_section(
			'kohaku_general_section',
			array(
				'title' => __( 'General', 'kohaku' ),
				'priority' => 99
			)
		);

		if ( ! apply_filters( 'kohaku_fontawesome_essentials', false ) ) {
			$wp_customize->add_setting(
				'kohaku_settings[font_awesome_essentials]',
				array(
					'default' => $defaults['font_awesome_essentials'],
					'type' => 'option',
					'sanitize_callback' => 'kohaku_sanitize_checkbox'
				)
			);

			$wp_customize->add_control(
				'kohaku_settings[font_awesome_essentials]',
				array(
					'type' => 'checkbox',
					'label' => __( 'Load essential icons only', 'kohaku' ),
					'description' => __( 'Load essential Font Awesome icons instead of the full library.', 'kohaku' ),
					'section' => 'kohaku_general_section',
					'settings' => 'kohaku_settings[font_awesome_essentials]',
				)
			);
		}

		// Add Kohaku Premium section
		if ( ! defined( 'KOHAKU_PREMIUM_VERSION' ) ) {
			$wp_customize->add_section(
				new Kohaku_Upsell_Section( $wp_customize, 'kohaku_upsell_section',
					array(
						'pro_text' => __( 'Get Premium for more!', 'kohaku' ),
						'pro_url' => esc_url( KOHAKU_THEME_URL ),
						'capability' => 'edit_theme_options',
						'priority' => 555,
						'type' => 'kohaku-upsell-section',
					)
				)
			);
		}
	}
}

if ( ! function_exists( 'kohaku_customizer_live_preview' ) ) {
	add_action( 'customize_preview_init', 'kohaku_customizer_live_preview', 100 );
	/**
	 * Add our live preview scripts
	 *
	 */
	function kohaku_customizer_live_preview() {
		wp_enqueue_script( 'kohaku-themecustomizer', trailingslashit( get_template_directory_uri() ) . 'inc/customizer/controls/js/customizer-live-preview.js', array( 'customize-preview' ), KOHAKU_VERSION, true );
	}
}

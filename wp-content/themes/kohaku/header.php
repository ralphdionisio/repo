<?php
/**
 * The template for displaying the header.
 *
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly.
}

?><!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
	<meta charset="<?php bloginfo( 'charset' ); ?>">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<link rel="profile" href="http://gmpg.org/xfn/11">
	<?php wp_head(); ?>
</head>

<body <?php kohaku_body_schema();?> <?php body_class(); ?>>
	<?php
	/**
	 * kohaku_before_header hook.
	 *
	 *
	 * @hooked kohaku_do_skip_to_content_link - 2
	 * @hooked kohaku_top_bar - 5
	 * @hooked kohaku_add_navigation_before_header - 5
	 */
	do_action( 'kohaku_before_header' );

	/**
	 * kohaku_header hook.
	 *
	 *
	 * @hooked kohaku_construct_header - 10
	 */
	do_action( 'kohaku_header' );

	/**
	 * kohaku_after_header hook.
	 *
	 *
	 * @hooked kohaku_featured_page_header - 10
	 */
	do_action( 'kohaku_after_header' );
	?>

	<div id="page" class="hfeed site grid-container container grid-parent">
		<div id="content" class="site-content">
			<?php
			/**
			 * kohaku_inside_container hook.
			 *
			 */
			do_action( 'kohaku_inside_container' );

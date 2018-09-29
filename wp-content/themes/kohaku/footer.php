<?php
/**
 * The template for displaying the footer.
 *
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly.
}
?>

	</div><!-- #content -->
</div><!-- #page -->

<?php
/**
 * kohaku_before_footer hook.
 *
 */
do_action( 'kohaku_before_footer' );
?>

<div <?php kohaku_footer_class(); ?>>
	<?php
	/**
	 * kohaku_before_footer_content hook.
	 *
	 */
	do_action( 'kohaku_before_footer_content' );

	/**
	 * kohaku_footer hook.
	 *
	 *
	 * @hooked kohaku_construct_footer_widgets - 5
	 * @hooked kohaku_construct_footer - 10
	 */
	do_action( 'kohaku_footer' );

	/**
	 * kohaku_after_footer_content hook.
	 *
	 */
	do_action( 'kohaku_after_footer_content' );
	?>
</div><!-- .site-footer -->

<?php
/**
 * kohaku_after_footer hook.
 *
 */
do_action( 'kohaku_after_footer' );

wp_footer();
?>

</body>
</html>

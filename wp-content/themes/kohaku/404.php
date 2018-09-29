<?php
/**
 * The template for displaying 404 pages (Not Found).
 *
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly.
}

get_header(); ?>

	<div id="primary" <?php kohaku_content_class(); ?>>
		<main id="main" <?php kohaku_main_class(); ?>>
			<?php
			/**
			 * kohaku_before_main_content hook.
			 *
			 */
			do_action( 'kohaku_before_main_content' );
			?>

			<div class="inside-article">

				<?php
				/**
				 * kohaku_before_content hook.
				 *
				 *
				 * @hooked kohaku_featured_page_header_inside_single - 10
				 */
				do_action( 'kohaku_before_content' );
				?>

				<header class="entry-header">
					<h1 class="entry-title" itemprop="headline"><?php echo apply_filters( 'kohaku_404_title', __( 'Oops! That page can&rsquo;t be found.', 'kohaku' ) ); // WPCS: XSS OK. ?></h1>
				</header><!-- .entry-header -->

				<?php
				/**
				 * kohaku_after_entry_header hook.
				 *
				 *
				 * @hooked kohaku_post_image - 10
				 */
				do_action( 'kohaku_after_entry_header' );
				?>

				<div class="entry-content" itemprop="text">
					<?php
					echo '<p>' . apply_filters( 'kohaku_404_text', __( 'It looks like nothing was found at this location. Maybe try searching?', 'kohaku' ) ) . '</p>'; // WPCS: XSS OK.

					get_search_form();
					?>
				</div><!-- .entry-content -->

				<?php
				/**
				 * kohaku_after_content hook.
				 *
				 */
				do_action( 'kohaku_after_content' );
				?>

			</div><!-- .inside-article -->

			<?php
			/**
			 * kohaku_after_main_content hook.
			 *
			 */
			do_action( 'kohaku_after_main_content' );
			?>
		</main><!-- #main -->
	</div><!-- #primary -->

	<?php
	/**
	 * kohaku_after_primary_content_area hook.
	 *
	 */
	 do_action( 'kohaku_after_primary_content_area' );

	 kohaku_construct_sidebars();

get_footer();

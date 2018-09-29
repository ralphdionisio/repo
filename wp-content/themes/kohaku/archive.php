<?php
/**
 * The template for displaying Archive pages.
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

			if ( have_posts() ) :

				/**
				 * kohaku_archive_title hook.
				 *
				 *
				 * @hooked kohaku_archive_title - 10
				 */
				do_action( 'kohaku_archive_title' );

				while ( have_posts() ) : the_post();

					/*
					 * Include the Post-Format-specific template for the content.
					 * If you want to override this in a child theme, then include a file
					 * called content-___.php (where ___ is the Post Format name) and that will be used instead.
					 */
					get_template_part( 'content', get_post_format() );

				endwhile;

				kohaku_content_nav( 'nav-below' );

			else :

				get_template_part( 'no-results', 'archive' );

			endif;

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

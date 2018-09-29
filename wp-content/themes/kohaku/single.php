<?php
/**
 * The Template for displaying all single posts.
 *
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly.
}

get_header(); ?>

	<div id="primary" <?php kohaku_content_class();?>>
		<main id="main" <?php kohaku_main_class(); ?>>
			<?php
			/**
			 * kohaku_before_main_content hook.
			 *
			 */
			do_action( 'kohaku_before_main_content' );

			while ( have_posts() ) : the_post();

				get_template_part( 'content', 'single' );

				// If comments are open or we have at least one comment, load up the comment template.
				if ( comments_open() || '0' != get_comments_number() ) :
					/**
					 * kohaku_before_comments_container hook.
					 *
					 */
					do_action( 'kohaku_before_comments_container' );
					?>

					<div class="comments-area">
						<?php comments_template(); ?>
					</div>

					<?php
				endif;

			endwhile;

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

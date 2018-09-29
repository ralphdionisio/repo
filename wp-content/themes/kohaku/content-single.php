<?php
/**
 * The template for displaying single posts.
 *
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly.
}
?>

<article id="post-<?php the_ID(); ?>" <?php post_class(); ?> <?php kohaku_article_schema( 'CreativeWork' ); ?>>
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
			<?php
			/**
			 * kohaku_before_entry_title hook.
			 *
			 */
			do_action( 'kohaku_before_entry_title' );

			if ( kohaku_show_title() ) {
				the_title( '<h1 class="entry-title" itemprop="headline">', '</h1>' );
			}

			/**
			 * kohaku_after_entry_title hook.
			 *
			 *
			 * @hooked kohaku_post_meta - 10
			 */
			do_action( 'kohaku_after_entry_title' );
			?>
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
			the_content();

			wp_link_pages( array(
				'before' => '<div class="page-links">' . __( 'Pages:', 'kohaku' ),
				'after'  => '</div>',
			) );
			?>
		</div><!-- .entry-content -->

		<?php
		/**
		 * kohaku_after_entry_content hook.
		 *
		 *
		 * @hooked kohaku_footer_meta - 10
		 */
		do_action( 'kohaku_after_entry_content' );

		/**
		 * kohaku_after_content hook.
		 *
		 */
		do_action( 'kohaku_after_content' );
		?>
	</div><!-- .inside-article -->
</article><!-- #post-## -->

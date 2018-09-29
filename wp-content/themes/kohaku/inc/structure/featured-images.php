<?php
/**
 * Featured image elements.
 *
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly.
}

if ( ! function_exists( 'kohaku_post_image' ) ) {
	add_action( 'kohaku_after_entry_header', 'kohaku_post_image' );
	/**
	 * Prints the Post Image to post excerpts
	 */
	function kohaku_post_image() {
		// If there's no featured image, return.
		if ( ! has_post_thumbnail() ) {
			return;
		}

		// If we're not on any single post/page or the 404 template, we must be showing excerpts.
		if ( ! is_singular() && ! is_404() ) {
			echo apply_filters( 'kohaku_featured_image_output', sprintf( // WPCS: XSS ok.
				'<div class="post-image">
					<a href="%1$s">
						%2$s
					</a>
				</div>',
				esc_url( get_permalink() ),
				get_the_post_thumbnail(
					get_the_ID(),
					apply_filters( 'kohaku_page_header_default_size', 'full' ),
					array(
						'itemprop' => 'image',
					)
				)
			) );
		}
	}
}

if ( ! function_exists( 'kohaku_featured_page_header_area' ) ) {
	/**
	 * Build the page header.
	 *
	 *
	 * @param string The featured image container class
	 */
	function kohaku_featured_page_header_area( $class ) {
		// Don't run the function unless we're on a page it applies to.
		if ( ! is_singular() ) {
			return;
		}

		// Don't run the function unless we have a post thumbnail.
		if ( ! has_post_thumbnail() ) {
			return;
		}
		?>
		<div class="<?php echo esc_attr( $class ); ?> grid-parent">
			<?php the_post_thumbnail(
				apply_filters( 'kohaku_page_header_default_size', 'full' ),
				array(
					'itemprop' => 'image',
				)
			); ?>
		</div>
		<?php
	}
}

if ( ! function_exists( 'kohaku_featured_page_header' ) ) {
	add_action( 'kohaku_after_header', 'kohaku_featured_page_header', 10 );
	/**
	 * Add page header above content.
	 *
	 */
	function kohaku_featured_page_header() {
		if ( function_exists( 'kohaku_page_header' ) ) {
			return;
		}

		if ( is_page() ) {
			kohaku_featured_page_header_area( 'page-header-image' );
		} 
	}
}

if ( ! function_exists( 'kohaku_blog_header_image' ) ) {
	add_action( 'kohaku_after_header', 'kohaku_blog_header_image', 11 );
	/**
	 * Add blog header above content.
	 *
	 */
	function kohaku_blog_header_image() {

		if ( ( is_front_page() && is_home() ) || ( is_home() ) ) { 
			$blog_header_image =  kohaku_get_setting( 'blog_header_image' ); 
			$blog_header_image_2 =  kohaku_get_setting( 'blog_header_image_2' ); 
			$blog_header_title =  kohaku_get_setting( 'blog_header_title' ); 
			$blog_header_text =  kohaku_get_setting( 'blog_header_text' ); 
			$blog_header_button_text =  kohaku_get_setting( 'blog_header_button_text' ); 
			$blog_header_button_url =  kohaku_get_setting( 'blog_header_button_url' ); 
			if ( $blog_header_image != '' ) { ?>
			<div class="page-header-image grid-parent page-header-blog">
                <img src="<?php echo esc_url($blog_header_image); ?>"  />
                <div class="page-header-blog-content-h">
                    <div class="page-header-blog-content grid-container">
                    <?php if ( ( $blog_header_title != '' ) || ( $blog_header_title != '' ) ) { ?>
                        <?php if ( $blog_header_title != '' ) { ?>
                        <h2><?php echo wp_kses_post( $blog_header_title ); ?></h2>
                        <?php } ?>
                        <?php if ( $blog_header_title != '' ) { ?>
                        <p><?php echo wp_kses_post( $blog_header_text ); ?></p>
                        <?php } ?>
                        <?php if ( $blog_header_button_text != '' ) { ?>
                        <a class="read-more button" href="<?php echo esc_url( $blog_header_button_url ); ?>"><?php echo esc_html( $blog_header_button_text ); ?></a>
                        <?php } ?>
                    <?php } ?>
                    </div>
                </div>
				<?php if ( $blog_header_image_2 != '' ) { ?>
                <div class="page-header-second-image grid-container">
                    <img src="<?php echo esc_url($blog_header_image_2); ?>"  />
                </div>
                <?php } ?>
			</div>
			<?php
			}
		}
	}
}

if ( ! function_exists( 'kohaku_featured_page_header_inside_single' ) ) {
	add_action( 'kohaku_before_content', 'kohaku_featured_page_header_inside_single', 10 );
	/**
	 * Add post header inside content.
	 * Only add to single post.
	 *
	 */
	function kohaku_featured_page_header_inside_single() {
		if ( function_exists( 'kohaku_page_header' ) ) {
			return;
		}

		if ( is_single() ) {
			kohaku_featured_page_header_area( 'page-header-image-single' );
		}
	}
}

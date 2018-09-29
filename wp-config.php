<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', 'usbw');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'Figwx%p+TT/X!2_b5J;r<>A.,$`es?k0hSjX5Eo>P{ew{R.O  GFvSsY;<tHai# ');
define('SECURE_AUTH_KEY',  't~[%uMv;:CLF!}8ALZoCXGN~(D49zZ($osuJ1[M]M;Reu~ R%muo;yW bHw#|+Cr');
define('LOGGED_IN_KEY',    'osJ$<=al}[6=PKpm7zeXR|aby7[571N;TwW5*=Z&9gm*:I-&ZK1>_G)[saf8UO5f');
define('NONCE_KEY',        'fjX#sn)a$v^b&M4D[MgaO|rj/1=L,OKbKvj0KiG!lhp`+jnQiZ&y(oaz&pq.=FOM');
define('AUTH_SALT',        '%RiLl+qQ)/bh[lNvqoQH}B8XtaC`R`~Ss5>6$teNy)(eU+ZDFf.zT<|Dg<?CoRL8');
define('SECURE_AUTH_SALT', ';;Y23O2%+Xv?a7@fx1j`8<k9}M1O2YaqPoWE~1c)9CO{PC#iV^hgQsuC|g!Jl|yL');
define('LOGGED_IN_SALT',   'o8kTU)%kYHO}si]$m~c[6&# j<Y1^TY|;L;oRrTh&&W!L73[#Nr26ea;$})n}-|_');
define('NONCE_SALT',       'a@ ~+exT-~C:Ml..JqjwHtTGL3sF;S-k%ti3EFBZ?4?~xfgm(EXzA+A:9KE^N0|p');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');

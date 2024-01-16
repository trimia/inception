<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('DBWP_NAME') );

/** Database username */
define( 'DB_USER', getenv('DBWP_USER') );

/** Database password */
define( 'DB_PASSWORD', getenv('DBWP_PWD') );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'dL=>L!Z-2 ~0tBBhUW:B4/~,+1wg%$#,Oi0@<wD]-DKh24~,V;:i[r9u!P+F5X^F');
define('SECURE_AUTH_KEY',  '&)&2wOZx=!$OXJjZ;r#h(-L7Q j9A_2N;0(p hS(K5W4:`]zYqDd% x+cE<+3Ov ');
define('LOGGED_IN_KEY',    'gV1<=~f|GM|_<Ex(avqzzvK<;H#qA67%pFWbbBbOui;=aL`m5lEL0`:(IZMFqG{)');
define('NONCE_KEY',        '3%6r2>fj~|ur Ld{=vWR<CB-t/VadvcHl/1/tQw>M+im^,V}m_uyY12+ pz+q> n');
define('AUTH_SALT',        '-0M5Il>hEp->YxH!?*t%R0a$8Rv?-$G;C,HfiCE $X>yk+1n0c+*+]#F55V_}glk');
define('SECURE_AUTH_SALT', 'z{]I6~{TQ||[ KPS%/}T2,F6gvr@m*_bp%N}g{W_-yTY[iS&xV,$zZWfrV+8fYt?');
define('LOGGED_IN_SALT',   'y`-1@?K1SrhX)N/9g5F*%H6`CevY1>W4SkDV)/jUtxI4re0}:7+|7DwG/u6,]<DC');
define('NONCE_SALT',       '5?t:,+edH`wi)xBc}bIO]-R5h-g%.bc{1&d8WzO0Y~$#DBNp~QH$|b9 Nv2<Eud0');
/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

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
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('SQL_DATABASE') );

/** Database username */
define( 'DB_USER', getenv('SQL_USER') );

/** Database password */
define( 'DB_PASSWORD', getenv('SQL_PASSWORD') );

/** Database hostname */
define( 'DB_HOST', 'mariadb:3306' );

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
define('AUTH_KEY',         '6 YZn553U(h!6JD9 QCo&I8&|oLIR?8A|^/,HVrpe%-tjQaP1&5o!J4]HLmyieOQ');
define('SECURE_AUTH_KEY',  '>{d^C(EM_6q/CT?MGJ!,++-/;9K-z9x8|zIHotmronK$tO6X#}*KgSe7#+P1gzGk');
define('LOGGED_IN_KEY',    'Yp1K~CxDC !X^CT+[dTm:nZguX}>n{Kd6S5.8Q*HlTs-1#=_r_;?f;I@{qQRLd::');
define('NONCE_KEY',        '+zY1c%LHl-.N3Di{MvIfRWJ5}o5+W1%/By>a DN-Z+Y|G`Z NkW}G~eO6<se.w.F');
define('AUTH_SALT',        '}pfW1Ia,|-&lCu+3ouxs9Nat-$HpyHns(JsU5mjCJTD,+`=-jtrLNWcSUXTrA(;N');
define('SECURE_AUTH_SALT', 'Ad|7+b!-(+ $EA<N941YG?]HYo6@VESi;)R^5_d{fzs]q[?P-X]v0,tp!::+NVmL');
define('LOGGED_IN_SALT',   'HyoKi&0v e+aE}MD:`2`K7|CW|89|ePSV4VN~3S{7A(E]N-<N6UFY^d]gbR+!Cyt');
define('NONCE_SALT',       'Kw[>O!MQm{|zXl[e:301W,1a[tu8dY3E|[;;7)bTl:n5`In5%p7-wg`}5,~|g|oE');
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
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */
/*
define( 'WP_SITEURL', 'https://lcalvie.42.fr/' );
define( 'WP_HOME', 'https://lcalvie.42.fr/' );
 */
/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

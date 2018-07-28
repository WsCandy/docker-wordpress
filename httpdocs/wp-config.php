<?php

	define( 'ADMIN_COOKIE_PATH', '/' );
	define( 'DB_HOST', $_SERVER['DB_HOST'] );
	define( 'DB_NAME', $_SERVER['DB_NAME'] );
	define( 'DB_USER', $_SERVER['DB_USER'] );
	define( 'DB_PASSWORD', $_SERVER['DB_PASSWORD'] );
	define( 'WP_CONTENT_DIR', __DIR__ . '/wp' );
	define( 'WP_CONTENT_URL', 'http://' . $_SERVER['HTTP_HOST'] . '/wp' );
	define( 'WP_DEFAULT_THEME', 'twentyseventeen' );
	define( 'WP_HOME', 'http://' . $_SERVER['HTTP_HOST'] );
	define( 'WP_SITEURL', 'http://' . $_SERVER['HTTP_HOST'] . '/wordpress' );
	define( 'EMPTY_TRASH_DAYS', 7 );
	define( 'WP_POST_REVISIONS', 5 );
	define( 'IMAGE_EDIT_OVERWRITE', true );
	define( 'DISALLOW_FILE_EDIT', true );
	define( 'WP_MEMORY_LIMIT', '64M' );
	define( 'DB_CHARSET', 'utf8' );
	define( 'DB_COLLATE', '' );

	set_time_limit( 120 );
	define( 'AUTH_KEY', 'put your unique phrase here' );
	define( 'SECURE_AUTH_KEY', 'put your unique phrase here' );
	define( 'LOGGED_IN_KEY', 'put your unique phrase here' );
	define( 'NONCE_KEY', 'put your unique phrase here' );
	define( 'AUTH_SALT', 'put your unique phrase here' );
	define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );
	define( 'LOGGED_IN_SALT', 'put your unique phrase here' );
	define( 'NONCE_SALT', 'put your unique phrase here' );

	$table_prefix = 'wp_';

	define( 'WPLANG', '' );

	define( 'WP_DEBUG', false );
	define( 'WP_DEBUG_LOG', true );

	define( 'WP_ALLOW_MULTISITE', false );
	define( 'MULTISITE', false );
	define( 'SUBDOMAIN_INSTALL', true );
	define( 'PATH_CURRENT_SITE', '/' );
	define( 'SITE_ID_CURRENT_SITE', 1 );
	define( 'BLOG_ID_CURRENT_SITE', 1 );
	define( 'DOMAIN_CURRENT_SITE', $_SERVER['HTTP_HOST'] );

	if ( ! defined( 'ABSPATH' ) ) {
		define( 'ABSPATH', dirname( __FILE__ ) . '/' );
	}

	require_once ABSPATH . 'wp-settings.php';
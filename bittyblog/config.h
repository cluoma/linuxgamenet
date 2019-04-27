//
//  config.h
//  bittyblog
//
//  Created by Colin Luoma on 2018-07-25.
//  Copyright © 2018 Colin Luoma. All rights reserved.
//
// Store global variables specific to your site here

#ifndef config_h
#define config_h

// Basic stuff
#define COPYRIGHT_OWNER "LinuxGameNetwork"
#define NAVBAR_TITLE "LinuxGameNetwork"
#define HTML_TITLE "Linux gaming news and reviews - LinuxGameNetwork"
#define DB_PATH "/home/colin/Documents/linuxgamenet/bittyblog.db"
#define IMAGE_PATH "/home/colin/Documents/linuxgamenet/www/images"
#define TEMPLATE_PATH "/home/colin/Documents/linuxgamenet/templates"

// Site Behaviour
#define POSTS_PER_PAGE 10     // How many blog posts should be shown per pagination

// Cache settings
#define USE_CACHE 0
#define CACHE_BUCKETS 5000
#define MAX_CACHE_BYTES 256000000
#define CACHE_TIMEOUT_SECONDS 60

#endif

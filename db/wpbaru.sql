/*
 Navicat Premium Data Transfer

 Source Server         : myaql57brew
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : wpbaru

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 07/01/2023 09:24:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for wp_actionscheduler_actions
-- ----------------------------
DROP TABLE IF EXISTS `wp_actionscheduler_actions`;
CREATE TABLE `wp_actionscheduler_actions` (
  `action_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `hook` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `scheduled_date_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `scheduled_date_local` datetime DEFAULT '0000-00-00 00:00:00',
  `args` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `schedule` longtext COLLATE utf8mb4_unicode_520_ci,
  `group_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `last_attempt_local` datetime DEFAULT '0000-00-00 00:00:00',
  `claim_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `extended_args` varchar(8000) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`action_id`),
  KEY `hook` (`hook`),
  KEY `status` (`status`),
  KEY `scheduled_date_gmt` (`scheduled_date_gmt`),
  KEY `args` (`args`),
  KEY `group_id` (`group_id`),
  KEY `last_attempt_gmt` (`last_attempt_gmt`),
  KEY `claim_id_status_scheduled_date_gmt` (`claim_id`,`status`,`scheduled_date_gmt`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of wp_actionscheduler_actions
-- ----------------------------
BEGIN;
INSERT INTO `wp_actionscheduler_actions` VALUES (51, 'action_scheduler/migration_hook', 'complete', '2023-01-05 07:10:28', '2023-01-05 07:10:28', '[]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1672902628;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1672902628;}', 2, 1, '2023-01-05 07:11:54', '2023-01-05 14:11:54', 0, NULL);
INSERT INTO `wp_actionscheduler_actions` VALUES (52, 'aioseo_cache_prune', 'complete', '2023-01-06 07:09:28', '2023-01-06 07:09:28', '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1672988968;s:18:\"\0*\0first_timestamp\";i:1672902564;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1672988968;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 1, 1, '2023-01-06 17:01:01', '2023-01-07 00:01:01', 0, NULL);
INSERT INTO `wp_actionscheduler_actions` VALUES (81, 'aioseo_image_sitemap_scan', 'pending', '2023-01-06 17:16:01', '2023-01-06 17:16:01', '[]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1673025361;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1673025361;}', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL);
INSERT INTO `wp_actionscheduler_actions` VALUES (82, 'aioseo_cache_prune', 'pending', '2023-01-07 17:01:01', '2023-01-07 17:01:01', '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1673110861;s:18:\"\0*\0first_timestamp\";i:1672902564;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1673110861;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL);
COMMIT;

-- ----------------------------
-- Table structure for wp_actionscheduler_claims
-- ----------------------------
DROP TABLE IF EXISTS `wp_actionscheduler_claims`;
CREATE TABLE `wp_actionscheduler_claims` (
  `claim_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date_created_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`claim_id`),
  KEY `date_created_gmt` (`date_created_gmt`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of wp_actionscheduler_claims
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wp_actionscheduler_groups
-- ----------------------------
DROP TABLE IF EXISTS `wp_actionscheduler_groups`;
CREATE TABLE `wp_actionscheduler_groups` (
  `group_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `slug` (`slug`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of wp_actionscheduler_groups
-- ----------------------------
BEGIN;
INSERT INTO `wp_actionscheduler_groups` VALUES (1, 'aioseo');
INSERT INTO `wp_actionscheduler_groups` VALUES (2, 'action-scheduler-migration');
COMMIT;

-- ----------------------------
-- Table structure for wp_actionscheduler_logs
-- ----------------------------
DROP TABLE IF EXISTS `wp_actionscheduler_logs`;
CREATE TABLE `wp_actionscheduler_logs` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action_id` bigint(20) unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `log_date_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `log_date_local` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`log_id`),
  KEY `action_id` (`action_id`),
  KEY `log_date_gmt` (`log_date_gmt`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of wp_actionscheduler_logs
-- ----------------------------
BEGIN;
INSERT INTO `wp_actionscheduler_logs` VALUES (6, 51, 'action created', '2023-01-05 07:09:28', '2023-01-05 07:09:28');
INSERT INTO `wp_actionscheduler_logs` VALUES (9, 52, 'action created', '2023-01-05 07:09:28', '2023-01-05 07:09:28');
INSERT INTO `wp_actionscheduler_logs` VALUES (21, 51, 'action started via WP Cron', '2023-01-05 07:11:54', '2023-01-05 07:11:54');
INSERT INTO `wp_actionscheduler_logs` VALUES (22, 51, 'action complete via WP Cron', '2023-01-05 07:11:54', '2023-01-05 07:11:54');
INSERT INTO `wp_actionscheduler_logs` VALUES (85, 81, 'action created', '2023-01-06 17:01:01', '2023-01-06 17:01:01');
INSERT INTO `wp_actionscheduler_logs` VALUES (87, 52, 'action started via WP Cron', '2023-01-06 17:01:01', '2023-01-06 17:01:01');
INSERT INTO `wp_actionscheduler_logs` VALUES (88, 52, 'action complete via WP Cron', '2023-01-06 17:01:01', '2023-01-06 17:01:01');
INSERT INTO `wp_actionscheduler_logs` VALUES (89, 82, 'action created', '2023-01-06 17:01:01', '2023-01-06 17:01:01');
COMMIT;

-- ----------------------------
-- Table structure for wp_aioseo_cache
-- ----------------------------
DROP TABLE IF EXISTS `wp_aioseo_cache`;
CREATE TABLE `wp_aioseo_cache` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(80) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `expiration` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ndx_aioseo_cache_key` (`key`),
  KEY `ndx_aioseo_cache_expiration` (`expiration`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of wp_aioseo_cache
-- ----------------------------
BEGIN;
INSERT INTO `wp_aioseo_cache` VALUES (3, 'admin_notifications_update', 'i:1673110861;', '2023-01-07 17:01:01', '2023-01-05 07:09:29', '2023-01-06 17:01:01');
INSERT INTO `wp_aioseo_cache` VALUES (4, 'admin_help_docs', 's:69504:\"{\"categories\":{\"getting-started\":\"Getting Started\",\"advanced-settings\":\"Advanced Settings\",\"display-settings\":\"Display Settings\",\"general-seo-topics\":\"General SEO Topics\",\"feature-manager\":\"Feature Manager\",\"installation\":\"Installation\"},\"docs\":{\"139798\":{\"title\":\"Checking Your SEO Using the SEO Preview\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/checking-your-seo-using-the-seo-preview\\/\",\"categories\":[\"facebook-settings\",\"post-page-settings\",\"seo-preview\",\"truseo\",\"twitter-settings\"]},\"136509\":{\"title\":\"aioseo_sitemap_lastmod_disable\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_sitemap_lastmod_disable\\/\",\"categories\":[\"filter-hooks\"]},\"135249\":{\"title\":\"aioseo_sitemap_rss\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_sitemap_rss\\/\",\"categories\":[\"developer-documentation\"]},\"133251\":{\"title\":\"aioseo_user_profile_tab_disable\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_user_profile_tab_disable\\/\",\"categories\":[\"filter-hooks\"]},\"131885\":{\"title\":\"Setting Web Page Schema Markup in Your Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-web-page-schema-markup-in-your-content\\/\",\"categories\":[\"schema-settings\"]},\"129515\":{\"title\":\"Editing the .htaccess file Using All in One SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/editing-the-htaccess-file-using-all-in-one-seo\\/\",\"categories\":[\"file-editor\"]},\"124292\":{\"title\":\"Using the Emojis in Titles and Descriptions\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/using-the-emojis-in-titles-and-descriptions\\/\",\"categories\":[\"facebook-settings\",\"post-page-settings\",\"search-appearance\",\"social-networks\",\"twitter-settings\"]},\"123164\":{\"title\":\"Google Permissions for the AIOSEO Google Search Console Integration\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/google-permissions-for-oauth\\/\",\"categories\":[\"google-search-console\",\"search-statistics\"]},\"112137\":{\"title\":\"Setting the Schema Type for Individual Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-the-schema-type-for-individual-content\\/\",\"categories\":[\"schema-settings\"]},\"112145\":{\"title\":\"Configuring the Schema Settings in All in One SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/configuring-the-schema-settings-in-all-in-one-seo\\/\",\"categories\":[\"schema-settings\"]},\"112153\":{\"title\":\"A Guide to Schema.org Markup for Rich Snippets\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/a-guide-to-schema-org-markup-for-rich-snippets\\/\",\"categories\":[\"schema-settings\"]},\"112438\":{\"title\":\"Creating Reusable Schema Templates in All in One SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/creating-reusable-schema-templates-in-all-in-one-seo\\/\",\"categories\":[\"schema-settings\"]},\"112428\":{\"title\":\"Creating Custom Schema Markup with All in One SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/creating-custom-schema-markup-with-all-in-one-seo\\/\",\"categories\":[\"schema-settings\"]},\"112889\":{\"title\":\"Setting Event Schema Markup in Your Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-event-schema-markup-in-your-content\\/\",\"categories\":[\"schema-settings\"]},\"112735\":{\"title\":\"Setting Dataset Schema Markup in Your Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-dataset-schema-markup-in-your-content\\/\",\"categories\":[\"schema-settings\"]},\"112711\":{\"title\":\"Setting Article Schema Markup in Your Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-article-schema-markup-in-your-content\\/\",\"categories\":[\"schema-settings\"]},\"112164\":{\"title\":\"Setting Course Schema Markup in Your Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-course-schema-markup-in-your-content\\/\",\"categories\":[\"schema-settings\"]},\"112933\":{\"title\":\"Setting Job Posting Schema Markup in Your Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-job-posting-schema-markup-in-your-content\\/\",\"categories\":[\"schema-settings\"]},\"112926\":{\"title\":\"Setting How-To Schema Markup in Your Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-how-to-schema-markup-in-your-content\\/\",\"categories\":[\"schema-settings\"]},\"112916\":{\"title\":\"Setting Fact Check Schema Markup in Your Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-fact-check-schema-markup-in-your-content\\/\",\"categories\":[\"schema-settings\"]},\"112727\":{\"title\":\"Setting Book Schema Markup in Your Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-book-schema-markup-in-your-content\\/\",\"categories\":[\"schema-settings\"]},\"112243\":{\"title\":\"Setting FAQ Schema Markup in Your Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-faq-page-schema-markup-in-your-content\\/\",\"categories\":[\"schema-settings\"]},\"112958\":{\"title\":\"Setting Service Schema Markup in Your Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-service-schema-markup-in-your-content\\/\",\"categories\":[\"schema-settings\"]},\"112949\":{\"title\":\"Setting Person Schema Markup in Your Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-person-schema-markup-in-your-content\\/\",\"categories\":[\"schema-settings\"]},\"112944\":{\"title\":\"Setting Music Schema Markup in Your Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-music-schema-markup-in-your-content\\/\",\"categories\":[\"schema-settings\"]},\"112941\":{\"title\":\"Setting Movie Schema Markup in Your Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-movie-schema-markup-in-your-content\\/\",\"categories\":[\"schema-settings\"]},\"112212\":{\"title\":\"Setting Recipe Schema Markup in Your Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-recipe-schema-markup-in-your-content\\/\",\"categories\":[\"schema-settings\"]},\"112962\":{\"title\":\"Setting Video Schema Markup in Your Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-video-schema-markup-in-your-content\\/\",\"categories\":[\"schema-settings\"]},\"112403\":{\"title\":\"Testing Your Schema in All in One SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/testing-your-schema-in-all-in-one-seo\\/\",\"categories\":[\"schema-settings\"]},\"112226\":{\"title\":\"Setting Software Application Schema Markup in Your Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-software-application-schema-markup-in-your-content\\/\",\"categories\":[\"schema-settings\"]},\"112197\":{\"title\":\"Setting Product Schema Markup in Your Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-product-schema-markup-in-your-content\\/\",\"categories\":[\"schema-settings\"]},\"119555\":{\"title\":\"How to Use the AIOSEO Feature Manager on a Multisite Network\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-use-the-aioseo-feature-manager-on-a-multisite-network\\/\",\"categories\":[\"feature-manager\",\"multisite-networks\"]},\"119550\":{\"title\":\"How to Reset the AIOSEO Site Settings on a Multisite Network\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-reset-the-aioseo-site-settings-on-a-multisite-network\\/\",\"categories\":[\"multisite-networks\",\"network-tools\"]},\"119543\":{\"title\":\"How to Backup and Restore AIOSEO Site Settings on a Multisite Network\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-backup-and-restore-aioseo-site-settings-on-a-multisite-network\\/\",\"categories\":[\"multisite-networks\",\"network-tools\"]},\"119531\":{\"title\":\"How to Import Settings from Other Plugins on a Multisite Network\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-import-settings-from-other-plugins-on-a-multisite-network\\/\",\"categories\":[\"multisite-networks\",\"network-tools\"]},\"119519\":{\"title\":\"How to Import and Export AIOSEO Settings and Meta Data on a Multisite Network\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-import-and-export-aioseo-settings-and-meta-data-on-a-multisite-network\\/\",\"categories\":[\"multisite-networks\",\"network-tools\"]},\"119497\":{\"title\":\"How to Add Your AIOSEO License Key on a WordPress Multisite Network\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-add-your-aioseo-license-key-on-a-wordpress-multisite-network\\/\",\"categories\":[\"multisite-networks\",\"network-settings\"]},\"111476\":{\"title\":\"Displaying a List of Locations on Your Site\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/displaying-a-list-of-locations-on-your-site\\/\",\"categories\":[\"content-blocks\",\"local-business-seo\"]},\"111473\":{\"title\":\"Displaying Your Business Location Information on Your Site\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/displaying-your-business-location-information-on-your-site\\/\",\"categories\":[\"content-blocks\",\"local-business-seo\"]},\"111459\":{\"title\":\"Displaying Opening Hours on Your Site\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/displaying-opening-hours-on-your-site\\/\",\"categories\":[\"content-blocks\",\"local-business-seo\"]},\"111455\":{\"title\":\"Adding a Map of Your Location to Your Site\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/adding-a-map-of-your-location-to-your-site\\/\",\"categories\":[\"content-blocks\",\"local-business-seo\"]},\"111450\":{\"title\":\"Adding Breadcrumbs to Your Site Using the AIOSEO Breadcrumbs Block\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/adding-breadcrumbs-to-your-site-using-the-aioseo-breadcrumbs-block\\/\",\"categories\":[\"breadcrumbs\",\"content-blocks\"]},\"109878\":{\"title\":\"Adding a Redirect When You Delete Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/adding-a-redirect-when-you-delete-content\\/\",\"categories\":[\"redirection-manager\"]},\"109829\":{\"title\":\"Redirecting 404 Content Not Found Using All in One SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/redirecting-404-content-not-found-using-all-in-one-seo\\/\",\"categories\":[\"redirection-manager\"]},\"109916\":{\"title\":\"Using the Image SEO Features in All in One SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/using-the-image-seo-features-in-all-in-one-seo\\/\",\"categories\":[\"image-seo\"]},\"104857\":{\"title\":\"Adding a Table of Contents to Your Site Using All in One SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/adding-a-table-of-contents-to-your-site-using-all-in-one-seo\\/\",\"categories\":[\"content-blocks\"]},\"104616\":{\"title\":\"Adding FAQs to Your Site Using All in One SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/adding-faqs-to-your-site-using-all-in-one-seo\\/\",\"categories\":[\"content-blocks\"]},\"104595\":{\"title\":\"Automatic Redirects When Changing the Post Slug\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/automatic-redirects-when-changing-the-post-slug\\/\",\"categories\":[\"redirection-manager\"]},\"103415\":{\"title\":\"Removing Published Date from Article Schema\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/removing-published-date-from-article-schema\\/\",\"categories\":[\"developer-documentation\"]},\"101250\":{\"title\":\"Outputting AIOSEO\'s data in the HEAD without using wp_head()\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/outputting-aioseos-data-in-the-head-without-using-wp_head\\/\",\"categories\":[\"developer-documentation\"]},\"100154\":{\"title\":\"Automatic Redirects When You Delete Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/automatic-redirects-when-you-delete-content\\/\",\"categories\":[\"redirection-manager\"]},\"98532\":{\"title\":\"Localizing AIOSEO Data via the Translations API\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/localizing-aioseo-data-via-the-translations-api\\/\",\"categories\":[\"developer-documentation\"]},\"98576\":{\"title\":\"aioseo_sitemap_term\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_sitemap_term\\/\",\"categories\":[\"developer-documentation\"]},\"98575\":{\"title\":\"aioseo_sitemap_post\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_sitemap_post\\/\",\"categories\":[\"developer-documentation\"]},\"98566\":{\"title\":\"aioseo_save_term\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_save_term\\/\",\"categories\":[\"developer-documentation\"]},\"98565\":{\"title\":\"aioseo_save_post\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_save_post\\/\",\"categories\":[\"developer-documentation\"]},\"98557\":{\"title\":\"aioseo_get_term\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_get_term\\/\",\"categories\":[\"developer-documentation\"]},\"98554\":{\"title\":\"aioseo_get_post\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_get_post\\/\",\"categories\":[\"developer-documentation\"]},\"93967\":{\"title\":\"Importing URLs into the XML Sitemap\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/importing-urls-into-the-xml-sitemap\\/\",\"categories\":[\"xml-sitemap\"]},\"93822\":{\"title\":\"How to Use Crawl Cleanup to Increase Search Engine Crawl Quota\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/crawl-cleanup-best-practices\\/\",\"categories\":[\"advanced-settings\"]},\"90584\":{\"title\":\"How to Add a Temporary Administrator Login to Your Site\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-add-a-temporary-administrator-login-to-your-site\\/\",\"categories\":[\"frequently-asked-questions\",\"troubleshooting\"]},\"88927\":{\"title\":\"Dashboard Widgets in All in One SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/dashboard-widgets-in-all-in-one-seo\\/\",\"categories\":[\"dashboard\"]},\"86198\":{\"title\":\"How to Strip the Category Base in WordPress\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-strip-the-category-base-in-wordpress\\/\",\"categories\":[\"category-tag-settings\"]},\"84322\":{\"title\":\"Running shortcodes in All in One SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/running-shortcodes\\/\",\"categories\":[\"advanced-settings\"]},\"84156\":{\"title\":\"Translating Your SEO with WPML\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/translating-your-seo-with-wpml\\/\",\"categories\":[\"post-page-settings\"]},\"80219\":{\"title\":\"How to Verify Your Site with Microsoft Clarity\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-verify-your-site-with-microsoft-clarity\\/\",\"categories\":[\"webmaster-tools\"]},\"79928\":{\"title\":\"How to Handle Issues With Installing All in One SEO Pro\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-handle-issues-with-installing-all-in-one-seo-pro\\/\",\"categories\":[\"installation\"]},\"79149\":{\"title\":\"Fetching &amp; Updating AIOSEO Data via the WordPress REST API\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/fetching-updating-aioseo-data-via-the-wordpress-rest-api\\/\",\"categories\":[\"developer-documentation\",\"rest-api\"]},\"77593\":{\"title\":\"How To Fix Javascript Errors\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-fix-javascript-errors\\/\",\"categories\":[\"troubleshooting\"]},\"77589\":{\"title\":\"Browser Support Policy\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/browser-support-policy\\/\",\"categories\":[\"frequently-asked-questions\"]},\"75143\":{\"title\":\"How to Redirect a Post from the Edit Post Screen\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-redirect-a-post-from-the-edit-post-screen\\/\",\"categories\":[\"post-page-settings\",\"redirection-manager\"]},\"75686\":{\"title\":\"Preventing the Modified Date for Content from Changing\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/preventing-the-modified-date-for-content-from-changing\\/\",\"categories\":[\"post-page-settings\"]},\"73002\":{\"title\":\"Page Builder Integrations\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/page-builder-integrations\\/\",\"categories\":[\"home-page-settings\",\"post-page-settings\",\"third-party-integrations\",\"truseo\"]},\"73003\":{\"title\":\"Integrating with IndexNow to Instantly Re-index Your Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/integrating-with-indexnow-to-instantly-re-index-your-content\\/\",\"categories\":[\"indexnow\",\"webmaster-tools\"]},\"72711\":{\"title\":\"aioseo_page_builder_integration_disable\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_page_builder_integration_disable\\/\",\"categories\":[\"filter-hooks\"]},\"68444\":{\"title\":\"An Introduction to Link Assistant \\u2014 The Easy Way to Manage Onsite Links\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/introduction-to-link-assistant\\/\",\"categories\":[\"link-assistant\"]},\"69559\":{\"title\":\"Using the Link Assistant in All in One SEO Pro\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/link-assistant\\/\",\"categories\":[\"link-assistant\"]},\"69594\":{\"title\":\"Internal Links in the Links Report in Link Assistant\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/internal-links-in-the-links-report-in-link-assistant\\/\",\"categories\":[\"link-assistant\"]},\"69596\":{\"title\":\"External Links in the Links Report in Link Assistant\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/external-links-in-the-links-report-in-link-assistant\\/\",\"categories\":[\"link-assistant\"]},\"69921\":{\"title\":\"Link Suggestions in the Links Report in Link Assistant\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/link-suggestions-in-the-links-report-in-link-assistant\\/\",\"categories\":[\"link-assistant\"]},\"69602\":{\"title\":\"Affiliate Links in the Links Report in Link Assistant\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/affiliate-links-in-the-links-report-in-link-assistant\\/\",\"categories\":[\"link-assistant\"]},\"69761\":{\"title\":\"Using the Domains Report in Link Assistant\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/using-the-domains-report-in-link-assistant\\/\",\"categories\":[\"link-assistant\"]},\"69770\":{\"title\":\"Link Assistant Settings\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/link-assistant-settings\\/\",\"categories\":[\"link-assistant\"]},\"68431\":{\"title\":\"aioseo_sitemap_images\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_sitemap_images\\/\",\"categories\":[\"filter-hooks\"]},\"66833\":{\"title\":\"Why Is N\\/A Displayed Instead of a Score For My Content?\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/why-is-na-displayed-instead-of-a-score-for-my-content\\/\",\"categories\":[\"frequently-asked-questions\",\"truseo\"]},\"18824\":{\"title\":\"Local Business SEO for a Single Location\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/local-business-seo-for-a-single-location\\/\",\"categories\":[\"local-business-seo\",\"schema-settings\"]},\"35828\":{\"title\":\"Local Business SEO for Multiple Locations\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/local-business-seo-for-multiple-locations\\/\",\"categories\":[\"local-business-seo\"]},\"58476\":{\"title\":\"aioseo_public_taxonomies\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_public_taxonomies\\/\",\"categories\":[\"filter-hooks\"]},\"58475\":{\"title\":\"aioseo_public_post_types\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_public_post_types\\/\",\"categories\":[\"filter-hooks\"]},\"64776\":{\"title\":\"How Long Does it Take For My Content to Appear on Google?\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-long-does-it-take-for-my-content-to-appear-on-google\\/\",\"categories\":[\"frequently-asked-questions\"]},\"35926\":{\"title\":\"Adding a Location in Local SEO Addon\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/adding-a-location-in-local-seo-addon\\/\",\"categories\":[\"local-business-seo\"]},\"61020\":{\"title\":\"How to Display a Favicon in Search Results\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-display-a-favicon-in-search-results\\/\",\"categories\":[\"frequently-asked-questions\",\"general-seo-topics\"]},\"35956\":{\"title\":\"Displaying Locations on Your Site\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/displaying-locations-on-your-site\\/\",\"categories\":[\"local-business-seo\"]},\"56330\":{\"title\":\"aioseo_sitemap_indexes\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_sitemap_indexes\\/\",\"categories\":[\"filter-hooks\"]},\"52689\":{\"title\":\"aioseo_flyout_menu_enable\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_flyout_menu_disable\\/\",\"categories\":[\"filter-hooks\"]},\"45698\":{\"title\":\"Displaying your Business Information and Star Ratings on a Map\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/using-places-on-your-maps\\/\",\"categories\":[\"local-business-seo\"]},\"49268\":{\"title\":\"aioseo_access_control_excluded_roles\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_access_control_excluded_roles\\/\",\"categories\":[\"filter-hooks\"]},\"44555\":{\"title\":\"Setting up Google Maps for Local SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-up-google-maps\\/\",\"categories\":[\"local-business-seo\"]},\"48189\":{\"title\":\"How to Create an HTML Sitemap\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/html-sitemap\\/\",\"categories\":[\"html-sitemap\"]},\"48365\":{\"title\":\"Using a Widget to Display Your HTML Sitemap\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/using-a-widget-to-display-your-html-sitemap\\/\",\"categories\":[\"html-sitemap\"]},\"48361\":{\"title\":\"Using PHP Code to Display Your HTML Sitemap\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/function-html-sitemap\\/\",\"categories\":[\"html-sitemap\"]},\"48260\":{\"title\":\"Using a Block to Display Your HTML Sitemap\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/using-a-block-to-display-your-html-sitemap\\/\",\"categories\":[\"content-blocks\",\"html-sitemap\"]},\"48222\":{\"title\":\"aioseo_breadcrumbs_separator_symbol\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_breadcrumbs_separator_symbol\\/\",\"categories\":[\"filter-hooks\"]},\"48227\":{\"title\":\"aioseo_breadcrumbs_template\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_breadcrumbs_template\\/\",\"categories\":[\"filter-hooks\"]},\"48231\":{\"title\":\"aioseo_breadcrumbs_trail\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_breadcrumbs_trail\\/\",\"categories\":[\"filter-hooks\"]},\"48232\":{\"title\":\"aioseo_breadcrumbs_link_current_item\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_breadcrumbs_link_current_item\\/\",\"categories\":[\"filter-hooks\"]},\"48233\":{\"title\":\"aioseo_breadcrumbs_show_current_item\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_breadcrumbs_show_current_item\\/\",\"categories\":[\"filter-hooks\"]},\"48219\":{\"title\":\"aioseo_breadcrumbs_output\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_breadcrumbs_output\\/\",\"categories\":[\"filter-hooks\"]},\"48223\":{\"title\":\"aioseo_breadcrumbs_separator\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_breadcrumbs_separator\\/\",\"categories\":[\"filter-hooks\"]},\"48238\":{\"title\":\"Using a Shortcode to Display Your HTML Sitemap\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/shortcode-html-sitemap\\/\",\"categories\":[\"html-sitemap\"]},\"45805\":{\"title\":\"aioseo_sitemap_exclude_terms\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_sitemap_exclude_terms\\/\",\"categories\":[\"filter-hooks\"]},\"45804\":{\"title\":\"aioseo_sitemap_exclude_posts\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_sitemap_exclude_posts\\/\",\"categories\":[\"filter-hooks\"]},\"61002\":{\"title\":\"How to Create a Google Maps API Key\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-create-a-google-maps-api-key\\/\",\"categories\":[\"local-business-seo\"]},\"45528\":{\"title\":\"aioseo_schema_output\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_schema_output\\/\",\"categories\":[\"filter-hooks\"]},\"42995\":{\"title\":\"Using the Headline Analyzer in All in One SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/using-the-headline-analyzer-in-all-in-one-seo\\/\",\"categories\":[\"headline-analyzer\"]},\"42683\":{\"title\":\"How to Perform a Full Site Redirect\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/full-site-redirects\\/\",\"categories\":[\"redirection-manager\"]},\"50988\":{\"title\":\"Displaying Maps on Your Site\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/displaying-maps-on-your-site\\/\",\"categories\":[\"local-business-seo\"]},\"42999\":{\"title\":\"How to Disable the Headline Analyzer\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-disable-the-headline-analyzer\\/\",\"categories\":[\"advanced-settings\",\"headline-analyzer\"]},\"42975\":{\"title\":\"Installing Addons for All in One SEO Pro\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/installing-addons-for-all-in-one-seo-pro\\/\",\"categories\":[\"installation\"]},\"42854\":{\"title\":\"Creating a Pass Through Redirect\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/creating-a-pass-through-redirect\\/\",\"categories\":[\"redirection-manager\"]},\"41800\":{\"title\":\"Using Custom Rules in the Redirection Manager\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/redirection-manager-custom-rules\\/\",\"categories\":[\"redirection-manager\"]},\"42224\":{\"title\":\"Resetting the Settings in All in One SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/resetting-the-settings-in-all-in-one-seo\\/\",\"categories\":[\"database-tools\"]},\"41884\":{\"title\":\"Setting the Site Name for Facebook\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-the-site-name-for-facebook\\/\",\"categories\":[\"facebook-settings\",\"social-networks\"]},\"41862\":{\"title\":\"How to Get Google to Display the Sitelinks Search Box\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-get-google-to-display-the-sitelinks-search-box\\/\",\"categories\":[\"schema-settings\"]},\"41851\":{\"title\":\"Setting the SEO Title and Description Format for the Search Results Page\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-the-seo-title-and-description-format-for-the-search-results-page\\/\",\"categories\":[\"content-type-settings\",\"search-appearance\"]},\"41811\":{\"title\":\"SEO Analysis Unable to Connect to Your Site\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/seo-analysis-unable-to-connect-to-your-site\\/\",\"categories\":[\"seo-analysis\",\"troubleshooting\"]},\"41280\":{\"title\":\"How to Renew Your AIOSEO License\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-renew-your-aioseo-license\\/\",\"categories\":[\"frequently-asked-questions\",\"getting-started\"]},\"41077\":{\"title\":\"Update WordPress: WordPress Versions Supported by AIOSEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/update-wordpress\\/\",\"categories\":[\"troubleshooting\"]},\"40587\":{\"title\":\"How to Open the Browser Error Console\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-open-the-browser-error-console\\/\",\"categories\":[\"troubleshooting\"]},\"40582\":{\"title\":\"How to Enable Debugging in WordPress\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-enable-debugging-in-wordpress\\/\",\"categories\":[\"troubleshooting\"]},\"40148\":{\"title\":\"What is TruSEO?\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/what-is-truseo\\/\",\"categories\":[\"frequently-asked-questions\",\"truseo\"]},\"39494\":{\"title\":\"Redirecting Attachment Pages\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/redirecting-attachment-pages\\/\",\"categories\":[\"media-settings\",\"search-appearance\"]},\"66310\":{\"title\":\"Selecting the Google Maps APIs to use with All in One SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/selecting-the-google-maps-apis-to-use-with-all-in-one-seo\\/\",\"categories\":[\"local-business-seo\"]},\"38915\":{\"title\":\"Setting Up and Using Breadcrumbs Templates\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-up-and-using-breadcrumbs-templates\\/\",\"categories\":[\"breadcrumbs\"]},\"38610\":{\"title\":\"Displaying Breadcrumbs On Your Site\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/displaying-breadcrumbs-on-your-site\\/\",\"categories\":[\"breadcrumbs\"]},\"36048\":{\"title\":\"Function: aioseo_breadcrumbs()\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/function-aioseo_breadcrumbs\\/\",\"categories\":[\"breadcrumbs\"]},\"36047\":{\"title\":\"Shortcode: [aioseo_breadcrumbs]\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/shortcode-aioseo_breadcrumbs\\/\",\"categories\":[\"breadcrumbs\"]},\"38240\":{\"title\":\"aioseo_social_image_ignore_cover_block\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_social_image_ignore_cover_block\\/\",\"categories\":[\"filter-hooks\"]},\"37961\":{\"title\":\"aioseo_classic_editor_disable_emoji_script\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_classic_editor_disable_emoji_script\\/\",\"categories\":[\"filter-hooks\"]},\"34923\":{\"title\":\"How to Redirect a Post or Page in All in One SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-redirect-a-post-or-page-in-all-in-one-seo\\/\",\"categories\":[\"redirection-manager\"]},\"34977\":{\"title\":\"How to Redirect Multiple URLs to the Same Destination\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-redirect-multiple-urls-to-the-same-destination\\/\",\"categories\":[\"redirection-manager\"]},\"35604\":{\"title\":\"Automatic Redirects When URLs Change in Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/automatic-redirects-when-urls-change-in-content\\/\",\"categories\":[\"redirection-manager\"]},\"31460\":{\"title\":\"Enhanced Search Query Conflict\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/enhanced-search-query-conflict\\/\",\"categories\":[\"local-business-seo\"]},\"30850\":{\"title\":\"aioseo_local_business_info_email_icon\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_local_business_info_email_icon\\/\",\"categories\":[\"filter-hooks\"]},\"30839\":{\"title\":\"aioseo_local_business_info_location_icon\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_local_business_info_location_icon\\/\",\"categories\":[\"filter-hooks\"]},\"30756\":{\"title\":\"aioseo_local_business_get_locations_by_category_posts\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_local_business_get_locations_by_category_posts\\/\",\"categories\":[\"filter-hooks\"]},\"30755\":{\"title\":\"aioseo_local_business_get_locations_by_category_args\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_local_business_get_locations_by_category_args\\/\",\"categories\":[\"filter-hooks\"]},\"30754\":{\"title\":\"aioseo_local_business_get_location_categories\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_local_business_get_location_categories\\/\",\"categories\":[\"filter-hooks\"]},\"30751\":{\"title\":\"aioseo_local_business_get_locations_posts\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_local_business_get_locations_posts\\/\",\"categories\":[\"filter-hooks\"]},\"30753\":{\"title\":\"aioseo_local_business_get_location_category_args\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_local_business_get_location_category_args\\/\",\"categories\":[\"filter-hooks\"]},\"30759\":{\"title\":\"aioseo_local_business_output_business_info_instance\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_local_business_output_business_info_instance\\/\",\"categories\":[\"filter-hooks\"]},\"30760\":{\"title\":\"aioseo_local_business_output_business_info_location_data\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_local_business_output_business_info_location_data\\/\",\"categories\":[\"filter-hooks\"]},\"30761\":{\"title\":\"aioseo_local_business_output_location_category_instance\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_local_business_output_location_category_instance\\/\",\"categories\":[\"filter-hooks\"]},\"30764\":{\"title\":\"aioseo_local_business_output_location_category_location_data\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_local_business_output_location_category_location_data\\/\",\"categories\":[\"filter-hooks\"]},\"30765\":{\"title\":\"aioseo_local_business_output_opening_hours_instance\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_local_business_output_opening_hours_instance\\/\",\"categories\":[\"filter-hooks\"]},\"30766\":{\"title\":\"aioseo_local_business_output_opening_hours_data\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_local_business_output_opening_hours_data\\/\",\"categories\":[\"filter-hooks\"]},\"30849\":{\"title\":\"aioseo_local_business_info_phone_icon\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_local_business_info_phone_icon\\/\",\"categories\":[\"filter-hooks\"]},\"30851\":{\"title\":\"aioseo_local_business_opening_hours_icon\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_local_business_opening_hours_icon\\/\",\"categories\":[\"filter-hooks\"]},\"30398\":{\"title\":\"aioseo_local_business_post_type_name\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_local_business_post_type_name\\/\",\"categories\":[\"filter-hooks\"]},\"30551\":{\"title\":\"aioseo_local_business_post_type_slug\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_local_business_post_type_slug\\/\",\"categories\":[\"filter-hooks\"]},\"30556\":{\"title\":\"aioseo_local_business_post_type_single_label\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_local_business_post_type_single_label\\/\",\"categories\":[\"filter-hooks\"]},\"30559\":{\"title\":\"aioseo_local_business_post_type_plural_label\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_local_business_post_type_plural_label\\/\",\"categories\":[\"filter-hooks\"]},\"30560\":{\"title\":\"aioseo_local_business_post_type\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_local_business_post_type\\/\",\"categories\":[\"filter-hooks\"]},\"30563\":{\"title\":\"aioseo_local_business_taxonomy_name\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_local_business_taxonomy_name\\/\",\"categories\":[\"filter-hooks\"]},\"30564\":{\"title\":\"aioseo_local_business_taxonomy_slug\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_local_business_taxonomy_slug\\/\",\"categories\":[\"filter-hooks\"]},\"35609\":{\"title\":\"Choosing Which Redirect Type to Use\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/choosing-which-redirect-type-to-use\\/\",\"categories\":[\"redirection-manager\"]},\"35599\":{\"title\":\"Importing Redirects From Other Plugins\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/importing-redirects-from-other-plugins\\/\",\"categories\":[\"redirection-manager\"]},\"35588\":{\"title\":\"Exporting and Importing Redirects\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/exporting-and-importing-redirects\\/\",\"categories\":[\"redirection-manager\"]},\"35579\":{\"title\":\"Logging 404 Errors in All in One SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/logging-404-errors-in-all-in-one-seo\\/\",\"categories\":[\"redirection-manager\"]},\"35552\":{\"title\":\"Logging Redirects in All in One SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/logging-redirects-in-all-in-one-seo\\/\",\"categories\":[\"redirection-manager\"]},\"35570\":{\"title\":\"Redirect GDPR Privacy Information\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/redirect-gdpr-privacy-information\\/\",\"categories\":[\"redirection-manager\"]},\"30863\":{\"title\":\"Local Business SEO - Template overrides\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/local-business-seo-template-overrides\\/\",\"categories\":[\"local-business-seo\"]},\"35133\":{\"title\":\"aioseo_twitter_tags\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_twitter_tags\\/\",\"categories\":[\"filter-hooks\"]},\"35132\":{\"title\":\"aioseo_facebook_tags\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_facebook_tags\\/\",\"categories\":[\"filter-hooks\"]},\"34993\":{\"title\":\"Ignoring Case Sensitivity in Redirects\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/ignoring-case-sensitivity-in-redirects\\/\",\"categories\":[\"redirection-manager\"]},\"34983\":{\"title\":\"Ignoring the Trailing Slash in Redirects\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/ignoring-the-trailing-slash-in-redirects\\/\",\"categories\":[\"redirection-manager\"]},\"36104\":{\"title\":\"Using Query Parameters With Redirects\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/using-query-parameters-with-redirects\\/\",\"categories\":[\"redirection-manager\"]},\"30565\":{\"title\":\"aioseo_local_business_taxonomy\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_local_business_taxonomy\\/\",\"categories\":[\"filter-hooks\"]},\"36115\":{\"title\":\"Caching of Redirects in the Browser\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/caching-of-redirects-in-the-browser\\/\",\"categories\":[\"redirection-manager\"]},\"34701\":{\"title\":\"Adding WooCommerce Product Attributes to SEO Title or Description\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/adding-woocommerce-product-attributes-to-seo-title-or-description\\/\",\"categories\":[\"post-page-settings\",\"search-appearance\",\"woocommerce\"]},\"36111\":{\"title\":\"Selecting the Redirect Method in Redirects\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/selecting-the-redirect-method-in-redirects\\/\",\"categories\":[\"redirection-manager\"]},\"40115\":{\"title\":\"Redirect Manager Cannot Detect Your Server\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/redirect-manager-unknown-web-server\\/\",\"categories\":[\"redirection-manager\"]},\"36369\":{\"title\":\"Using Regex in the Redirection Manager\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/redirect-manager-regex\\/\",\"categories\":[\"redirection-manager\"]},\"31442\":{\"title\":\"Shortcode: [aioseo_local_opening_hours]\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/shortcode-aioseo_local_opening_hours\\/\",\"categories\":[\"local-business-seo\"]},\"31443\":{\"title\":\"Shortcode: [aioseo_local_locations]\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/shortcode-aioseo_local_locations\\/\",\"categories\":[\"local-business-seo\"]},\"34179\":{\"title\":\"Using the Smart Tags in Titles and Descriptions\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/using-the-smart-tags-in-titles-and-descriptions\\/\",\"categories\":[\"post-page-settings\",\"search-appearance\"]},\"31441\":{\"title\":\"Shortcode: [aioseo_local_business_info]\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/shortcode-aioseo_local_business_info\\/\",\"categories\":[\"local-business-seo\"]},\"46122\":{\"title\":\"Shortcode: [aioseo_local_map]\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/shortcode-aioseo_local_map\\/\",\"categories\":[\"local-business-seo\"]},\"33507\":{\"title\":\"What\'s The Difference Between TruSEO and Page Analysis?\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/whats-the-difference-between-truseo-and-page-analysis\\/\",\"categories\":[\"frequently-asked-questions\",\"post-page-settings\",\"truseo\"]},\"33310\":{\"title\":\"Setting Noindex for RSS Feeds\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-noindex-for-rss-feeds\\/\",\"categories\":[\"advanced-settings\",\"search-appearance\"]},\"33130\":{\"title\":\"aioseo_disable_shortcode_parsing\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_disable_shortcode_parsing\\/\",\"categories\":[\"filter-hooks\"]},\"32085\":{\"title\":\"aioseo_conflicting_shortcodes\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_conflicting_shortcodes\\/\",\"categories\":[\"filter-hooks\"]},\"31992\":{\"title\":\"aioseo_schema_graphs\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_schema_graphs\\/\",\"categories\":[\"filter-hooks\"]},\"31589\":{\"title\":\"Understanding the TruSEO Page Analysis Recommendations\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/understanding-the-truseo-page-analysis-recommendations\\/\",\"categories\":[\"post-page-settings\",\"truseo\"]},\"31456\":{\"title\":\"Function: aioseo_local_locations()\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/function-aioseo_local_locations\\/\",\"categories\":[\"local-business-seo\"]},\"31455\":{\"title\":\"Function: aioseo_local_opening_hours()\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/function-aioseo_local_opening_hours\\/\",\"categories\":[\"local-business-seo\"]},\"31451\":{\"title\":\"Function: aioseo_local_business_info()\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/function-aioseo_local_business_info\\/\",\"categories\":[\"local-business-seo\"]},\"46123\":{\"title\":\"Function: aioseo_local_map()\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/function-aioseo_local_map\\/\",\"categories\":[\"local-business-seo\"]},\"31042\":{\"title\":\"Getting Keyphrase Suggestions From Semrush\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/getting-keyphrase-suggestions-from-semrush\\/\",\"categories\":[\"post-page-settings\",\"truseo\"]},\"30773\":{\"title\":\"aioseo_local_business_address_tag_value\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_local_business_address_tag_value\\/\",\"categories\":[\"filter-hooks\"]},\"30770\":{\"title\":\"aioseo_local_business_address_tags\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_local_business_address_tags\\/\",\"categories\":[\"filter-hooks\"]},\"30567\":{\"title\":\"aioseo_local_business_get_locations_args\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_local_business_get_locations_args\\/\",\"categories\":[\"filter-hooks\"]},\"30752\":{\"title\":\"aioseo_local_business_get_location\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_local_business_get_location\\/\",\"categories\":[\"filter-hooks\"]},\"30728\":{\"title\":\"Unable to Save Settings Due to Cloudflare Firewall Rules\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/unable-to-save-settings-due-to-cloudflare-firewall-rules\\/\",\"categories\":[\"troubleshooting\"]},\"30318\":{\"title\":\"aioseo_flush_output_buffer\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_flush_output_buffer\\/\",\"categories\":[\"filter-hooks\"]},\"18813\":{\"title\":\"Installing All in One SEO Pro\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/installing-all-in-one-seo-pro\\/\",\"categories\":[\"getting-started\",\"installation\"]},\"18973\":{\"title\":\"Beginners Guide for All in One SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/quick-start-guide\\/\",\"categories\":[\"getting-started\"]},\"18820\":{\"title\":\"Setting the SEO Title and Description for Your Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-the-seo-title-and-description-for-your-content\\/\",\"categories\":[\"getting-started\",\"post-page-settings\"]},\"18902\":{\"title\":\"How to Create an XML Sitemap\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-create-an-xml-sitemap\\/\",\"categories\":[\"getting-started\",\"xml-sitemap\"]},\"18859\":{\"title\":\"Beginners Guide to Social Networks Settings for Facebook\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/beginners-guide-to-social-networks-settings-for-facebook\\/\",\"categories\":[\"facebook-settings\",\"getting-started\",\"social-networks\"]},\"18857\":{\"title\":\"Beginners Guide to Social Networks Settings for Twitter\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/beginners-guide-to-social-networks-settings-for-twitter\\/\",\"categories\":[\"getting-started\",\"social-networks\",\"twitter-settings\"]},\"29991\":{\"title\":\"aioseo_disable_link_format\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_disable_link_format\\/\",\"categories\":[\"filter-hooks\"]},\"27841\":{\"title\":\"aioseo_thumbnail_size\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_thumbnail_size\\/\",\"categories\":[\"filter-hooks\"]},\"27844\":{\"title\":\"Displaying Additional Twitter Data for Written By and Reading Time\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/displaying-additional-twitter-data-for-written-by-and-reading-time\\/\",\"categories\":[\"social-networks\",\"twitter-settings\"]},\"27494\":{\"title\":\"aioseo_meta_views\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_meta_views\\/\",\"categories\":[\"filter-hooks\"]},\"27363\":{\"title\":\"Using the SEO Analysis Tool\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/using-the-seo-analysis-tool\\/\",\"categories\":[\"seo-analysis\"]},\"27272\":{\"title\":\"Importing Settings From Other Plugins\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/importing-settings-from-other-plugins\\/\",\"categories\":[\"importer-exporter\",\"seo-data-importer\"]},\"27268\":{\"title\":\"Backing Up and Restoring AIOSEO Settings\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/backing-up-and-restoring-aioseo-settings\\/\",\"categories\":[\"importer-exporter\"]},\"27259\":{\"title\":\"Importing and Exporting AIOSEO Settings and Meta Data\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/importing-and-exporting-aioseo-settings-and-meta-data\\/\",\"categories\":[\"importer-exporter\"]},\"26450\":{\"title\":\"Blank Title Formats Have Been Detected\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/blank-title-formats-detected\\/\",\"categories\":[\"troubleshooting\"]},\"25802\":{\"title\":\"aioseo_sitemap_additional_pages\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_sitemap_additional_pages\\/\",\"categories\":[\"filter-hooks\"]},\"24928\":{\"title\":\"Including Custom Fields in the TruSEO Page Analysis\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/including-custom-fields-in-the-seo-page-analysis\\/\",\"categories\":[\"content-type-settings\",\"search-appearance\",\"truseo\"]},\"24285\":{\"title\":\"aioseo_prev_link\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_prev_link\\/\",\"categories\":[\"filter-hooks\"]},\"24284\":{\"title\":\"aioseo_next_link\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_next_link\\/\",\"categories\":[\"filter-hooks\"]},\"23717\":{\"title\":\"aioseo_canonical_url\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_canonical_url\\/\",\"categories\":[\"filter-hooks\"]},\"23604\":{\"title\":\"aioseo_schema_breadcrumbs_home\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_schema_breadcrumbs_home\\/\",\"categories\":[\"filter-hooks\"]},\"23448\":{\"title\":\"aioseo_schema_disable\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_schema_disable\\/\",\"categories\":[\"filter-hooks\"]},\"23447\":{\"title\":\"aioseo_robots_meta\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_robots_meta\\/\",\"categories\":[\"filter-hooks\"]},\"23446\":{\"title\":\"aioseo_disable\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_disable\\/\",\"categories\":[\"filter-hooks\"]},\"23441\":{\"title\":\"aioseo_generate_descriptions_from_content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_generate_descriptions_from_content\\/\",\"categories\":[\"filter-hooks\"]},\"23438\":{\"title\":\"aioseo_disable_title_rewrites\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_disable_title_rewrites\\/\",\"categories\":[\"filter-hooks\"]},\"23437\":{\"title\":\"aioseo_post_metabox_priority\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_post_metabox_priority\\/\",\"categories\":[\"filter-hooks\"]},\"23436\":{\"title\":\"aioseo_show_seo_news\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_show_seo_news\\/\",\"categories\":[\"filter-hooks\"]},\"23433\":{\"title\":\"aioseo_show_in_admin_bar\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_show_in_admin_bar\\/\",\"categories\":[\"filter-hooks\"]},\"23423\":{\"title\":\"aioseo_keywords\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_keywords\\/\",\"categories\":[\"filter-hooks\"]},\"23350\":{\"title\":\"aioseo_title\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_title\\/\",\"categories\":[\"filter-hooks\"]},\"23351\":{\"title\":\"aioseo_description\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo_description\\/\",\"categories\":[\"filter-hooks\"]},\"23415\":{\"title\":\"Troubleshooting Action Scheduler issues with AIOSEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/troubleshooting-action-scheduler-issues\\/\",\"categories\":[\"troubleshooting\"]},\"20504\":{\"title\":\"Where Did my SEO Keywords go in All in One SEO v4.0?\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/where-did-my-seo-keywords-go-in-all-in-one-seo-v4-0\\/\",\"categories\":[\"advanced-settings\",\"frequently-asked-questions\",\"post-page-settings\",\"search-appearance\"]},\"18792\":{\"title\":\"Sitemap rewrite rules for NGINX\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/xml-sitemap-rewrite-rules-for-nginx\\/\",\"categories\":[\"rss-sitemap\",\"video-sitemap\",\"xml-sitemap\"]},\"18793\":{\"title\":\"Unfiltered HTML Capability is Required\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/unfiltered-html-capability\\/\",\"categories\":[\"troubleshooting\"]},\"18794\":{\"title\":\"Deprecated Open Graph Settings in All in One SEO version 4.0\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/deprecated-opengraph-settings\\/\",\"categories\":[\"social-networks\"]},\"18795\":{\"title\":\"Why does the character counter for SEO titles show a different count?\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/why-does-the-character-counter-for-seo-titles-show-a-different-count\\/\",\"categories\":[\"frequently-asked-questions\",\"post-page-settings\"]},\"18796\":{\"title\":\"Adding nofollow, sponsored, UGC and title attributes to links\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/adding-nofollow-sponsored-and-title-attributes-to-links\\/\",\"categories\":[\"post-page-settings\"]},\"18797\":{\"title\":\"Setting the SEO for WooCommerce Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-the-seo-for-woocommerce-content\\/\",\"categories\":[\"search-appearance\",\"woocommerce\"]},\"18798\":{\"title\":\"All in One SEO uses the WordPress REST API\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/aioseo-uses-rest-api\\/\",\"categories\":[\"frequently-asked-questions\"]},\"18799\":{\"title\":\"How to Remove All Settings and Data When you Uninstall All in One SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-remove-all-settings-and-data-when-you-uninstall-all-in-one-seo\\/\",\"categories\":[\"advanced-settings\",\"general-settings\"]},\"18800\":{\"title\":\"How to Disable TruSEO Content Analysis\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-disable-truseo-content-analysis\\/\",\"categories\":[\"advanced-settings\",\"general-settings\",\"truseo\"]},\"18801\":{\"title\":\"Enabling Automatic Updates for All in One SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/enabling-automatic-updates-for-all-in-one-seo\\/\",\"categories\":[\"advanced-settings\",\"general-settings\"]},\"18802\":{\"title\":\"Hiding Plugin Notifications in the Notifications Center\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/hiding-plugin-notifications-in-the-notifications-center\\/\",\"categories\":[\"advanced-settings\",\"general-settings\"]},\"18803\":{\"title\":\"How to Hide the AIOSEO Settings on the Edit Content Screens in WordPress\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-hide-the-aioseo-settings-on-the-edit-content-screens-in-wordpress\\/\",\"categories\":[\"advanced-settings\",\"content-type-settings\",\"post-page-settings\",\"search-appearance\"]},\"18804\":{\"title\":\"Setting Noindex and Nofollow on Paginated Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-noindex-and-nofollow-on-paginated-content\\/\",\"categories\":[\"advanced-settings\",\"search-appearance\"]},\"18805\":{\"title\":\"Setting Unique SEO Titles and Descriptions for Paginated Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-unique-seo-titles-and-descriptions-for-paginated-content\\/\",\"categories\":[\"advanced-settings\",\"search-appearance\"]},\"18806\":{\"title\":\"Setting the SEO Title and Description Format for Custom Post Type Archives\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-the-seo-title-and-description-format-for-custom-post-type-archives\\/\",\"categories\":[\"archive-settings\",\"search-appearance\"]},\"18807\":{\"title\":\"Keyword Settings\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/keyword-settings\\/\",\"categories\":[\"advanced-settings\",\"search-appearance\"]},\"18808\":{\"title\":\"Using the Quick Edit Feature in All in One SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/using-the-quick-edit-feature-in-all-in-one-seo\\/\",\"categories\":[\"post-page-settings\"]},\"18809\":{\"title\":\"How to FTP to your web server\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-ftp-to-your-web-server\\/\",\"categories\":[\"frequently-asked-questions\"]},\"18810\":{\"title\":\"How to manually install All in One SEO Pro when the file is too big\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-manually-install-all-in-one-seo-pro-when-the-file-is-too-big\\/\",\"categories\":[\"frequently-asked-questions\",\"installation\"]},\"18811\":{\"title\":\"How to Upgrade From All in One SEO Lite to Pro\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-upgrade-from-all-in-one-seo-lite-to-pro\\/\",\"categories\":[\"getting-started\",\"installation\"]},\"18812\":{\"title\":\"Installation instructions for WordPress.com Users\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/installation-instructions-for-wordpress-com-users\\/\",\"categories\":[\"installation\"]},\"18814\":{\"title\":\"Configuring the Twitter Settings for Your Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/configuring-the-twitter-settings-for-your-content\\/\",\"categories\":[\"post-page-settings\",\"social-networks\",\"twitter-settings\"]},\"18815\":{\"title\":\"Configuring the Facebook Settings for Your Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/configuring-the-facebook-settings-for-your-content\\/\",\"categories\":[\"facebook-settings\",\"post-page-settings\",\"social-networks\"]},\"18816\":{\"title\":\"Hiding the AIOSEO Column on Taxonomy Screens\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/hiding-the-aioseo-column-on-taxonomy-screens\\/\",\"categories\":[\"advanced-settings\",\"category-tag-settings\",\"general-settings\"]},\"18818\":{\"title\":\"Setting the Sitemap Priority and Frequency for Individual Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-the-sitemap-priority-and-frequency-for-individual-content\\/\",\"categories\":[\"post-page-settings\",\"xml-sitemap\"]},\"18819\":{\"title\":\"Setting the Robots Meta for Individual Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-the-robots-meta-for-individual-content\\/\",\"categories\":[\"post-page-settings\"]},\"18821\":{\"title\":\"Individual Post\\/Page Settings\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/post-settings\\/\",\"categories\":[\"post-page-settings\"]},\"18822\":{\"title\":\"Bad Bot Blocker\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/bad-bot-blocker\\/\",\"categories\":[\"bad-bot-blocker\"]},\"18823\":{\"title\":\"How to Fix a 404 Error When Viewing Your Sitemap\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-fix-a-404-error-when-viewing-your-sitemap\\/\",\"categories\":[\"frequently-asked-questions\",\"google-news-sitemap\",\"rss-sitemap\",\"troubleshooting\",\"video-sitemap\",\"xml-sitemap\"]},\"18825\":{\"title\":\"When to use NOINDEX or the robots.txt?\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/when-to-use-noindex-or-the-robots-txt\\/\",\"categories\":[\"frequently-asked-questions\",\"robots-txt\",\"search-appearance\"]},\"18826\":{\"title\":\"Support for Videos Embedded Using the Media Library\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/support-for-videos-embedded-using-the-media-library\\/\",\"categories\":[\"video-sitemap\"]},\"18827\":{\"title\":\"Supported Videos\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/supported-videos\\/\",\"categories\":[\"video-sitemap\"]},\"18828\":{\"title\":\"Performance Settings\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/performance-settings\\/\",\"categories\":[\"performance\"]},\"18830\":{\"title\":\"Setting the SEO Title and Description Format for Author and Date Archives\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-the-seo-title-and-description-format-for-author-and-date-archives\\/\",\"categories\":[\"archive-settings\",\"search-appearance\"]},\"18831\":{\"title\":\"Custom Fields in Titles and Descriptions\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/custom-fields-in-titles-and-descriptions\\/\",\"categories\":[\"content-type-settings\",\"post-page-settings\",\"search-appearance\"]},\"18832\":{\"title\":\"Using the Focus Keyphrase to Analyze Your Content\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/using-the-focus-keyphrase-to-analyze-your-content\\/\",\"categories\":[\"frequently-asked-questions\",\"post-page-settings\",\"truseo\"]},\"18833\":{\"title\":\"Using the Robots.txt Tool in All in One SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/using-the-robots-txt-tool-in-all-in-one-seo\\/\",\"categories\":[\"robots-txt\"]},\"18834\":{\"title\":\"Using the Robots Meta Settings in All in One SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/using-the-robots-meta-settings-in-all-in-one-seo\\/\",\"categories\":[\"advanced-settings\",\"archive-settings\",\"category-tag-settings\",\"content-type-settings\",\"media-settings\",\"post-page-settings\",\"search-appearance\",\"taxonomy-settings\"]},\"18835\":{\"title\":\"Noindex Settings in All in One SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/noindex-settings\\/\",\"categories\":[\"search-appearance\"]},\"18838\":{\"title\":\"Hiding the AIOSEO Admin Bar Menu\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/hiding-the-aioseo-admin-bar-menu\\/\",\"categories\":[\"advanced-settings\",\"general-settings\"]},\"18839\":{\"title\":\"Hiding the AIOSEO Dashboard Widgets\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/hiding-the-aioseo-dashboard-widget\\/\",\"categories\":[\"advanced-settings\",\"general-settings\"]},\"18840\":{\"title\":\"Hiding the AIOSEO Column on All Posts Screens\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/hiding-the-aioseo-column-on-all-posts-screens\\/\",\"categories\":[\"advanced-settings\",\"general-settings\"]},\"18841\":{\"title\":\"Display Settings\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/display-settings\\/\",\"categories\":[\"display-settings\"]},\"18842\":{\"title\":\"Setting the SEO Title and Description Format for Media Attachments\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-the-seo-title-and-description-format-for-media-attachments\\/\",\"categories\":[\"media-settings\",\"search-appearance\"]},\"18843\":{\"title\":\"Showing or Hiding Your Content in Search Results\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/showing-or-hiding-your-content-in-search-results\\/\",\"categories\":[\"archive-settings\",\"category-tag-settings\",\"content-type-settings\",\"media-settings\",\"post-page-settings\",\"search-appearance\",\"taxonomy-settings\"]},\"18844\":{\"title\":\"Content Type Settings\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/custom-post-type-settings\\/\",\"categories\":[\"content-type-settings\",\"search-appearance\"]},\"18845\":{\"title\":\"What Are Media Attachments and Should I Submit Them to Search Engines?\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/what-are-media-attachments-and-should-i-submit-them-to-search-engines\\/\",\"categories\":[\"frequently-asked-questions\",\"media-settings\"]},\"18846\":{\"title\":\"Setting the SEO Title and Description Format for Custom Taxonomies\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-the-seo-title-and-description-format-for-custom-taxonomies\\/\",\"categories\":[\"category-tag-settings\",\"search-appearance\",\"taxonomy-settings\"]},\"18847\":{\"title\":\"Setting the SEO Title and Description Format for Custom Post Types\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-the-seo-title-and-description-format-for-custom-post-types\\/\",\"categories\":[\"content-type-settings\",\"search-appearance\"]},\"18848\":{\"title\":\"Setting the SEO Title and Description Format for Tags\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-the-seo-title-and-description-format-for-tags\\/\",\"categories\":[\"category-tag-settings\",\"search-appearance\",\"taxonomy-settings\"]},\"18849\":{\"title\":\"Setting the SEO Title and Description Format for Categories\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-the-seo-title-and-description-format-for-categories\\/\",\"categories\":[\"category-tag-settings\",\"search-appearance\",\"taxonomy-settings\"]},\"18850\":{\"title\":\"Setting the SEO Title and Description Format for Pages\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-the-seo-title-and-description-format-for-pages\\/\",\"categories\":[\"content-type-settings\",\"post-page-settings\",\"search-appearance\"]},\"18851\":{\"title\":\"Setting the SEO Title and Description Format for Posts\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-the-seo-title-and-description-format-for-posts\\/\",\"categories\":[\"content-type-settings\",\"post-page-settings\",\"search-appearance\"]},\"18852\":{\"title\":\"Title Settings\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/title-settings\\/\",\"categories\":[\"search-appearance\"]},\"18853\":{\"title\":\"Setting the SEO for Your Home Page\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-the-seo-for-your-home-page\\/\",\"categories\":[\"home-page-settings\",\"search-appearance\"]},\"18854\":{\"title\":\"General Settings\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/general-settings\\/\",\"categories\":[\"general-settings\"]},\"18855\":{\"title\":\"How to Add Your License Key in All in One SEO Pro\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-add-your-license-key-in-all-in-one-seo-pro\\/\",\"categories\":[\"general-settings\",\"getting-started\"]},\"18856\":{\"title\":\"Canonical URLs in All in One SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/canonical-urls-in-all-in-one-seo\\/\",\"categories\":[\"advanced-settings\",\"search-appearance\"]},\"18858\":{\"title\":\"Adding non-WordPress Content to the Video Sitemap\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/adding-non-wordpress-content-to-the-video-sitemap\\/\",\"categories\":[\"video-sitemap\"]},\"18860\":{\"title\":\"Troubleshooting Problems With Sharing Content on Twitter\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/troubleshooting-problems-with-sharing-content-on-twitter\\/\",\"categories\":[\"social-networks\",\"troubleshooting\",\"twitter-settings\"]},\"18861\":{\"title\":\"Troubleshooting Problems With Sharing Content on Facebook\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/troubleshooting-problems-with-sharing-content-on-facebook\\/\",\"categories\":[\"facebook-settings\",\"social-networks\",\"troubleshooting\"]},\"18862\":{\"title\":\"Getting Started With Pinterest Rich Pins\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/using-social-meta-for-pinterest-rich-pins\\/\",\"categories\":[\"pinterest-settings\",\"social-networks\"]},\"18863\":{\"title\":\"Setting the Content Publisher for Twitter\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-the-content-publisher-for-twitter\\/\",\"categories\":[\"social-networks\",\"twitter-settings\"]},\"18865\":{\"title\":\"Submitting a Sitemap to Yandex\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/submitting-a-sitemap-to-yandex\\/\",\"categories\":[\"rss-sitemap\",\"video-sitemap\",\"xml-sitemap\"]},\"18866\":{\"title\":\"Submitting a Sitemap to Bing\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/submitting-a-sitemap-to-bing\\/\",\"categories\":[\"bing-webmaster-tools\",\"rss-sitemap\",\"video-sitemap\",\"xml-sitemap\"]},\"18867\":{\"title\":\"Submitting a Sitemap to Google\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/submitting-a-sitemap-to-google\\/\",\"categories\":[\"google-news-sitemap\",\"google-search-console\",\"rss-sitemap\",\"video-sitemap\",\"xml-sitemap\"]},\"18868\":{\"title\":\"Including Date and Author Archives in Your XML Sitemap\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/including-date-and-author-archives-in-your-xml-sitemap\\/\",\"categories\":[\"xml-sitemap\"]},\"18869\":{\"title\":\"Choosing Which Content to Include in Your Video Sitemap\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/choosing-which-content-to-include-in-your-video-sitemap\\/\",\"categories\":[\"video-sitemap\"]},\"18870\":{\"title\":\"Choosing Which Content to Include in Your XML Sitemap\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/choosing-which-content-to-include-in-your-xml-sitemap\\/\",\"categories\":[\"xml-sitemap\"]},\"18871\":{\"title\":\"Using Sitemap Indexes and Pagination\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/using-sitemap-indexes-and-pagination\\/\",\"categories\":[\"video-sitemap\",\"xml-sitemap\"]},\"18872\":{\"title\":\"How to Disable Sitemaps in All in One SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-disable-sitemaps-in-all-in-one-seo\\/\",\"categories\":[\"google-news-sitemap\",\"rss-sitemap\",\"video-sitemap\",\"xml-sitemap\"]},\"18873\":{\"title\":\"Baidu Webmaster Tools Verification\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/baidu-webmaster-tools-verification\\/\",\"categories\":[\"webmaster-tools\",\"webmaster-verification\"]},\"18874\":{\"title\":\"Setting Twitter Social Meta for Your Homepage\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-twitter-social-meta-for-your-homepage\\/\",\"categories\":[\"home-page-settings\",\"social-networks\",\"twitter-settings\"]},\"18875\":{\"title\":\"Setting Facebook Social Meta for Your Homepage\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-facebook-social-meta-for-your-homepage\\/\",\"categories\":[\"facebook-settings\",\"home-page-settings\",\"social-networks\"]},\"18876\":{\"title\":\"Setting the Card Type for Twitter\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-the-card-type-for-twitter\\/\",\"categories\":[\"social-networks\",\"twitter-settings\"]},\"18877\":{\"title\":\"Setting the Object Types for Facebook\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-the-object-types-for-facebook\\/\",\"categories\":[\"facebook-settings\",\"social-networks\"]},\"18879\":{\"title\":\"Setting the Priority and Frequency for Content in the Video Sitemap\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-the-priority-and-frequency-for-content-in-the-video-sitemap\\/\",\"categories\":[\"video-sitemap\"]},\"18880\":{\"title\":\"Setting the Priority and Frequency for Content in the XML Sitemap\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-the-priority-and-frequency-for-content-in-the-xml-sitemap\\/\",\"categories\":[\"xml-sitemap\"]},\"18881\":{\"title\":\"How to Exclude Content from Your RSS Sitemap\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-exclude-content-from-your-rss-sitemap\\/\",\"categories\":[\"rss-sitemap\"]},\"18882\":{\"title\":\"How to Exclude Content from Your Google News Sitemap\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-exclude-content-from-your-google-news-sitemap\\/\",\"categories\":[\"google-news-sitemap\"]},\"18883\":{\"title\":\"How to Exclude Content from Your Video Sitemap\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-exclude-content-from-your-video-sitemap\\/\",\"categories\":[\"video-sitemap\"]},\"18884\":{\"title\":\"How to Exclude Content from Your XML Sitemap\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-exclude-content-from-your-xml-sitemap\\/\",\"categories\":[\"xml-sitemap\"]},\"18885\":{\"title\":\"Setting Article Tags for Facebook\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-article-tags-for-facebook\\/\",\"categories\":[\"facebook-settings\",\"social-networks\"]},\"18886\":{\"title\":\"Setting the Content Author for Twitter\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-the-content-author-for-twitter\\/\",\"categories\":[\"social-networks\",\"twitter-settings\"]},\"18887\":{\"title\":\"Setting the Content Author for Facebook\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-the-content-author-for-facebook\\/\",\"categories\":[\"facebook-settings\",\"social-networks\"]},\"18888\":{\"title\":\"Setting the Content Publisher for Facebook\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-the-content-publisher-for-facebook\\/\",\"categories\":[\"facebook-settings\",\"social-networks\"]},\"18889\":{\"title\":\"How to Create a Google News Sitemap\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-create-a-google-news-sitemap\\/\",\"categories\":[\"google-news-sitemap\"]},\"18890\":{\"title\":\"Including Videos in Custom Fields in Your Video Sitemap\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/including-videos-in-custom-fields-in-your-video-sitemap\\/\",\"categories\":[\"video-sitemap\"]},\"18891\":{\"title\":\"What is a Dynamically Generated Sitemap and Why is it Better to Use?\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/what-is-a-dynamically-generated-sitemap-and-why-is-it-better-to-use\\/\",\"categories\":[\"frequently-asked-questions\",\"video-sitemap\",\"xml-sitemap\"]},\"18892\":{\"title\":\"How to Create a Video Sitemap\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-create-a-video-sitemap\\/\",\"categories\":[\"video-sitemap\"]},\"18893\":{\"title\":\"Adding Your Facebook Admin ID\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/adding-your-facebook-admin-id\\/\",\"categories\":[\"facebook-settings\",\"social-networks\"]},\"18894\":{\"title\":\"Adding Your Facebook App ID\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/adding-your-facebook-app-id\\/\",\"categories\":[\"facebook-settings\",\"social-networks\"]},\"18895\":{\"title\":\"Access Control Settings\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/access-control-settings\\/\",\"categories\":[\"access-control-settings\"]},\"18896\":{\"title\":\"Advanced Settings for Google Analytics\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/advanced-settings-for-google-analytics\\/\",\"categories\":[\"google-analytics\"]},\"18897\":{\"title\":\"Miscellaneous Site Verification\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/miscellaneous-site-verification\\/\",\"categories\":[\"webmaster-tools\",\"webmaster-verification\"]},\"18898\":{\"title\":\"Displaying Your Social Media Profiles in Knowledge Panel\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/displaying-your-social-media-profiles-in-knowledge-panel\\/\",\"categories\":[\"schema-settings\",\"social-networks\"]},\"18899\":{\"title\":\"How to Create an RSS Sitemap\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-create-an-rss-sitemap\\/\",\"categories\":[\"rss-sitemap\"]},\"18900\":{\"title\":\"Excluding Images from the XML Sitemap\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/excluding-images-from-the-xml-sitemap\\/\",\"categories\":[\"xml-sitemap\"]},\"18901\":{\"title\":\"Adding non-WordPress Content to the XML Sitemap\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/adding-non-wordpress-content-to-the-xml-sitemap\\/\",\"categories\":[\"xml-sitemap\"]},\"18903\":{\"title\":\"Setting a Default Image for Twitter\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-a-default-image-for-twitter\\/\",\"categories\":[\"social-networks\",\"twitter-settings\"]},\"18904\":{\"title\":\"Setting a Default Image for Facebook\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-a-default-image-for-facebook\\/\",\"categories\":[\"facebook-settings\",\"social-networks\"]},\"18905\":{\"title\":\"Setting a Title Separator\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-a-title-separator\\/\",\"categories\":[\"search-appearance\"]},\"18906\":{\"title\":\"How to Protect Your Content With RSS Content Settings\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-protect-your-content-with-rss-content-settings\\/\",\"categories\":[\"rss-content-settings\"]},\"18907\":{\"title\":\"How to Connect Your Site with Google Tag Manager\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-connect-your-site-with-google-tag-manager\\/\",\"categories\":[\"google-analytics\"]},\"18908\":{\"title\":\"How to Connect Your Site with Google Analytics\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-connect-your-site-with-google-analytics\\/\",\"categories\":[\"google-analytics\"]},\"18909\":{\"title\":\"How to Verify Your Site with Pinterest\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-verify-your-site-with-pinterest\\/\",\"categories\":[\"pinterest-settings\",\"social-networks\",\"webmaster-tools\",\"webmaster-verification\"]},\"18910\":{\"title\":\"How to Verify Your Site with Yandex Webmaster Tools\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-verify-your-site-with-yandex-webmaster-tools\\/\",\"categories\":[\"webmaster-tools\",\"webmaster-verification\"]},\"18911\":{\"title\":\"How to Verify Your Site with Bing Webmaster Tools\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-verify-your-site-with-bing-webmaster-tools\\/\",\"categories\":[\"bing-webmaster-tools\",\"webmaster-tools\",\"webmaster-verification\"]},\"18912\":{\"title\":\"How to Verify Your Site with Google Search Console\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-verify-your-site-with-google-search-console\\/\",\"categories\":[\"google-search-console\",\"webmaster-tools\",\"webmaster-verification\"]},\"18913\":{\"title\":\"Usage Tracking\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/usage-tracking\\/\",\"categories\":[\"frequently-asked-questions\"]},\"18915\":{\"title\":\"How do I use All in One SEO in my language?\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-do-i-use-all-in-one-seo-in-my-language\\/\",\"categories\":[\"frequently-asked-questions\"]},\"18920\":{\"title\":\"NGINX rewrite rules for Robots.txt\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/nginx-rewrite-rules-for-robots-txt\\/\",\"categories\":[\"robots-txt\"]},\"18927\":{\"title\":\"Supported PHP Versions for All in One SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/supported-php-version\\/\",\"categories\":[\"troubleshooting\"]},\"18929\":{\"title\":\"Using a different CDN for script enqueuing\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/using-a-different-cdn-for-script-enqueuing\\/\",\"categories\":[\"troubleshooting\"]},\"18930\":{\"title\":\"How do I get Google to show sitelinks for my site?\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-do-i-get-google-to-show-sitelinks-for-my-site\\/\",\"categories\":[\"frequently-asked-questions\"]},\"18954\":{\"title\":\"How does the import process for SEO data work?\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-does-the-import-process-for-seo-data-work\\/\",\"categories\":[\"frequently-asked-questions\",\"importer-exporter\"]},\"18960\":{\"title\":\"Robots.txt Editor for Multisite Networks\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/robots-txt-editor-for-multisite-networks\\/\",\"categories\":[\"multisite-networks\",\"robots-txt\"]},\"18961\":{\"title\":\"What are the minimum requirements for All in One SEO?\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/what-are-the-minimum-requirements-for-all-in-one-seo-pack\\/\",\"categories\":[\"frequently-asked-questions\"]},\"18964\":{\"title\":\"How do I use your API code examples?\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-do-i-use-your-api-code-examples\\/\",\"categories\":[\"frequently-asked-questions\"]},\"18969\":{\"title\":\"XML Parsing Error - This page contains the following errors\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/this-page-contains-the-following-errors\\/\",\"categories\":[\"google-news-sitemap\",\"troubleshooting\",\"video-sitemap\",\"xml-sitemap\"]},\"18972\":{\"title\":\"The File Editor or Robots.txt modules are missing\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/the-file-editor-or-robots-txt-modules-are-missing\\/\",\"categories\":[\"frequently-asked-questions\"]},\"18977\":{\"title\":\"Excluding the XML Sitemap from caching\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/excluding-the-xml-sitemap-from-caching\\/\",\"categories\":[\"xml-sitemap\"]},\"18982\":{\"title\":\"Why doesn\'t the title and description I set appear in search results?\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/why-doesnt-the-title-and-description-i-set-appear-in-search-results\\/\",\"categories\":[\"frequently-asked-questions\",\"post-page-settings\"]},\"18983\":{\"title\":\"Can I remove the date from Google search results?\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/can-i-remove-the-date-from-google-search-results\\/\",\"categories\":[\"frequently-asked-questions\"]},\"18985\":{\"title\":\"Setting up HTTPS SSL\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/setting-up-https-ssl\\/\",\"categories\":[\"general-seo-topics\"]},\"18995\":{\"title\":\"How to Increase the WordPress PHP Memory Limit\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/increase-wordpress-php-memory-limit\\/\",\"categories\":[\"troubleshooting\"]},\"19002\":{\"title\":\"Checking Index Status in Google Search Results\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/checking-index-status-in-google-search-results\\/\",\"categories\":[\"general-seo-topics\"]},\"19006\":{\"title\":\"SEO Data Importer\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/seo-data-importer\\/\",\"categories\":[\"seo-data-importer\"]},\"19008\":{\"title\":\"How to troubleshoot issues with All in One SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/how-to-troubleshoot-issues-with-all-in-one-seo-pack\\/\",\"categories\":[\"troubleshooting\"]},\"19010\":{\"title\":\"Quality Guidelines for SEO Titles and Descriptions\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/quality-guidelines-for-seo-titles-and-descriptions\\/\",\"categories\":[\"general-seo-topics\"]},\"19016\":{\"title\":\"Top Tips for Good On-Page SEO\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/top-tips-for-good-on-page-seo\\/\",\"categories\":[\"general-seo-topics\"]},\"19017\":{\"title\":\"Meta Descriptions\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/meta-descriptions\\/\",\"categories\":[\"general-seo-topics\"]},\"19028\":{\"title\":\"What is SEO meta?\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/what-is-seo-meta\\/\",\"categories\":[\"getting-started\"]},\"19029\":{\"title\":\"Social Meta Settings - Individual Page\\/Post Settings\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/social-meta-settings-individual-pagepost-settings\\/\",\"categories\":[\"post-page-settings\",\"social-networks\"]},\"19030\":{\"title\":\"File Editor Module\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/file-editor-module\\/\",\"categories\":[\"file-editor\"]},\"19031\":{\"title\":\"Social Meta Settings\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/social-meta-module\\/\",\"categories\":[\"social-networks\"]},\"19032\":{\"title\":\"Importer & Exporter Module\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/importer-exporter-module\\/\",\"categories\":[\"importer-exporter\"]},\"19034\":{\"title\":\"Feature Manager\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/feature-manager\\/\",\"categories\":[\"feature-manager\"]},\"19035\":{\"title\":\"Advanced Settings for All in One SEO Pack\",\"url\":\"https:\\/\\/aioseo.com\\/docs\\/all-in-one-seo-pack-advanced-settings\\/\",\"categories\":[\"advanced-settings\"]}}}\";', '2023-01-12 07:09:29', '2023-01-05 07:09:29', '2023-01-05 07:09:29');
INSERT INTO `wp_aioseo_cache` VALUES (33, 'page_overview_data', 'a:5:{s:5:\"total\";i:13;s:16:\"needsImprovement\";i:0;s:4:\"okay\";i:3;s:4:\"good\";i:0;s:21:\"withoutFocusKeyphrase\";i:10;}', '2023-01-12 08:37:02', '2023-01-05 08:37:02', '2023-01-05 08:37:02');
INSERT INTO `wp_aioseo_cache` VALUES (36, 'attachment_url_to_post_id_d99ed2ddbeefba28910cca4100f73b401b38bc49', 's:4:\"none\";', '2023-01-07 17:01:02', '2023-01-06 17:01:02', '2023-01-06 17:01:02');
INSERT INTO `wp_aioseo_cache` VALUES (37, 'attachment_url_to_post_id_b19e4735b2b73f6a8e4dae1db945673eac8aea4a', 's:2:\"46\";', '2023-01-07 17:01:02', '2023-01-06 17:01:02', '2023-01-06 17:01:02');
COMMIT;

-- ----------------------------
-- Table structure for wp_aioseo_notifications
-- ----------------------------
DROP TABLE IF EXISTS `wp_aioseo_notifications`;
CREATE TABLE `wp_aioseo_notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(13) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `addon` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `level` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `notification_id` bigint(20) unsigned DEFAULT NULL,
  `notification_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `button1_label` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `button1_action` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `button2_label` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `button2_action` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `dismissed` tinyint(1) NOT NULL DEFAULT '0',
  `new` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ndx_aioseo_notifications_slug` (`slug`),
  KEY `ndx_aioseo_notifications_dates` (`start`,`end`),
  KEY `ndx_aioseo_notifications_type` (`type`),
  KEY `ndx_aioseo_notifications_dismissed` (`dismissed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of wp_aioseo_notifications
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wp_aioseo_posts
-- ----------------------------
DROP TABLE IF EXISTS `wp_aioseo_posts`;
CREATE TABLE `wp_aioseo_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `title` text COLLATE utf8mb4_unicode_520_ci,
  `description` text COLLATE utf8mb4_unicode_520_ci,
  `keywords` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `keyphrases` longtext COLLATE utf8mb4_unicode_520_ci,
  `page_analysis` longtext COLLATE utf8mb4_unicode_520_ci,
  `canonical_url` text COLLATE utf8mb4_unicode_520_ci,
  `og_title` text COLLATE utf8mb4_unicode_520_ci,
  `og_description` text COLLATE utf8mb4_unicode_520_ci,
  `og_object_type` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT 'default',
  `og_image_type` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT 'default',
  `og_image_url` text COLLATE utf8mb4_unicode_520_ci,
  `og_image_width` int(11) DEFAULT NULL,
  `og_image_height` int(11) DEFAULT NULL,
  `og_image_custom_url` text COLLATE utf8mb4_unicode_520_ci,
  `og_image_custom_fields` text COLLATE utf8mb4_unicode_520_ci,
  `og_video` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `og_custom_url` text COLLATE utf8mb4_unicode_520_ci,
  `og_article_section` text COLLATE utf8mb4_unicode_520_ci,
  `og_article_tags` text COLLATE utf8mb4_unicode_520_ci,
  `twitter_use_og` tinyint(1) DEFAULT '0',
  `twitter_card` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT 'default',
  `twitter_image_type` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT 'default',
  `twitter_image_url` text COLLATE utf8mb4_unicode_520_ci,
  `twitter_image_custom_url` text COLLATE utf8mb4_unicode_520_ci,
  `twitter_image_custom_fields` text COLLATE utf8mb4_unicode_520_ci,
  `twitter_title` text COLLATE utf8mb4_unicode_520_ci,
  `twitter_description` text COLLATE utf8mb4_unicode_520_ci,
  `seo_score` int(11) NOT NULL DEFAULT '0',
  `schema` longtext COLLATE utf8mb4_unicode_520_ci,
  `schema_type` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT 'default',
  `schema_type_options` longtext COLLATE utf8mb4_unicode_520_ci,
  `pillar_content` tinyint(1) DEFAULT NULL,
  `robots_default` tinyint(1) NOT NULL DEFAULT '1',
  `robots_noindex` tinyint(1) NOT NULL DEFAULT '0',
  `robots_noarchive` tinyint(1) NOT NULL DEFAULT '0',
  `robots_nosnippet` tinyint(1) NOT NULL DEFAULT '0',
  `robots_nofollow` tinyint(1) NOT NULL DEFAULT '0',
  `robots_noimageindex` tinyint(1) NOT NULL DEFAULT '0',
  `robots_noodp` tinyint(1) NOT NULL DEFAULT '0',
  `robots_notranslate` tinyint(1) NOT NULL DEFAULT '0',
  `robots_max_snippet` int(11) DEFAULT NULL,
  `robots_max_videopreview` int(11) DEFAULT NULL,
  `robots_max_imagepreview` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT 'large',
  `images` longtext COLLATE utf8mb4_unicode_520_ci,
  `image_scan_date` datetime DEFAULT NULL,
  `priority` tinytext COLLATE utf8mb4_unicode_520_ci,
  `frequency` tinytext COLLATE utf8mb4_unicode_520_ci,
  `videos` longtext COLLATE utf8mb4_unicode_520_ci,
  `video_thumbnail` text COLLATE utf8mb4_unicode_520_ci,
  `video_scan_date` datetime DEFAULT NULL,
  `local_seo` longtext COLLATE utf8mb4_unicode_520_ci,
  `limit_modified_date` tinyint(1) NOT NULL DEFAULT '0',
  `options` longtext COLLATE utf8mb4_unicode_520_ci,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ndx_aioseo_posts_post_id` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of wp_aioseo_posts
-- ----------------------------
BEGIN;
INSERT INTO `wp_aioseo_posts` VALUES (1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default', 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'default', 'default', NULL, NULL, NULL, NULL, NULL, 0, '{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}', 'default', NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 'large', NULL, '2023-01-05 07:11:53', NULL, NULL, NULL, NULL, NULL, NULL, 0, '{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false}}', '2023-01-05 07:11:53', '2023-01-05 07:11:53');
INSERT INTO `wp_aioseo_posts` VALUES (2, 8, 'Home - PT. Transporindo Agung Sejahtera', 'Transporindo Agung Sejahtera Jasa Freight Forwarder EMKL Import Ekspedisi Muatan Kapal Laut Medan Jakarta Surabaya Makassar', '[]', '{\"focus\":{\"keyphrase\":\"\",\"score\":0,\"analysis\":{\"keyphraseInTitle\":{\"score\":0,\"maxScore\":9,\"error\":1}}},\"additional\":[]}', '{\"analysis\":{\"basic\":{\"metadescriptionLength\":{\"score\":9,\"maxScore\":9,\"error\":0},\"lengthContent\":{\"score\":-20,\"maxScore\":9,\"error\":1},\"isInternalLink\":{\"score\":3,\"maxScore\":9,\"error\":1},\"isExternalLink\":{\"score\":3,\"maxScore\":9,\"error\":1},\"errors\":3},\"title\":{\"titleLength\":{\"score\":6,\"maxScore\":9,\"error\":1},\"errors\":1},\"readability\":{\"contentHasAssets\":{\"error\":1,\"score\":1,\"maxScore\":5},\"paragraphLength\":{\"score\":5,\"maxScore\":5,\"error\":0},\"sentenceLength\":{\"score\":9,\"maxScore\":9,\"error\":0},\"passiveVoice\":{\"score\":9,\"maxScore\":9,\"error\":0},\"transitionWords\":[],\"consecutiveSentences\":{\"score\":9,\"maxScore\":9,\"error\":0},\"subheadingsDistribution\":{\"score\":9,\"maxScore\":9,\"error\":0},\"calculateFleschReading\":{\"score\":3,\"maxScore\":9,\"error\":1},\"errors\":2}}}', NULL, NULL, NULL, 'website', 'default', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '[]', 0, 'default', 'default', NULL, NULL, NULL, NULL, NULL, 68, '{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"WebPage\",\"isEnabled\":true},\"graphs\":[]}', 'default', NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, -1, -1, 'large', NULL, '2023-01-05 07:31:40', 'default', 'default', NULL, NULL, NULL, NULL, 0, '{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false}}', '2023-01-05 07:11:53', '2023-01-05 07:31:40');
INSERT INTO `wp_aioseo_posts` VALUES (3, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default', 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'default', 'default', NULL, NULL, NULL, NULL, NULL, 0, '{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}', 'default', NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 'large', NULL, '2023-01-05 07:11:53', NULL, NULL, NULL, NULL, NULL, NULL, 0, '{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false}}', '2023-01-05 07:11:53', '2023-01-05 07:11:53');
INSERT INTO `wp_aioseo_posts` VALUES (4, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default', 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'default', 'default', NULL, NULL, NULL, NULL, NULL, 0, '{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}', 'default', NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 'large', NULL, '2023-01-05 07:11:53', NULL, NULL, NULL, NULL, NULL, NULL, 0, '{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false}}', '2023-01-05 07:11:53', '2023-01-05 07:11:53');
INSERT INTO `wp_aioseo_posts` VALUES (5, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default', 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'default', 'default', NULL, NULL, NULL, NULL, NULL, 0, '{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}', 'default', NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 'large', NULL, '2023-01-05 07:11:53', NULL, NULL, NULL, NULL, NULL, NULL, 0, '{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false}}', '2023-01-05 07:11:54', '2023-01-05 07:11:54');
INSERT INTO `wp_aioseo_posts` VALUES (6, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default', 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'default', 'default', NULL, NULL, NULL, NULL, NULL, 0, '{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}', 'default', NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 'large', NULL, '2023-01-05 07:11:54', NULL, NULL, NULL, NULL, NULL, NULL, 0, '{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false}}', '2023-01-05 07:11:54', '2023-01-05 07:11:54');
INSERT INTO `wp_aioseo_posts` VALUES (7, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default', 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'default', 'default', NULL, NULL, NULL, NULL, NULL, 0, '{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}', 'default', NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 'large', NULL, '2023-01-05 07:11:54', NULL, NULL, NULL, NULL, NULL, NULL, 0, '{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false}}', '2023-01-05 07:11:54', '2023-01-05 07:11:54');
INSERT INTO `wp_aioseo_posts` VALUES (8, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default', 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'default', 'default', NULL, NULL, NULL, NULL, NULL, 0, '{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}', 'default', NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 'large', NULL, '2023-01-05 07:11:54', NULL, NULL, NULL, NULL, NULL, NULL, 0, '{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false}}', '2023-01-05 07:11:54', '2023-01-05 07:11:54');
INSERT INTO `wp_aioseo_posts` VALUES (9, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default', 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'default', 'default', NULL, NULL, NULL, NULL, NULL, 0, '{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}', 'default', NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 'large', NULL, '2023-01-05 07:11:54', NULL, NULL, NULL, NULL, NULL, NULL, 0, '{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false}}', '2023-01-05 07:11:54', '2023-01-05 07:11:54');
INSERT INTO `wp_aioseo_posts` VALUES (10, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default', 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'default', 'default', NULL, NULL, NULL, NULL, NULL, 0, '{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}', 'default', NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 'large', NULL, '2023-01-05 07:11:54', NULL, NULL, NULL, NULL, NULL, NULL, 0, '{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false}}', '2023-01-05 07:11:54', '2023-01-05 07:11:54');
INSERT INTO `wp_aioseo_posts` VALUES (11, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default', 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'default', 'default', NULL, NULL, NULL, NULL, NULL, 0, '{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}', 'default', NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 'large', NULL, '2023-01-05 07:15:26', NULL, NULL, NULL, NULL, NULL, NULL, 0, '{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false}}', '2023-01-05 07:15:26', '2023-01-05 07:15:26');
INSERT INTO `wp_aioseo_posts` VALUES (12, 48, NULL, NULL, '[]', '{\"focus\":{\"keyphrase\":\"\",\"score\":0,\"analysis\":{\"keyphraseInTitle\":{\"score\":0,\"maxScore\":9,\"error\":1}}},\"additional\":[]}', '{\"analysis\":{\"basic\":{\"metadescriptionLength\":{\"score\":6,\"maxScore\":9,\"error\":1},\"lengthContent\":{\"score\":-20,\"maxScore\":9,\"error\":1},\"isInternalLink\":{\"score\":3,\"maxScore\":9,\"error\":1},\"isExternalLink\":{\"score\":3,\"maxScore\":9,\"error\":1},\"errors\":4},\"title\":{\"titleLength\":{\"score\":9,\"maxScore\":9,\"error\":0},\"errors\":0},\"readability\":{\"contentHasAssets\":{\"error\":1,\"score\":1,\"maxScore\":5},\"paragraphLength\":{\"score\":5,\"maxScore\":5,\"error\":0},\"sentenceLength\":{\"score\":9,\"maxScore\":9,\"error\":0},\"passiveVoice\":{\"score\":9,\"maxScore\":9,\"error\":0},\"transitionWords\":[],\"consecutiveSentences\":{\"score\":9,\"maxScore\":9,\"error\":0},\"subheadingsDistribution\":{\"score\":9,\"maxScore\":9,\"error\":0},\"calculateFleschReading\":{\"score\":3,\"maxScore\":9,\"error\":1},\"errors\":2}}}', NULL, NULL, NULL, 'default', 'default', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '[]', 0, 'default', 'default', NULL, NULL, NULL, NULL, NULL, 75, '{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"WebPage\",\"isEnabled\":true},\"graphs\":[]}', 'default', NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, -1, -1, 'large', NULL, '2023-01-05 07:31:40', 'default', 'default', NULL, NULL, NULL, NULL, 0, '{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false}}', '2023-01-05 07:25:41', '2023-01-05 07:31:40');
INSERT INTO `wp_aioseo_posts` VALUES (13, 50, NULL, NULL, '[]', '{\"focus\":{\"keyphrase\":\"\",\"score\":0,\"analysis\":{\"keyphraseInTitle\":{\"score\":0,\"maxScore\":9,\"error\":1}}},\"additional\":[]}', '{\"analysis\":{\"basic\":{\"metadescriptionLength\":{\"score\":6,\"maxScore\":9,\"error\":1},\"lengthContent\":{\"score\":-20,\"maxScore\":9,\"error\":1},\"isInternalLink\":{\"score\":3,\"maxScore\":9,\"error\":1},\"isExternalLink\":{\"score\":3,\"maxScore\":9,\"error\":1},\"errors\":4},\"title\":{\"titleLength\":{\"score\":9,\"maxScore\":9,\"error\":0},\"errors\":0},\"readability\":{\"contentHasAssets\":{\"error\":1,\"score\":1,\"maxScore\":5},\"paragraphLength\":{\"score\":5,\"maxScore\":5,\"error\":0},\"sentenceLength\":{\"score\":9,\"maxScore\":9,\"error\":0},\"passiveVoice\":{\"score\":9,\"maxScore\":9,\"error\":0},\"transitionWords\":[],\"consecutiveSentences\":{\"score\":9,\"maxScore\":9,\"error\":0},\"subheadingsDistribution\":{\"score\":9,\"maxScore\":9,\"error\":0},\"calculateFleschReading\":{\"score\":3,\"maxScore\":9,\"error\":1},\"errors\":2}}}', NULL, NULL, NULL, 'default', 'default', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '[]', 0, 'default', 'default', NULL, NULL, NULL, NULL, NULL, 75, '{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"WebPage\",\"isEnabled\":true},\"graphs\":[]}', 'default', NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, -1, -1, 'large', NULL, '2023-01-05 07:31:40', 'default', 'default', NULL, NULL, NULL, NULL, 0, '{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false}}', '2023-01-05 07:26:00', '2023-01-05 07:31:40');
COMMIT;

-- ----------------------------
-- Table structure for wp_commentmeta
-- ----------------------------
DROP TABLE IF EXISTS `wp_commentmeta`;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of wp_commentmeta
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wp_comments
-- ----------------------------
DROP TABLE IF EXISTS `wp_comments`;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of wp_comments
-- ----------------------------
BEGIN;
INSERT INTO `wp_comments` VALUES (1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2022-12-30 02:20:22', '2022-12-30 02:20:22', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://en.gravatar.com/\">Gravatar</a>.', 0, 'post-trashed', '', 'comment', 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for wp_frmt_form_entry
-- ----------------------------
DROP TABLE IF EXISTS `wp_frmt_form_entry`;
CREATE TABLE `wp_frmt_form_entry` (
  `entry_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `entry_type` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `draft_id` varchar(12) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `form_id` bigint(20) unsigned NOT NULL,
  `is_spam` tinyint(1) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`entry_id`),
  KEY `entry_is_spam` (`is_spam`),
  KEY `entry_type` (`entry_type`),
  KEY `entry_form_id` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of wp_frmt_form_entry
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wp_frmt_form_entry_meta
-- ----------------------------
DROP TABLE IF EXISTS `wp_frmt_form_entry_meta`;
CREATE TABLE `wp_frmt_form_entry_meta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` bigint(20) unsigned NOT NULL,
  `meta_key` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`meta_id`),
  KEY `meta_key` (`meta_key`),
  KEY `meta_entry_id` (`entry_id`),
  KEY `meta_key_object` (`entry_id`,`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of wp_frmt_form_entry_meta
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wp_frmt_form_reports
-- ----------------------------
DROP TABLE IF EXISTS `wp_frmt_form_reports`;
CREATE TABLE `wp_frmt_form_reports` (
  `report_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `report_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of wp_frmt_form_reports
-- ----------------------------
BEGIN;
INSERT INTO `wp_frmt_form_reports` VALUES (1, 'a:5:{s:7:\"exclude\";a:1:{i:0;i:1;}s:8:\"settings\";a:3:{s:5:\"label\";s:12:\"Form reports\";s:6:\"module\";s:5:\"forms\";s:10:\"forms_type\";s:3:\"all\";}s:8:\"schedule\";a:3:{s:9:\"frequency\";s:7:\"monthly\";s:8:\"monthDay\";s:1:\"4\";s:9:\"monthTime\";s:8:\"04:00 AM\";}s:13:\"report_status\";s:8:\"inactive\";s:10:\"recipients\";a:1:{i:0;a:5:{s:2:\"id\";i:1;s:4:\"name\";s:5:\"admin\";s:5:\"email\";s:21:\"andramarkov@gmail.com\";s:4:\"role\";s:13:\"Administrator\";s:6:\"avatar\";s:75:\"http://0.gravatar.com/avatar/0688e060df3d9dae7e555b3d84a42cf3?s=96&d=mm&r=g\";}}}', 'inactive', '2023-01-05 15:36:01', '2023-01-05 15:36:01');
COMMIT;

-- ----------------------------
-- Table structure for wp_frmt_form_views
-- ----------------------------
DROP TABLE IF EXISTS `wp_frmt_form_views`;
CREATE TABLE `wp_frmt_form_views` (
  `view_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` bigint(20) unsigned NOT NULL,
  `page_id` bigint(20) unsigned NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `count` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`view_id`),
  KEY `view_form_id` (`form_id`),
  KEY `view_ip` (`ip`),
  KEY `view_form_object` (`form_id`,`view_id`),
  KEY `view_form_object_ip` (`form_id`,`view_id`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of wp_frmt_form_views
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wp_links
-- ----------------------------
DROP TABLE IF EXISTS `wp_links`;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of wp_links
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wp_nextend2_image_storage
-- ----------------------------
DROP TABLE IF EXISTS `wp_nextend2_image_storage`;
CREATE TABLE `wp_nextend2_image_storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of wp_nextend2_image_storage
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wp_nextend2_section_storage
-- ----------------------------
DROP TABLE IF EXISTS `wp_nextend2_section_storage`;
CREATE TABLE `wp_nextend2_section_storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `section` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `referencekey` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `system` int(11) NOT NULL DEFAULT '0',
  `editable` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `system` (`system`),
  KEY `editable` (`editable`),
  KEY `application` (`application`,`section`(50),`referencekey`(50)),
  KEY `application_2` (`application`,`section`(50))
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of wp_nextend2_section_storage
-- ----------------------------
BEGIN;
INSERT INTO `wp_nextend2_section_storage` VALUES (10000, 'smartslider', 'settings', '', '{\"n2_ss3_version\":\"3.5.1.12\\/b:release-3.5.1.12\\/r:23139749a8387f67159e398e0146aff72bfb37ed\"}', 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for wp_nextend2_smartslider3_generators
-- ----------------------------
DROP TABLE IF EXISTS `wp_nextend2_smartslider3_generators`;
CREATE TABLE `wp_nextend2_smartslider3_generators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group` varchar(254) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` varchar(254) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of wp_nextend2_smartslider3_generators
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wp_nextend2_smartslider3_sliders
-- ----------------------------
DROP TABLE IF EXISTS `wp_nextend2_smartslider3_sliders`;
CREATE TABLE `wp_nextend2_smartslider3_sliders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `params` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'published',
  `time` datetime NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `time` (`time`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of wp_nextend2_smartslider3_sliders
-- ----------------------------
BEGIN;
INSERT INTO `wp_nextend2_smartslider3_sliders` VALUES (1, NULL, 'Tutorial Slider', 'simple', '{\"aria-label\":\"Slider\",\"alias-id\":\"\",\"alias-smoothscroll\":\"\",\"alias-slideswitch\":\"\",\"background\":\"\",\"background-fixed\":\"0\",\"background-size\":\"cover\",\"background-color\":\"FFFFFF00\",\"backgroundVideoMp4\":\"\",\"backgroundVideoMuted\":\"1\",\"backgroundVideoLoop\":\"1\",\"backgroundVideoMode\":\"fill\",\"align\":\"normal\",\"margin\":\"0|*|0|*|0|*|0\",\"padding\":\"0|*|0|*|0|*|0\",\"perspective\":\"1000\",\"border-width\":\"0\",\"border-color\":\"3E3E3Eff\",\"border-radius\":\"0\",\"slider-preset\":\"\",\"slider-css\":\"\",\"width\":\"1200\",\"height\":\"600\",\"mobileportrait\":\"1\",\"mobilelandscape\":\"1\",\"tabletportrait\":\"1\",\"tabletlandscape\":\"1\",\"desktopportrait\":\"1\",\"desktoplandscape\":\"1\",\"responsiveLimitSlideWidth\":\"1\",\"responsiveSlideWidthDesktopLandscape\":\"0\",\"responsiveSlideWidthMaxDesktopLandscape\":\"1600\",\"responsiveSlideWidth\":\"0\",\"responsiveSlideWidthMax\":\"3000\",\"responsiveSlideWidthTabletLandscape\":\"0\",\"responsiveSlideWidthMaxTabletLandscape\":\"1200\",\"responsiveSlideWidthTablet\":\"0\",\"responsiveSlideWidthMaxTablet\":\"3000\",\"responsiveSlideWidthMobileLandscape\":\"0\",\"responsiveSlideWidthMaxMobileLandscape\":\"740\",\"responsiveSlideWidthMobile\":\"0\",\"responsiveSlideWidthMaxMobile\":\"480\",\"responsive-breakpoint-desktop-portrait\":\"1440\",\"responsive-breakpoint-desktop-portrait-landscape\":\"1440\",\"responsive-breakpoint-tablet-landscape\":\"1300\",\"responsive-breakpoint-tablet-landscape-landscape\":\"1300\",\"responsive-breakpoint-tablet-portrait\":\"1199\",\"responsive-breakpoint-tablet-portrait-landscape\":\"1199\",\"responsive-breakpoint-mobile-landscape\":\"900\",\"responsive-breakpoint-mobile-landscape-landscape\":\"1050\",\"responsive-breakpoint-mobile-portrait\":\"700\",\"responsive-breakpoint-mobile-portrait-landscape\":\"900\",\"responsive-breakpoint-desktop-landscape-enabled\":\"0\",\"responsive-breakpoint-tablet-landscape-enabled\":\"0\",\"responsive-breakpoint-tablet-portrait-enabled\":\"1\",\"responsive-breakpoint-mobile-landscape-enabled\":\"0\",\"responsive-breakpoint-mobile-portrait-enabled\":\"1\",\"responsive-breakpoint-global\":\"0\",\"breakpoints-orientation\":\"portrait\",\"responsive-mode\":\"fullwidth\",\"responsiveSliderHeightMin\":\"0\",\"responsiveForceFull\":\"1\",\"responsiveForceFullOverflowX\":\"body\",\"responsiveForceFullHorizontalSelector\":\"body\",\"slider-size-override\":\"0\",\"slider-size-override-mobile-portrait\":\"0\",\"mobile-portrait-width\":\"320\",\"mobile-portrait-height\":\"568\",\"slider-size-override-mobile-landscape\":\"0\",\"mobile-landscape-width\":\"568\",\"mobile-landscape-height\":\"320\",\"slider-size-override-tablet-portrait\":\"0\",\"tablet-portrait-width\":\"768\",\"tablet-portrait-height\":\"1024\",\"slider-size-override-tablet-landscape\":\"0\",\"tablet-landscape-width\":\"1024\",\"tablet-landscape-height\":\"768\",\"slider-size-override-desktop-landscape\":\"0\",\"desktop-landscape-width\":\"1440\",\"desktop-landscape-height\":\"900\",\"controlsTouch\":\"horizontal\",\"controlsScroll\":\"0\",\"controlsKeyboard\":\"1\",\"widget-arrow-enabled\":\"0\",\"widgetarrow\":\"imageEmpty\",\"widget-arrow-previous\":\"thin-horizontal.svg\",\"widget-arrow-previous-image\":\"\",\"widget-arrow-previous-color\":\"ffffffcc\",\"widget-arrow-previous-hover\":\"1\",\"widget-arrow-previous-hover-color\":\"ffffffff\",\"widget-arrow-mirror\":\"1\",\"widget-arrow-next\":\"thin-horizontal.svg\",\"widget-arrow-next-image\":\"\",\"widget-arrow-next-color\":\"ffffffcc\",\"widget-arrow-next-hover\":\"0\",\"widget-arrow-next-hover-color\":\"ffffffcc\",\"widget-arrow-style\":\"\",\"widget-arrow-previous-position-mode\":\"simple\",\"widget-arrow-previous-position-area\":\"6\",\"widget-arrow-previous-position-stack\":\"1\",\"widget-arrow-previous-position-offset\":\"15\",\"widget-arrow-previous-position-horizontal\":\"left\",\"widget-arrow-previous-position-horizontal-position\":\"0\",\"widget-arrow-previous-position-horizontal-unit\":\"px\",\"widget-arrow-previous-position-vertical\":\"top\",\"widget-arrow-previous-position-vertical-position\":\"0\",\"widget-arrow-previous-position-vertical-unit\":\"px\",\"widget-arrow-next-position-mode\":\"simple\",\"widget-arrow-next-position-area\":\"7\",\"widget-arrow-next-position-stack\":\"1\",\"widget-arrow-next-position-offset\":\"15\",\"widget-arrow-next-position-horizontal\":\"left\",\"widget-arrow-next-position-horizontal-position\":\"0\",\"widget-arrow-next-position-horizontal-unit\":\"px\",\"widget-arrow-next-position-vertical\":\"top\",\"widget-arrow-next-position-vertical-position\":\"0\",\"widget-arrow-next-position-vertical-unit\":\"px\",\"widget-arrow-animation\":\"fade\",\"widget-arrow-previous-alt\":\"previous arrow\",\"widget-arrow-next-alt\":\"next arrow\",\"widget-arrow-base64\":\"1\",\"widget-arrow-display-hover\":\"0\",\"widget-arrow-display-mobileportrait\":\"0\",\"widget-arrow-display-mobilelandscape\":\"0\",\"widget-arrow-display-tabletportrait\":\"1\",\"widget-arrow-display-tabletlandscape\":\"1\",\"widget-arrow-display-desktopportrait\":\"1\",\"widget-arrow-display-desktoplandscape\":\"1\",\"widget-arrow-exclude-slides\":\"\",\"widget-bullet-enabled\":\"1\",\"widgetbullet\":\"transition\",\"widget-bullet-position-mode\":\"simple\",\"widget-bullet-position-area\":\"10\",\"widget-bullet-position-stack\":\"1\",\"widget-bullet-position-offset\":\"5\",\"widget-bullet-position-horizontal\":\"left\",\"widget-bullet-position-horizontal-position\":\"0\",\"widget-bullet-position-horizontal-unit\":\"px\",\"widget-bullet-position-vertical\":\"top\",\"widget-bullet-position-vertical-position\":\"0\",\"widget-bullet-position-vertical-unit\":\"px\",\"widget-bullet-action\":\"click\",\"widget-bullet-style\":\"{\\\"data\\\":[{\\\"backgroundcolor\\\":\\\"00000000\\\",\\\"opacity\\\":100,\\\"padding\\\":\\\"5|*|5|*|5|*|5|*|px\\\",\\\"boxshadow\\\":\\\"0|*|0|*|0|*|0|*|000000ff\\\",\\\"border\\\":\\\"2|*|solid|*|ffffffcc\\\",\\\"borderradius\\\":\\\"50\\\",\\\"extra\\\":\\\"margin: 4px;\\\"},{\\\"extra\\\":\\\"\\\",\\\"backgroundcolor\\\":\\\"ffffffcc\\\",\\\"border\\\":\\\"2|*|solid|*|ffffffcc\\\"}]}\",\"widget-bullet-bar\":\"\",\"widget-bullet-bar-full-size\":\"0\",\"widget-bullet-align\":\"center\",\"widget-bullet-orientation\":\"auto\",\"widget-bullet-thumbnail-show-image\":\"0\",\"widget-bullet-thumbnail-width\":\"60\",\"widget-bullet-thumbnail-height\":\"60\",\"widget-bullet-thumbnail-style\":\"{\\\"data\\\":[{\\\"backgroundcolor\\\":\\\"00000080\\\",\\\"padding\\\":\\\"3|*|3|*|3|*|3|*|px\\\",\\\"boxshadow\\\":\\\"0|*|0|*|0|*|0|*|000000ff\\\",\\\"border\\\":\\\"0|*|solid|*|000000ff\\\",\\\"borderradius\\\":\\\"3\\\",\\\"extra\\\":\\\"margin: 5px;\\\"}]}\",\"widget-bullet-thumbnail-side\":\"before\",\"widget-bullet-display-hover\":\"0\",\"widget-bullet-display-mobileportrait\":\"1\",\"widget-bullet-display-mobilelandscape\":\"1\",\"widget-bullet-display-tabletportrait\":\"1\",\"widget-bullet-display-tabletlandscape\":\"1\",\"widget-bullet-display-desktopportrait\":\"1\",\"widget-bullet-display-desktoplandscape\":\"1\",\"widget-bullet-exclude-slides\":\"\",\"widget-bar-enabled\":\"0\",\"widgetbar\":\"horizontal\",\"widget-bar-position-mode\":\"simple\",\"widget-bar-position-area\":\"10\",\"widget-bar-position-stack\":\"1\",\"widget-bar-position-offset\":\"30\",\"widget-bar-position-horizontal\":\"left\",\"widget-bar-position-horizontal-position\":\"0\",\"widget-bar-position-horizontal-unit\":\"px\",\"widget-bar-position-vertical\":\"top\",\"widget-bar-position-vertical-position\":\"0\",\"widget-bar-position-vertical-unit\":\"px\",\"widget-bar-animate\":\"0\",\"widget-bar-style\":\"{\\\"data\\\":[{\\\"backgroundcolor\\\":\\\"000000ab\\\",\\\"padding\\\":\\\"5|*|20|*|5|*|20|*|px\\\",\\\"boxshadow\\\":\\\"0|*|0|*|0|*|0|*|000000ff\\\",\\\"border\\\":\\\"0|*|solid|*|000000ff\\\",\\\"borderradius\\\":\\\"40\\\",\\\"extra\\\":\\\"\\\"}]}\",\"widget-bar-show-title\":\"1\",\"widget-bar-font-title\":\"{\\\"data\\\":[{\\\"color\\\":\\\"ffffffff\\\",\\\"size\\\":\\\"14||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000c7\\\",\\\"afont\\\":\\\"Montserrat\\\",\\\"lineheight\\\":\\\"1.3\\\",\\\"bold\\\":0,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"left\\\",\\\"extra\\\":\\\"vertical-align: middle;\\\"},{\\\"color\\\":\\\"fc2828ff\\\",\\\"afont\\\":\\\"google(@import url(http://fonts.googleapis.com/css?family=Raleway);),Arial\\\",\\\"size\\\":\\\"25||px\\\"},{}]}\",\"widget-bar-show-description\":\"1\",\"widget-bar-font-description\":\"{\\\"data\\\":[{\\\"color\\\":\\\"ffffffff\\\",\\\"size\\\":\\\"14||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000c7\\\",\\\"afont\\\":\\\"Montserrat\\\",\\\"lineheight\\\":\\\"1.3\\\",\\\"bold\\\":0,\\\"italic\\\":1,\\\"underline\\\":0,\\\"align\\\":\\\"left\\\",\\\"extra\\\":\\\"vertical-align: middle;\\\"},{\\\"color\\\":\\\"fc2828ff\\\",\\\"afont\\\":\\\"Raleway,Arial\\\",\\\"size\\\":\\\"25||px\\\"},{}]}\",\"widget-bar-slide-count\":\"0\",\"widget-bar-width\":\"100%\",\"widget-bar-full-width\":\"0\",\"widget-bar-separator\":\" - \",\"widget-bar-align\":\"center\",\"widget-bar-display-hover\":\"0\",\"widget-bar-display-mobileportrait\":\"1\",\"widget-bar-display-mobilelandscape\":\"1\",\"widget-bar-display-tabletportrait\":\"1\",\"widget-bar-display-tabletlandscape\":\"1\",\"widget-bar-display-desktopportrait\":\"1\",\"widget-bar-display-desktoplandscape\":\"1\",\"widget-bar-exclude-slides\":\"\",\"widget-thumbnail-enabled\":\"0\",\"widgetthumbnail\":\"default\",\"widget-thumbnail-show-image\":\"1\",\"widget-thumbnail-width\":\"100\",\"widget-thumbnail-height\":\"60\",\"widget-thumbnail-position-mode\":\"simple\",\"widget-thumbnail-position-area\":\"12\",\"widget-thumbnail-position-stack\":\"1\",\"widget-thumbnail-position-offset\":\"0\",\"widget-thumbnail-position-horizontal\":\"left\",\"widget-thumbnail-position-horizontal-position\":\"0\",\"widget-thumbnail-position-horizontal-unit\":\"px\",\"widget-thumbnail-position-vertical\":\"top\",\"widget-thumbnail-position-vertical-position\":\"0\",\"widget-thumbnail-position-vertical-unit\":\"px\",\"widget-thumbnail-action\":\"click\",\"widget-thumbnail-align-content\":\"start\",\"widget-thumbnail-style-bar\":\"{\\\"data\\\":[{\\\"backgroundcolor\\\":\\\"242424ff\\\",\\\"padding\\\":\\\"3|*|3|*|3|*|3|*|px\\\",\\\"boxshadow\\\":\\\"0|*|0|*|0|*|0|*|000000ff\\\",\\\"border\\\":\\\"0|*|solid|*|000000ff\\\",\\\"borderradius\\\":\\\"0\\\",\\\"extra\\\":\\\"\\\"}]}\",\"widget-thumbnail-style-slides\":\"{\\\"data\\\":[{\\\"backgroundcolor\\\":\\\"00000000\\\",\\\"padding\\\":\\\"0|*|0|*|0|*|0|*|px\\\",\\\"boxshadow\\\":\\\"0|*|0|*|0|*|0|*|000000ff\\\",\\\"border\\\":\\\"0|*|solid|*|ffffff00\\\",\\\"borderradius\\\":\\\"0\\\",\\\"opacity\\\":\\\"40\\\",\\\"extra\\\":\\\"margin: 3px;\\ntransition: all 0.4s;\\nbackground-size: cover;\\\"},{\\\"border\\\":\\\"0|*|solid|*|ffffffcc\\\",\\\"opacity\\\":\\\"100\\\",\\\"extra\\\":\\\"\\\"}]}\",\"widget-thumbnail-title-style\":\"{\\\"data\\\":[{\\\"backgroundcolor\\\":\\\"000000ab\\\",\\\"padding\\\":\\\"3|*|10|*|3|*|10|*|px\\\",\\\"boxshadow\\\":\\\"0|*|0|*|0|*|0|*|000000ff\\\",\\\"border\\\":\\\"0|*|solid|*|000000ff\\\",\\\"borderradius\\\":\\\"0\\\",\\\"extra\\\":\\\"bottom: 0;\\nleft: 0;\\\"}]}\",\"widget-thumbnail-title\":\"0\",\"widget-thumbnail-title-font\":\"{\\\"data\\\":[{\\\"color\\\":\\\"ffffffff\\\",\\\"size\\\":\\\"12||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ab\\\",\\\"afont\\\":\\\"Montserrat\\\",\\\"lineheight\\\":\\\"1.2\\\",\\\"bold\\\":0,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"left\\\"},{\\\"color\\\":\\\"fc2828ff\\\",\\\"afont\\\":\\\"google(@import url(http://fonts.googleapis.com/css?family=Raleway);),Arial\\\",\\\"size\\\":\\\"25||px\\\"},{}]}\",\"widget-thumbnail-description\":\"0\",\"widget-thumbnail-description-font\":\"{\\\"data\\\":[{\\\"color\\\":\\\"ffffffff\\\",\\\"size\\\":\\\"12||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ab\\\",\\\"afont\\\":\\\"Montserrat\\\",\\\"lineheight\\\":\\\"1.3\\\",\\\"bold\\\":0,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"left\\\"},{\\\"color\\\":\\\"fc2828ff\\\",\\\"afont\\\":\\\"google(@import url(http://fonts.googleapis.com/css?family=Raleway);),Arial\\\",\\\"size\\\":\\\"25||px\\\"},{}]}\",\"widget-thumbnail-caption-placement\":\"overlay\",\"widget-thumbnail-caption-size\":\"100\",\"widget-thumbnail-arrow\":\"1\",\"widget-thumbnail-arrow-width\":\"26\",\"widget-thumbnail-arrow-offset\":\"0\",\"widget-thumbnail-arrow-prev-alt\":\"previous arrow\",\"widget-thumbnail-arrow-next-alt\":\"next arrow\",\"widget-thumbnail-arrow-image\":\"\",\"widget-thumbnail-group\":\"1\",\"widget-thumbnail-invert-group-direction\":\"0\",\"widget-thumbnail-orientation\":\"auto\",\"widget-thumbnail-size\":\"100%\",\"widget-thumbnail-display-hover\":\"0\",\"widget-thumbnail-display-mobileportrait\":\"1\",\"widget-thumbnail-display-mobilelandscape\":\"1\",\"widget-thumbnail-display-tabletportrait\":\"1\",\"widget-thumbnail-display-tabletlandscape\":\"1\",\"widget-thumbnail-display-desktopportrait\":\"1\",\"widget-thumbnail-display-desktoplandscape\":\"1\",\"widget-thumbnail-exclude-slides\":\"\",\"widget-shadow-enabled\":\"0\",\"widgetshadow\":\"shadow\",\"widget-shadow-shadow\":\"dark.png\",\"widget-shadow-shadow-image\":\"\",\"widget-shadow-width\":\"100%\",\"widget-shadow-display-mobileportrait\":\"1\",\"widget-shadow-display-mobilelandscape\":\"1\",\"widget-shadow-display-tabletportrait\":\"1\",\"widget-shadow-display-tabletlandscape\":\"1\",\"widget-shadow-display-desktopportrait\":\"1\",\"widget-shadow-display-desktoplandscape\":\"1\",\"widget-shadow-exclude-slides\":\"\",\"widget-fullscreen-enabled\":\"0\",\"widgetfullscreen\":\"image\",\"widget-fullscreen-tonormal\":\"full1.svg\",\"widget-fullscreen-tonormal-image\":\"\",\"widget-fullscreen-tonormal-color\":\"ffffffcc\",\"widget-fullscreen-mirror\":\"1\",\"widget-fullscreen-tofull\":\"full1.svg\",\"widget-fullscreen-tofull-image\":\"\",\"widget-fullscreen-tofull-color\":\"ffffffcc\",\"widget-fullscreen-style\":\"{\\\"data\\\":[{\\\"backgroundcolor\\\":\\\"000000ab\\\",\\\"padding\\\":\\\"10|*|10|*|10|*|10|*|px\\\",\\\"boxshadow\\\":\\\"0|*|0|*|0|*|0|*|000000ff\\\",\\\"border\\\":\\\"0|*|solid|*|000000ff\\\",\\\"borderradius\\\":\\\"3\\\",\\\"extra\\\":\\\"\\\"},{\\\"backgroundcolor\\\":\\\"000000ab\\\"}]}\",\"widget-fullscreen-position-mode\":\"simple\",\"widget-fullscreen-position-area\":\"4\",\"widget-fullscreen-position-stack\":\"1\",\"widget-fullscreen-position-offset\":\"15\",\"widget-fullscreen-position-horizontal\":\"left\",\"widget-fullscreen-position-horizontal-position\":\"0\",\"widget-fullscreen-position-horizontal-unit\":\"px\",\"widget-fullscreen-position-vertical\":\"top\",\"widget-fullscreen-position-vertical-position\":\"0\",\"widget-fullscreen-position-vertical-unit\":\"px\",\"widget-fullscreen-responsive-desktop\":\"1\",\"widget-fullscreen-responsive-tablet\":\"0.7\",\"widget-fullscreen-responsive-mobile\":\"0.5\",\"widget-fullscreen-display-hover\":\"0\",\"widget-fullscreen-display-mobileportrait\":\"1\",\"widget-fullscreen-display-mobilelandscape\":\"1\",\"widget-fullscreen-display-tabletportrait\":\"1\",\"widget-fullscreen-display-tabletlandscape\":\"1\",\"widget-fullscreen-display-desktopportrait\":\"1\",\"widget-fullscreen-display-desktoplandscape\":\"1\",\"widget-fullscreen-exclude-slides\":\"\",\"widget-html-enabled\":\"0\",\"widgethtml\":\"html\",\"widget-html-position-mode\":\"simple\",\"widget-html-position-area\":\"2\",\"widget-html-position-stack\":\"1\",\"widget-html-position-offset\":\"0\",\"widget-html-position-horizontal\":\"left\",\"widget-html-position-horizontal-position\":\"0\",\"widget-html-position-horizontal-unit\":\"px\",\"widget-html-position-vertical\":\"top\",\"widget-html-position-vertical-position\":\"0\",\"widget-html-position-vertical-unit\":\"px\",\"widget-html-code\":\"\",\"widget-html-display-hover\":\"0\",\"widget-html-display-mobileportrait\":\"1\",\"widget-html-display-mobilelandscape\":\"1\",\"widget-html-display-tabletportrait\":\"1\",\"widget-html-display-tabletlandscape\":\"1\",\"widget-html-display-desktopportrait\":\"1\",\"widget-html-display-desktoplandscape\":\"1\",\"widget-html-exclude-slides\":\"\",\"animation\":\"fade\",\"animation-duration\":\"500\",\"animation-delay\":\"0\",\"animation-easing\":\"easeOutQuad\",\"carousel\":\"1\",\"background-animation\":\"\",\"background-animation-color\":\"333333ff\",\"background-animation-speed\":\"normal\",\"animation-shifted-background-animation\":\"auto\",\"kenburns-animation\":\"50|*|50|*|\",\"kenburns-animation-speed\":\"default\",\"kenburns-animation-strength\":\"default\",\"shape-divider\":\"\",\"particle\":\"\",\"playfirstlayer\":\"1\",\"playonce\":\"0\",\"layer-animation-play-in\":\"end\",\"layer-animation-play-mode\":\"skippable\",\"parallax-enabled\":\"1\",\"parallax-enabled-mobile\":\"0\",\"parallax-3d\":\"0\",\"parallax-animate\":\"1\",\"parallax-horizontal\":\"mouse\",\"parallax-vertical\":\"mouse\",\"parallax-mouse-origin\":\"slider\",\"parallax-scroll-move\":\"both\",\"autoplay\":\"0\",\"autoplayDuration\":\"8000\",\"autoplayStart\":\"1\",\"autoplayAllowReStart\":\"0\",\"autoplayLoop\":\"1\",\"autoplayfinish\":\"1|*|loop|*|current\",\"loop-single-slide\":\"0\",\"autoplayStopClick\":\"1\",\"autoplayStopMouse\":\"0\",\"autoplayStopMedia\":\"1\",\"autoplayResumeClick\":\"0\",\"autoplayResumeMouse\":\"0\",\"autoplayResumeMedia\":\"1\",\"widget-autoplay-enabled\":\"0\",\"widgetautoplay\":\"image\",\"widget-autoplay-play\":\"small-light.svg\",\"widget-autoplay-play-image\":\"\",\"widget-autoplay-play-color\":\"ffffffcc\",\"widget-autoplay-style\":\"{\\\"data\\\":[{\\\"backgroundcolor\\\":\\\"000000ab\\\",\\\"padding\\\":\\\"10|*|10|*|10|*|10|*|px\\\",\\\"boxshadow\\\":\\\"0|*|0|*|0|*|0|*|000000ff\\\",\\\"border\\\":\\\"0|*|solid|*|000000ff\\\",\\\"borderradius\\\":\\\"3\\\",\\\"extra\\\":\\\"\\\"},{\\\"backgroundcolor\\\":\\\"000000ab\\\"}]}\",\"widget-autoplay-mirror\":\"1\",\"widget-autoplay-pause\":\"small-light.svg\",\"widget-autoplay-pause-image\":\"\",\"widget-autoplay-pause-color\":\"ffffffcc\",\"widget-autoplay-responsive-desktop\":\"1\",\"widget-autoplay-responsive-tablet\":\"0.7\",\"widget-autoplay-responsive-mobile\":\"0.5\",\"widget-autoplay-position-mode\":\"simple\",\"widget-autoplay-position-area\":\"4\",\"widget-autoplay-position-stack\":\"1\",\"widget-autoplay-position-offset\":\"15\",\"widget-autoplay-position-horizontal\":\"left\",\"widget-autoplay-position-horizontal-position\":\"0\",\"widget-autoplay-position-horizontal-unit\":\"px\",\"widget-autoplay-position-vertical\":\"top\",\"widget-autoplay-position-vertical-position\":\"0\",\"widget-autoplay-position-vertical-unit\":\"px\",\"widget-autoplay-display-hover\":\"0\",\"widget-autoplay-display-mobileportrait\":\"1\",\"widget-autoplay-display-mobilelandscape\":\"1\",\"widget-autoplay-display-tabletportrait\":\"1\",\"widget-autoplay-display-tabletlandscape\":\"1\",\"widget-autoplay-display-desktopportrait\":\"1\",\"widget-autoplay-display-desktoplandscape\":\"1\",\"widget-autoplay-exclude-slides\":\"\",\"widget-indicator-enabled\":\"0\",\"widgetindicator\":\"pie\",\"widget-indicator-position-mode\":\"simple\",\"widget-indicator-position-area\":\"4\",\"widget-indicator-position-stack\":\"1\",\"widget-indicator-position-offset\":\"15\",\"widget-indicator-position-horizontal\":\"left\",\"widget-indicator-position-horizontal-position\":\"0\",\"widget-indicator-position-horizontal-unit\":\"px\",\"widget-indicator-position-vertical\":\"top\",\"widget-indicator-position-vertical-position\":\"0\",\"widget-indicator-position-vertical-unit\":\"px\",\"widget-indicator-size\":\"25\",\"widget-indicator-thickness\":\"30\",\"widget-indicator-track\":\"000000ab\",\"widget-indicator-bar\":\"ffffffff\",\"widget-indicator-style\":\"\",\"widget-indicator-display-hover\":\"0\",\"widget-indicator-display-mobileportrait\":\"1\",\"widget-indicator-display-mobilelandscape\":\"1\",\"widget-indicator-display-tabletportrait\":\"1\",\"widget-indicator-display-tabletlandscape\":\"1\",\"widget-indicator-display-desktopportrait\":\"1\",\"widget-indicator-display-desktoplandscape\":\"1\",\"widget-indicator-exclude-slides\":\"\",\"imageload\":\"0\",\"imageloadNeighborSlides\":\"0\",\"optimize-scale\":\"0\",\"optimize-quality\":\"70\",\"optimize-thumbnail-scale\":\"0\",\"optimize-thumbnail-quality\":\"70\",\"optimize-slide-width-normal\":\"1920\",\"optimizeThumbnailWidth\":\"100\",\"optimizeThumbnailHeight\":\"60\",\"layer-image-optimize\":\"0\",\"layer-image-width-tablet\":\"800\",\"layer-image-width-mobile\":\"425\",\"layer-image-base64\":\"0\",\"layer-image-base64-size\":\"50\",\"slides-background-video-mobile\":\"1\",\"playWhenVisible\":\"1\",\"playWhenVisibleAt\":\"50\",\"dependency\":\"\",\"delay\":\"0\",\"is-delayed\":\"0\",\"backgroundMode\":\"fill\",\"slide-css\":\"\",\"randomize\":\"0\",\"randomizeFirst\":\"0\",\"randomize-cache\":\"1\",\"variations\":\"5\",\"reverse-slides\":\"0\",\"maximumslidecount\":\"1000\",\"maintain-session\":\"0\",\"global-lightbox\":\"0\",\"global-lightbox-label\":\"0\",\"slide-background-parallax\":\"0\",\"slide-background-parallax-strength\":\"50\",\"bg-parallax-tablet\":\"0\",\"bg-parallax-mobile\":\"0\",\"blockrightclick\":\"0\",\"controlsBlockCarouselInteraction\":\"1\",\"clear-both\":\"1\",\"clear-both-after\":\"1\",\"overflow-hidden-page\":\"0\",\"responsiveFocusUser\":\"1\",\"responsiveFocusEdge\":\"auto\",\"classes\":\"\",\"custom-css-codes\":\"\",\"callbacks\":\"\",\"related-posts\":\"\"}', 'published', '2020-02-25 13:53:41', 'https://smartslider3.com/wp-content/uploads/slider404/tutorialsliderthumbnail-1.png', 0);
COMMIT;

-- ----------------------------
-- Table structure for wp_nextend2_smartslider3_sliders_xref
-- ----------------------------
DROP TABLE IF EXISTS `wp_nextend2_smartslider3_sliders_xref`;
CREATE TABLE `wp_nextend2_smartslider3_sliders_xref` (
  `group_id` int(11) NOT NULL,
  `slider_id` int(11) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`,`slider_id`),
  KEY `ordering` (`ordering`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of wp_nextend2_smartslider3_sliders_xref
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wp_nextend2_smartslider3_slides
-- ----------------------------
DROP TABLE IF EXISTS `wp_nextend2_smartslider3_slides`;
CREATE TABLE `wp_nextend2_smartslider3_slides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `slider` int(11) NOT NULL,
  `publish_up` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `published` tinyint(1) NOT NULL,
  `first` int(11) NOT NULL,
  `slide` longtext COLLATE utf8mb4_unicode_520_ci,
  `description` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `ordering` int(11) NOT NULL,
  `generator_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`),
  KEY `publish_up` (`publish_up`),
  KEY `publish_down` (`publish_down`),
  KEY `generator_id` (`generator_id`),
  KEY `ordering` (`ordering`),
  KEY `slider` (`slider`),
  KEY `thumbnail` (`thumbnail`(100))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of wp_nextend2_smartslider3_slides
-- ----------------------------
BEGIN;
INSERT INTO `wp_nextend2_smartslider3_slides` VALUES (1, 'Slide Background', 1, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 0, '[{\"type\":\"content\",\"pm\":\"default\",\"desktopportraitfontsize\":100,\"desktopportraitmaxwidth\":1120,\"desktopportraitinneralign\":\"inherit\",\"desktopportraitpadding\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitselfalign\":\"center\",\"opened\":1,\"id\":\"\",\"uniqueclass\":\"n-uc-IbNOabpfT5aE\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"bgimage\":\"\",\"bgimagex\":50,\"bgimagey\":50,\"bgcolor\":\"00000000\",\"bgcolorgradient\":\"off\",\"bgcolorgradientend\":\"00000000\",\"verticalalign\":\"center\",\"layers\":[{\"type\":\"row\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitinneralign\":\"inherit\",\"desktopportraitpadding\":\"10|*|0|*|10|*|0|*|px\",\"desktopportraitgutter\":0,\"desktopportraitwrapafter\":0,\"desktopportraitmargin\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitpadding\":\"10|*|0|*|10|*|0|*|px\",\"tabletportraitgutter\":20,\"mobileportraitpadding\":\"0|*|0|*|0|*|0|*|px\",\"mobileportraitgutter\":20,\"mobileportraitwrapafter\":1,\"mobileportraitmaxwidth\":400,\"mobilelandscapewrapafter\":1,\"opened\":1,\"id\":\"\",\"uniqueclass\":\"n-uc-dtwtw9DVCwgQ\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"href\":\"\",\"href-target\":\"_self\",\"bgimage\":\"\",\"bgimagex\":50,\"bgimagey\":50,\"bgcolor\":\"ffffff00\",\"bgcolorgradient\":\"off\",\"bgcolorgradientend\":\"00000000\",\"borderwidth\":\"1|*|1|*|1|*|1\",\"borderstyle\":\"none\",\"bordercolor\":\"FFFFFFFF\",\"borderradius\":0,\"boxshadow\":\"0|*|0|*|0|*|0|*|00000080\",\"fullwidth\":1,\"stretch\":0,\"name\":\"Row\",\"namesynced\":1,\"cols\":[{\"type\":\"col\",\"pm\":\"default\",\"desktopportraitfontsize\":100,\"desktopportraitmaxwidth\":0,\"desktopportraitinneralign\":\"left\",\"desktopportraitpadding\":\"10|*|10|*|10|*|10|*|px\",\"desktopportraitorder\":0,\"tabletportraitpadding\":\"10|*|0|*|10|*|0|*|px\",\"mobileportraitinneralign\":\"left\",\"mobileportraitpadding\":\"10|*|0|*|10|*|0|*|px\",\"mobileportraitorder\":2,\"opened\":1,\"id\":\"\",\"uniqueclass\":\"n-uc-Fjvyu081qJeK\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"bgimage\":\"\",\"bgimagex\":50,\"bgimagey\":50,\"bgcolor\":\"00000000\",\"bgcolorgradient\":\"off\",\"bgcolorgradientend\":\"00000000\",\"verticalalign\":\"center\",\"colwidth\":\"2/5\",\"href\":\"\",\"href-target\":\"_self\",\"borderradius\":0,\"boxshadow\":\"0|*|0|*|0|*|0|*|00000080\",\"borderwidth\":\"0|*|0|*|0|*|0\",\"borderstyle\":\"solid\",\"bordercolor\":\"ffffffff\",\"name\":\"Column\",\"namesynced\":1,\"layers\":[{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitfontsize\":80,\"mobileportraitfontsize\":60,\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Jeans Store Interior\",\"namesynced\":1,\"item\":{\"type\":\"heading\",\"values\":{\"font\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"ffffffff\\\",\\\"size\\\":\\\"36||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ff\\\",\\\"afont\\\":\\\"Roboto\\\",\\\"lineheight\\\":\\\"1.2\\\",\\\"weight\\\":1,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"inherit\\\",\\\"letterspacing\\\":\\\"normal\\\",\\\"wordspacing\\\":\\\"normal\\\",\\\"texttransform\\\":\\\"none\\\"},{\\\"extra\\\":\\\"\\\"}]}\",\"style\":\"\",\"priority\":\"div\",\"fullwidth\":\"1\",\"nowrap\":\"0\",\"heading\":\"01. Slide Background\",\"title\":\"\",\"href\":\"#\",\"href-target\":\"_self\",\"href-rel\":\"\",\"split-text-transform-origin\":\"50|*|50|*|0\",\"split-text-backface-visibility\":\"1\",\"split-text-animation-in\":\"\",\"split-text-delay-in\":\"0\",\"split-text-animation-out\":\"\",\"split-text-delay-out\":\"0\",\"class\":\"\"}}},{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitfontsize\":80,\"mobileportraitfontsize\":70,\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Lorem ipsum dolor sit amet, consect\",\"namesynced\":1,\"item\":{\"type\":\"heading\",\"values\":{\"font\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"ffffffb0\\\",\\\"size\\\":\\\"24||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ff\\\",\\\"afont\\\":\\\"Roboto\\\",\\\"lineheight\\\":\\\"1.3\\\",\\\"weight\\\":300,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"inherit\\\",\\\"letterspacing\\\":\\\"normal\\\",\\\"wordspacing\\\":\\\"normal\\\",\\\"texttransform\\\":\\\"none\\\"},{\\\"extra\\\":\\\"\\\"}]}\",\"style\":\"\",\"priority\":\"div\",\"fullwidth\":\"1\",\"nowrap\":\"0\",\"heading\":\"Every slide includes a background, which can be a picture or solid color.\",\"title\":\"\",\"href\":\"#\",\"href-target\":\"_self\",\"href-rel\":\"\",\"split-text-transform-origin\":\"50|*|50|*|0\",\"split-text-backface-visibility\":\"1\",\"split-text-animation-in\":\"\",\"split-text-delay-in\":\"0\",\"split-text-animation-out\":\"\",\"split-text-delay-out\":\"0\",\"class\":\"\"}}},{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"20|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitfontsize\":100,\"mobileportraitfontsize\":80,\"mobileportraitmargin\":\"10|*|0|*|0|*|0|*|px\",\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Latest Project\",\"namesynced\":1,\"item\":{\"type\":\"heading\",\"values\":{\"font\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"ffffffdb\\\",\\\"size\\\":\\\"14||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ff\\\",\\\"afont\\\":\\\"Roboto\\\",\\\"lineheight\\\":\\\"1.5\\\",\\\"weight\\\":1,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"inherit\\\",\\\"letterspacing\\\":\\\"1px\\\",\\\"wordspacing\\\":\\\"normal\\\",\\\"texttransform\\\":\\\"uppercase\\\"},{\\\"extra\\\":\\\"\\\"}]}\",\"style\":\"\",\"priority\":\"div\",\"fullwidth\":\"1\",\"nowrap\":\"0\",\"heading\":\"Step 1\",\"title\":\"\",\"href\":\"#\",\"href-target\":\"_self\",\"href-rel\":\"\",\"split-text-transform-origin\":\"50|*|50|*|0\",\"split-text-backface-visibility\":\"1\",\"split-text-animation-in\":\"\",\"split-text-delay-in\":\"0\",\"split-text-animation-out\":\"\",\"split-text-delay-out\":\"0\",\"class\":\"\"}}},{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitfontsize\":90,\"mobileportraitfontsize\":70,\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Text\",\"namesynced\":1,\"item\":{\"type\":\"text\",\"values\":{\"font\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"ffffffb0\\\",\\\"size\\\":\\\"18||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ff\\\",\\\"afont\\\":\\\"Roboto\\\",\\\"lineheight\\\":\\\"1.6\\\",\\\"weight\\\":400,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"inherit\\\",\\\"letterspacing\\\":\\\"normal\\\",\\\"wordspacing\\\":\\\"normal\\\",\\\"texttransform\\\":\\\"none\\\"},{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"1890d7ff\\\"},{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"1890d7ff\\\"}]}\",\"style\":\"\",\"content\":\"To change the background click on the label bar and in the layer window select the style tab.\",\"content-tablet-enabled\":\"0\",\"contenttablet\":\"\",\"content-mobile-enabled\":\"0\",\"contentmobile\":\"\"}}},{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"20|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitfontsize\":100,\"mobileportraitfontsize\":80,\"mobileportraitmargin\":\"10|*|0|*|0|*|0|*|px\",\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Latest Project\",\"namesynced\":1,\"item\":{\"type\":\"heading\",\"values\":{\"font\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"ffffffdb\\\",\\\"size\\\":\\\"14||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ff\\\",\\\"afont\\\":\\\"Roboto\\\",\\\"lineheight\\\":\\\"1.5\\\",\\\"weight\\\":1,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"inherit\\\",\\\"letterspacing\\\":\\\"1px\\\",\\\"wordspacing\\\":\\\"normal\\\",\\\"texttransform\\\":\\\"uppercase\\\"},{\\\"extra\\\":\\\"\\\"}]}\",\"style\":\"\",\"priority\":\"div\",\"fullwidth\":\"1\",\"nowrap\":\"0\",\"heading\":\"Step 2\",\"title\":\"\",\"href\":\"#\",\"href-target\":\"_self\",\"href-rel\":\"\",\"split-text-transform-origin\":\"50|*|50|*|0\",\"split-text-backface-visibility\":\"1\",\"split-text-animation-in\":\"\",\"split-text-delay-in\":\"0\",\"split-text-animation-out\":\"\",\"split-text-delay-out\":\"0\",\"class\":\"\"}}},{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitfontsize\":90,\"mobileportraitfontsize\":70,\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Text\",\"namesynced\":1,\"item\":{\"type\":\"text\",\"values\":{\"font\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"ffffffb0\\\",\\\"size\\\":\\\"18||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ff\\\",\\\"afont\\\":\\\"Roboto\\\",\\\"lineheight\\\":\\\"1.6\\\",\\\"weight\\\":400,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"inherit\\\",\\\"letterspacing\\\":\\\"normal\\\",\\\"wordspacing\\\":\\\"normal\\\",\\\"texttransform\\\":\\\"none\\\"},{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"1890d7ff\\\"},{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"1890d7ff\\\"}]}\",\"style\":\"\",\"content\":\"Choose a source from the background top tab then upload an image or pick a background color.\",\"content-tablet-enabled\":\"0\",\"contenttablet\":\"\",\"content-mobile-enabled\":\"0\",\"contentmobile\":\"\"}}},{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"20|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitfontsize\":80,\"mobileportraitfontsize\":80,\"mobileportraitmargin\":\"10|*|0|*|0|*|0|*|px\",\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Read More\",\"namesynced\":1,\"item\":{\"type\":\"button\",\"values\":{\"font\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"ffffffff\\\",\\\"size\\\":\\\"14||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ff\\\",\\\"afont\\\":\\\"Roboto\\\",\\\"lineheight\\\":\\\"1.5\\\",\\\"weight\\\":1,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"center\\\",\\\"letterspacing\\\":\\\"1px\\\",\\\"wordspacing\\\":\\\"normal\\\",\\\"texttransform\\\":\\\"none\\\"},{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"0568f6ff\\\"}]}\",\"style\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"backgroundcolor\\\":\\\"0568f6ff\\\",\\\"opacity\\\":100,\\\"padding\\\":\\\"1|*|2|*|1|*|2|*|em\\\",\\\"boxshadow\\\":\\\"0|*|0|*|0|*|0|*|000000ff\\\",\\\"border\\\":\\\"0|*|solid|*|000000ff\\\",\\\"borderradius\\\":\\\"5\\\"},{\\\"extra\\\":\\\"\\\",\\\"backgroundcolor\\\":\\\"ffffffff\\\"}]}\",\"content\":\"Next Slide\",\"nowrap\":\"1\",\"fullwidth\":\"0\",\"href\":\"NextSlide[]\",\"href-target\":\"_self\",\"href-rel\":\"\",\"class\":\"\",\"icon\":\"\",\"iconsize\":\"100\",\"iconspacing\":\"30\",\"iconplacement\":\"left\"}}}]},{\"type\":\"col\",\"pm\":\"default\",\"desktopportraitfontsize\":100,\"desktopportraitmaxwidth\":0,\"desktopportraitinneralign\":\"left\",\"desktopportraitpadding\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitorder\":0,\"mobileportraitinneralign\":\"center\",\"mobileportraitorder\":1,\"opened\":1,\"id\":\"\",\"uniqueclass\":\"n-uc-LnImbm1HgUAv\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"bgimage\":\"\",\"bgimagex\":50,\"bgimagey\":50,\"bgcolor\":\"00000000\",\"bgcolorgradient\":\"off\",\"bgcolorgradientend\":\"00000000\",\"verticalalign\":\"center\",\"colwidth\":\"3/5\",\"href\":\"\",\"href-target\":\"_self\",\"borderradius\":0,\"boxshadow\":\"0|*|0|*|0|*|0|*|00000080\",\"borderwidth\":\"0|*|0|*|0|*|0\",\"borderstyle\":\"solid\",\"bordercolor\":\"ffffffff\",\"name\":\"Column\",\"namesynced\":1,\"layers\":[{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"mobileportraitmaxwidth\":300,\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Image\",\"namesynced\":1,\"item\":{\"type\":\"image\",\"values\":{\"image\":\"https://smartslider3.com/wp-content/uploads/slider424/background.png\",\"href\":\"#\",\"href-target\":\"_self\",\"href-rel\":\"\",\"size\":\"auto|*|auto\",\"alt\":\"\",\"title\":\"\",\"href-class\":\"\"}}}]}]}]}]', '', 'https://smartslider3.com/wp-content/uploads/slider424/slidebackground.jpg', '{\"type\":\"slide\",\"desktopportraitfontsize\":100,\"desktopportraitpadding\":\"10|*|60|*|10|*|60\",\"tabletportraitpadding\":\"10|*|50|*|10|*|50\",\"mobileportraitpadding\":\"10|*|10|*|35|*|10\",\"record-slides\":0,\"thumbnailType\":\"default\",\"static-slide\":0,\"slide-duration\":0,\"ligthboxImage\":\"\",\"background-animation\":\"\",\"background-animation-color\":\"333333ff\",\"background-animation-speed\":\"default\",\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"href\":\"\",\"href-target\":\"\",\"background-type\":\"image\",\"backgroundColor\":\"ffffff00\",\"backgroundGradient\":\"off\",\"backgroundColorEnd\":\"ffffff00\",\"backgroundColorOverlay\":0,\"backgroundImage\":\"https://smartslider3.com/wp-content/uploads/slider424/slide1.png\",\"backgroundFocusX\":50,\"backgroundFocusY\":50,\"backgroundImageOpacity\":100,\"backgroundImageBlur\":0,\"backgroundAlt\":\"\",\"backgroundTitle\":\"\",\"backgroundMode\":\"default\",\"guides\":\"eyJob3Jpem9udGFsIjpbXSwidmVydGljYWwiOltdfQ==\",\"version\":\"3.4.0\"}', 1, 0);
INSERT INTO `wp_nextend2_smartslider3_slides` VALUES (2, 'Build & Design', 1, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 0, '[{\"type\":\"content\",\"pm\":\"default\",\"desktopportraitfontsize\":100,\"desktopportraitmaxwidth\":1120,\"desktopportraitinneralign\":\"inherit\",\"desktopportraitpadding\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitselfalign\":\"center\",\"opened\":1,\"id\":\"\",\"uniqueclass\":\"n-uc-TPnUuKlAWVoC\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"bgimage\":\"\",\"bgimagex\":50,\"bgimagey\":50,\"bgcolor\":\"00000000\",\"bgcolorgradient\":\"off\",\"bgcolorgradientend\":\"00000000\",\"verticalalign\":\"center\",\"layers\":[{\"type\":\"row\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitinneralign\":\"inherit\",\"desktopportraitpadding\":\"10|*|0|*|10|*|0|*|px\",\"desktopportraitgutter\":0,\"desktopportraitwrapafter\":0,\"desktopportraitmargin\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitpadding\":\"10|*|0|*|10|*|0|*|px\",\"tabletportraitgutter\":20,\"mobileportraitinneralign\":\"inherit\",\"mobileportraitpadding\":\"0|*|0|*|0|*|0|*|px\",\"mobileportraitgutter\":20,\"mobileportraitwrapafter\":1,\"mobileportraitmaxwidth\":400,\"mobileportraitselfalign\":\"inherit\",\"mobilelandscapewrapafter\":1,\"opened\":1,\"id\":\"\",\"uniqueclass\":\"n-uc-NmnNQvKK01kO\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"href\":\"\",\"href-target\":\"_self\",\"bgimage\":\"\",\"bgimagex\":50,\"bgimagey\":50,\"bgcolor\":\"ffffff00\",\"bgcolorgradient\":\"off\",\"bgcolorgradientend\":\"00000000\",\"borderwidth\":\"1|*|1|*|1|*|1\",\"borderstyle\":\"none\",\"bordercolor\":\"FFFFFFFF\",\"borderradius\":0,\"boxshadow\":\"0|*|0|*|0|*|0|*|00000080\",\"fullwidth\":1,\"stretch\":0,\"name\":\"Row\",\"namesynced\":1,\"cols\":[{\"type\":\"col\",\"pm\":\"default\",\"desktopportraitfontsize\":100,\"desktopportraitmaxwidth\":0,\"desktopportraitinneralign\":\"left\",\"desktopportraitpadding\":\"10|*|10|*|10|*|10|*|px\",\"desktopportraitorder\":0,\"tabletportraitpadding\":\"10|*|0|*|10|*|0|*|px\",\"mobileportraitmaxwidth\":0,\"mobileportraitinneralign\":\"left\",\"mobileportraitpadding\":\"10|*|0|*|10|*|0|*|px\",\"mobileportraitorder\":2,\"opened\":1,\"id\":\"\",\"uniqueclass\":\"n-uc-R5Jkk06Nmzr4\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"bgimage\":\"\",\"bgimagex\":50,\"bgimagey\":50,\"bgcolor\":\"00000000\",\"bgcolorgradient\":\"off\",\"bgcolorgradientend\":\"00000000\",\"verticalalign\":\"center\",\"colwidth\":\"2/5\",\"href\":\"\",\"href-target\":\"_self\",\"borderradius\":0,\"boxshadow\":\"0|*|0|*|0|*|0|*|00000080\",\"borderwidth\":\"0|*|0|*|0|*|0\",\"borderstyle\":\"solid\",\"bordercolor\":\"ffffffff\",\"name\":\"Column\",\"namesynced\":1,\"layers\":[{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitfontsize\":80,\"mobileportraitfontsize\":60,\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Jeans Store Interior\",\"namesynced\":1,\"item\":{\"type\":\"heading\",\"values\":{\"font\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"ffffffff\\\",\\\"size\\\":\\\"36||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ff\\\",\\\"afont\\\":\\\"Roboto\\\",\\\"lineheight\\\":\\\"1.2\\\",\\\"weight\\\":1,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"inherit\\\",\\\"letterspacing\\\":\\\"normal\\\",\\\"wordspacing\\\":\\\"normal\\\",\\\"texttransform\\\":\\\"none\\\"},{\\\"extra\\\":\\\"\\\"}]}\",\"style\":\"\",\"priority\":\"div\",\"fullwidth\":\"1\",\"nowrap\":\"0\",\"heading\":\"02. Build & Design\",\"title\":\"\",\"href\":\"#\",\"href-target\":\"_self\",\"href-rel\":\"\",\"split-text-transform-origin\":\"50|*|50|*|0\",\"split-text-backface-visibility\":\"1\",\"split-text-animation-in\":\"\",\"split-text-delay-in\":\"0\",\"split-text-animation-out\":\"\",\"split-text-delay-out\":\"0\",\"class\":\"\"}}},{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitfontsize\":80,\"mobileportraitfontsize\":70,\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Lorem ipsum dolor sit amet, consect\",\"namesynced\":1,\"item\":{\"type\":\"heading\",\"values\":{\"font\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"ffffffb0\\\",\\\"size\\\":\\\"24||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ff\\\",\\\"afont\\\":\\\"Roboto\\\",\\\"lineheight\\\":\\\"1.3\\\",\\\"weight\\\":300,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"inherit\\\",\\\"letterspacing\\\":\\\"normal\\\",\\\"wordspacing\\\":\\\"normal\\\",\\\"texttransform\\\":\\\"none\\\"},{\\\"extra\\\":\\\"\\\"}]}\",\"style\":\"\",\"priority\":\"div\",\"fullwidth\":\"1\",\"nowrap\":\"0\",\"heading\":\"Build any layout with layers and customize your designs limitlessly.\",\"title\":\"\",\"href\":\"#\",\"href-target\":\"_self\",\"href-rel\":\"\",\"split-text-transform-origin\":\"50|*|50|*|0\",\"split-text-backface-visibility\":\"1\",\"split-text-animation-in\":\"\",\"split-text-delay-in\":\"0\",\"split-text-animation-out\":\"\",\"split-text-delay-out\":\"0\",\"class\":\"\"}}},{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"20|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitfontsize\":100,\"mobileportraitfontsize\":80,\"mobileportraitmargin\":\"10|*|0|*|0|*|0|*|px\",\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Latest Project\",\"namesynced\":1,\"item\":{\"type\":\"heading\",\"values\":{\"font\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"ffffffdb\\\",\\\"size\\\":\\\"14||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ff\\\",\\\"afont\\\":\\\"Roboto\\\",\\\"lineheight\\\":\\\"1.5\\\",\\\"weight\\\":1,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"inherit\\\",\\\"letterspacing\\\":\\\"1px\\\",\\\"wordspacing\\\":\\\"normal\\\",\\\"texttransform\\\":\\\"uppercase\\\"},{\\\"extra\\\":\\\"\\\"}]}\",\"style\":\"\",\"priority\":\"div\",\"fullwidth\":\"1\",\"nowrap\":\"0\",\"heading\":\"Step 1\",\"title\":\"\",\"href\":\"#\",\"href-target\":\"_self\",\"href-rel\":\"\",\"split-text-transform-origin\":\"50|*|50|*|0\",\"split-text-backface-visibility\":\"1\",\"split-text-animation-in\":\"\",\"split-text-delay-in\":\"0\",\"split-text-animation-out\":\"\",\"split-text-delay-out\":\"0\",\"class\":\"\"}}},{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitfontsize\":90,\"mobileportraitfontsize\":70,\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Text\",\"namesynced\":1,\"item\":{\"type\":\"text\",\"values\":{\"font\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"ffffffb0\\\",\\\"size\\\":\\\"18||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ff\\\",\\\"afont\\\":\\\"Roboto\\\",\\\"lineheight\\\":\\\"1.6\\\",\\\"weight\\\":400,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"inherit\\\",\\\"letterspacing\\\":\\\"normal\\\",\\\"wordspacing\\\":\\\"normal\\\",\\\"texttransform\\\":\\\"none\\\"},{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"1890d7ff\\\"},{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"1890d7ff\\\"}]}\",\"style\":\"\",\"content\":\"To add a layer, click the green plus button in the left sidebar and select the type of layer.\",\"content-tablet-enabled\":\"0\",\"contenttablet\":\"\",\"content-mobile-enabled\":\"0\",\"contentmobile\":\"\"}}},{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"20|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitfontsize\":100,\"mobileportraitfontsize\":80,\"mobileportraitmargin\":\"10|*|0|*|0|*|0|*|px\",\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Latest Project\",\"namesynced\":1,\"item\":{\"type\":\"heading\",\"values\":{\"font\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"ffffffdb\\\",\\\"size\\\":\\\"14||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ff\\\",\\\"afont\\\":\\\"Roboto\\\",\\\"lineheight\\\":\\\"1.5\\\",\\\"weight\\\":1,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"inherit\\\",\\\"letterspacing\\\":\\\"1px\\\",\\\"wordspacing\\\":\\\"normal\\\",\\\"texttransform\\\":\\\"uppercase\\\"},{\\\"extra\\\":\\\"\\\"}]}\",\"style\":\"\",\"priority\":\"div\",\"fullwidth\":\"1\",\"nowrap\":\"0\",\"heading\":\"Step 2\",\"title\":\"\",\"href\":\"#\",\"href-target\":\"_self\",\"href-rel\":\"\",\"split-text-transform-origin\":\"50|*|50|*|0\",\"split-text-backface-visibility\":\"1\",\"split-text-animation-in\":\"\",\"split-text-delay-in\":\"0\",\"split-text-animation-out\":\"\",\"split-text-delay-out\":\"0\",\"class\":\"\"}}},{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitfontsize\":90,\"mobileportraitfontsize\":70,\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Text\",\"namesynced\":1,\"item\":{\"type\":\"text\",\"values\":{\"font\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"ffffffb0\\\",\\\"size\\\":\\\"18||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ff\\\",\\\"afont\\\":\\\"Roboto\\\",\\\"lineheight\\\":\\\"1.6\\\",\\\"weight\\\":400,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"inherit\\\",\\\"letterspacing\\\":\\\"normal\\\",\\\"wordspacing\\\":\\\"normal\\\",\\\"texttransform\\\":\\\"none\\\"},{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"1890d7ff\\\"},{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"1890d7ff\\\"}]}\",\"style\":\"\",\"content\":\"Select any layer and you can edit its content and style properties in the layer window.\",\"content-tablet-enabled\":\"0\",\"contenttablet\":\"\",\"content-mobile-enabled\":\"0\",\"contentmobile\":\"\"}}},{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"20|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitfontsize\":80,\"mobileportraitfontsize\":80,\"mobileportraitmargin\":\"10|*|0|*|0|*|0|*|px\",\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Read More\",\"namesynced\":1,\"item\":{\"type\":\"button\",\"values\":{\"font\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"ffffffff\\\",\\\"size\\\":\\\"14||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ff\\\",\\\"afont\\\":\\\"Roboto\\\",\\\"lineheight\\\":\\\"1.5\\\",\\\"weight\\\":1,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"center\\\",\\\"letterspacing\\\":\\\"1px\\\",\\\"wordspacing\\\":\\\"normal\\\",\\\"texttransform\\\":\\\"none\\\"},{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"0568f6ff\\\"}]}\",\"style\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"backgroundcolor\\\":\\\"0568f6ff\\\",\\\"opacity\\\":100,\\\"padding\\\":\\\"1|*|2|*|1|*|2|*|em\\\",\\\"boxshadow\\\":\\\"0|*|0|*|0|*|0|*|000000ff\\\",\\\"border\\\":\\\"0|*|solid|*|000000ff\\\",\\\"borderradius\\\":\\\"5\\\"},{\\\"extra\\\":\\\"\\\",\\\"backgroundcolor\\\":\\\"ffffffff\\\"}]}\",\"content\":\"Next Slide\",\"nowrap\":\"1\",\"fullwidth\":\"0\",\"href\":\"NextSlide[]\",\"href-target\":\"_self\",\"href-rel\":\"\",\"class\":\"\",\"icon\":\"\",\"iconsize\":\"100\",\"iconspacing\":\"30\",\"iconplacement\":\"left\"}}}]},{\"type\":\"col\",\"pm\":\"default\",\"desktopportraitfontsize\":100,\"desktopportraitmaxwidth\":0,\"desktopportraitinneralign\":\"left\",\"desktopportraitpadding\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitorder\":0,\"mobileportraitinneralign\":\"center\",\"mobileportraitorder\":1,\"opened\":1,\"id\":\"\",\"uniqueclass\":\"n-uc-iYi6ZKk8yeVp\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"bgimage\":\"\",\"bgimagex\":50,\"bgimagey\":50,\"bgcolor\":\"00000000\",\"bgcolorgradient\":\"off\",\"bgcolorgradientend\":\"00000000\",\"verticalalign\":\"center\",\"colwidth\":\"3/5\",\"href\":\"\",\"href-target\":\"_self\",\"borderradius\":0,\"boxshadow\":\"0|*|0|*|0|*|0|*|00000080\",\"borderwidth\":\"0|*|0|*|0|*|0\",\"borderstyle\":\"solid\",\"bordercolor\":\"ffffffff\",\"name\":\"Column\",\"namesynced\":1,\"layers\":[{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"mobileportraitmaxwidth\":300,\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Image\",\"namesynced\":1,\"item\":{\"type\":\"image\",\"values\":{\"image\":\"https://smartslider3.com/wp-content/uploads/slider424/buildanddesign.png\",\"href\":\"#\",\"href-target\":\"_self\",\"href-rel\":\"\",\"size\":\"auto|*|auto\",\"alt\":\"\",\"title\":\"\",\"href-class\":\"\"}}}]}]}]}]', '', 'https://smartslider3.com/wp-content/uploads/slider424/buildanddesign.jpg', '{\"type\":\"slide\",\"desktopportraitfontsize\":100,\"desktopportraitpadding\":\"10|*|60|*|10|*|60\",\"tabletportraitpadding\":\"10|*|50|*|10|*|50\",\"mobileportraitpadding\":\"10|*|10|*|35|*|10\",\"record-slides\":0,\"thumbnailType\":\"default\",\"static-slide\":0,\"slide-duration\":0,\"ligthboxImage\":\"\",\"background-animation\":\"\",\"background-animation-color\":\"333333ff\",\"background-animation-speed\":\"default\",\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"href\":\"\",\"href-target\":\"\",\"background-type\":\"image\",\"backgroundColor\":\"ffffff00\",\"backgroundGradient\":\"off\",\"backgroundColorEnd\":\"ffffff00\",\"backgroundColorOverlay\":0,\"backgroundImage\":\"https://smartslider3.com/wp-content/uploads/slider424/slide2.png\",\"backgroundFocusX\":50,\"backgroundFocusY\":50,\"backgroundImageOpacity\":100,\"backgroundImageBlur\":0,\"backgroundAlt\":\"\",\"backgroundTitle\":\"\",\"backgroundMode\":\"default\",\"guides\":\"eyJob3Jpem9udGFsIjpbXSwidmVydGljYWwiOltdfQ==\",\"version\":\"3.4.0\"}', 2, 0);
COMMIT;

-- ----------------------------
-- Table structure for wp_options
-- ----------------------------
DROP TABLE IF EXISTS `wp_options`;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=InnoDB AUTO_INCREMENT=486 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of wp_options
-- ----------------------------
BEGIN;
INSERT INTO `wp_options` VALUES (1, 'siteurl', 'http://localhost:82/wpbaru', 'yes');
INSERT INTO `wp_options` VALUES (2, 'home', 'http://localhost:82/wpbaru', 'yes');
INSERT INTO `wp_options` VALUES (3, 'blogname', 'PT. Transporindo Agung Sejahtera', 'yes');
INSERT INTO `wp_options` VALUES (4, 'blogdescription', 'Trusted and Speed for Your Logistic Solution', 'yes');
INSERT INTO `wp_options` VALUES (5, 'users_can_register', '0', 'yes');
INSERT INTO `wp_options` VALUES (6, 'admin_email', 'andramarkov@gmail.com', 'yes');
INSERT INTO `wp_options` VALUES (7, 'start_of_week', '1', 'yes');
INSERT INTO `wp_options` VALUES (8, 'use_balanceTags', '0', 'yes');
INSERT INTO `wp_options` VALUES (9, 'use_smilies', '1', 'yes');
INSERT INTO `wp_options` VALUES (10, 'require_name_email', '1', 'yes');
INSERT INTO `wp_options` VALUES (11, 'comments_notify', '1', 'yes');
INSERT INTO `wp_options` VALUES (12, 'posts_per_rss', '10', 'yes');
INSERT INTO `wp_options` VALUES (13, 'rss_use_excerpt', '0', 'yes');
INSERT INTO `wp_options` VALUES (14, 'mailserver_url', 'mail.example.com', 'yes');
INSERT INTO `wp_options` VALUES (15, 'mailserver_login', 'login@example.com', 'yes');
INSERT INTO `wp_options` VALUES (16, 'mailserver_pass', 'password', 'yes');
INSERT INTO `wp_options` VALUES (17, 'mailserver_port', '110', 'yes');
INSERT INTO `wp_options` VALUES (18, 'default_category', '1', 'yes');
INSERT INTO `wp_options` VALUES (19, 'default_comment_status', 'open', 'yes');
INSERT INTO `wp_options` VALUES (20, 'default_ping_status', 'open', 'yes');
INSERT INTO `wp_options` VALUES (21, 'default_pingback_flag', '1', 'yes');
INSERT INTO `wp_options` VALUES (22, 'posts_per_page', '10', 'yes');
INSERT INTO `wp_options` VALUES (23, 'date_format', 'F j, Y', 'yes');
INSERT INTO `wp_options` VALUES (24, 'time_format', 'g:i a', 'yes');
INSERT INTO `wp_options` VALUES (25, 'links_updated_date_format', 'F j, Y g:i a', 'yes');
INSERT INTO `wp_options` VALUES (26, 'comment_moderation', '1', 'yes');
INSERT INTO `wp_options` VALUES (27, 'moderation_notify', '1', 'yes');
INSERT INTO `wp_options` VALUES (28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes');
INSERT INTO `wp_options` VALUES (29, 'rewrite_rules', 'a:96:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:18:\"^entries/([^/]+)/?\";s:29:\"index.php?entries=$matches[1]\";s:42:\"archives/(\\d+)(?:/(\\d+))?/entries/(\\d+)/?$\";s:60:\"index.php?p=$matches[1]&page=$matches[2]&entries=$matches[3]\";s:38:\"(.?.+?)(?:/([0-9]+))?/entries/(\\d+)/?$\";s:67:\"index.php?pagename=$matches[1]&page=$matches[2]&entries=$matches[3]\";s:62:\"([0-9]{4})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/entries/(\\d+)/?$\";s:101:\"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&page=$matches[4]&entries=$matches[5]\";s:75:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/entries/(\\d+)/?$\";s:117:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]&entries=$matches[6]\";s:26:\"(.?.+?)/entries(/(.*))?/?$\";s:50:\"index.php?pagename=$matches[1]&entries=$matches[3]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=8&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes');
INSERT INTO `wp_options` VALUES (30, 'hack_file', '0', 'yes');
INSERT INTO `wp_options` VALUES (31, 'blog_charset', 'UTF-8', 'yes');
INSERT INTO `wp_options` VALUES (32, 'moderation_keys', '', 'no');
INSERT INTO `wp_options` VALUES (33, 'active_plugins', 'a:9:{i:0;s:43:\"all-in-one-seo-pack/all_in_one_seo_pack.php\";i:1;s:33:\"classic-editor/classic-editor.php\";i:2;s:25:\"forminator/forminator.php\";i:3;s:50:\"google-analytics-for-wordpress/googleanalytics.php\";i:4;s:19:\"icyclub/icyclub.php\";i:5;s:19:\"jetpack/jetpack.php\";i:6;s:37:\"optinmonster/optin-monster-wp-api.php\";i:7;s:33:\"smart-slider-3/smart-slider-3.php\";i:8;s:37:\"wp-stats-manager/wp-stats-manager.php\";}', 'yes');
INSERT INTO `wp_options` VALUES (34, 'category_base', '', 'yes');
INSERT INTO `wp_options` VALUES (35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes');
INSERT INTO `wp_options` VALUES (36, 'comment_max_links', '2', 'yes');
INSERT INTO `wp_options` VALUES (37, 'gmt_offset', '7', 'yes');
INSERT INTO `wp_options` VALUES (38, 'default_email_category', '1', 'yes');
INSERT INTO `wp_options` VALUES (39, 'recently_edited', '', 'no');
INSERT INTO `wp_options` VALUES (40, 'template', 'agencyup', 'yes');
INSERT INTO `wp_options` VALUES (41, 'stylesheet', 'agencyup', 'yes');
INSERT INTO `wp_options` VALUES (42, 'comment_registration', '1', 'yes');
INSERT INTO `wp_options` VALUES (43, 'html_type', 'text/html', 'yes');
INSERT INTO `wp_options` VALUES (44, 'use_trackback', '0', 'yes');
INSERT INTO `wp_options` VALUES (45, 'default_role', 'subscriber', 'yes');
INSERT INTO `wp_options` VALUES (46, 'db_version', '53496', 'yes');
INSERT INTO `wp_options` VALUES (47, 'uploads_use_yearmonth_folders', '1', 'yes');
INSERT INTO `wp_options` VALUES (48, 'upload_path', '', 'yes');
INSERT INTO `wp_options` VALUES (49, 'blog_public', '1', 'yes');
INSERT INTO `wp_options` VALUES (50, 'default_link_category', '2', 'yes');
INSERT INTO `wp_options` VALUES (51, 'show_on_front', 'page', 'yes');
INSERT INTO `wp_options` VALUES (52, 'tag_base', '', 'yes');
INSERT INTO `wp_options` VALUES (53, 'show_avatars', '1', 'yes');
INSERT INTO `wp_options` VALUES (54, 'avatar_rating', 'G', 'yes');
INSERT INTO `wp_options` VALUES (55, 'upload_url_path', '', 'yes');
INSERT INTO `wp_options` VALUES (56, 'thumbnail_size_w', '150', 'yes');
INSERT INTO `wp_options` VALUES (57, 'thumbnail_size_h', '150', 'yes');
INSERT INTO `wp_options` VALUES (58, 'thumbnail_crop', '1', 'yes');
INSERT INTO `wp_options` VALUES (59, 'medium_size_w', '300', 'yes');
INSERT INTO `wp_options` VALUES (60, 'medium_size_h', '300', 'yes');
INSERT INTO `wp_options` VALUES (61, 'avatar_default', 'mystery', 'yes');
INSERT INTO `wp_options` VALUES (62, 'large_size_w', '1024', 'yes');
INSERT INTO `wp_options` VALUES (63, 'large_size_h', '1024', 'yes');
INSERT INTO `wp_options` VALUES (64, 'image_default_link_type', 'none', 'yes');
INSERT INTO `wp_options` VALUES (65, 'image_default_size', '', 'yes');
INSERT INTO `wp_options` VALUES (66, 'image_default_align', '', 'yes');
INSERT INTO `wp_options` VALUES (67, 'close_comments_for_old_posts', '', 'yes');
INSERT INTO `wp_options` VALUES (68, 'close_comments_days_old', '14', 'yes');
INSERT INTO `wp_options` VALUES (69, 'thread_comments', '1', 'yes');
INSERT INTO `wp_options` VALUES (70, 'thread_comments_depth', '5', 'yes');
INSERT INTO `wp_options` VALUES (71, 'page_comments', '', 'yes');
INSERT INTO `wp_options` VALUES (72, 'comments_per_page', '50', 'yes');
INSERT INTO `wp_options` VALUES (73, 'default_comments_page', 'newest', 'yes');
INSERT INTO `wp_options` VALUES (74, 'comment_order', 'asc', 'yes');
INSERT INTO `wp_options` VALUES (75, 'sticky_posts', 'a:0:{}', 'yes');
INSERT INTO `wp_options` VALUES (76, 'widget_categories', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES (77, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES (78, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES (79, 'uninstall_plugins', 'a:2:{s:50:\"google-analytics-for-wordpress/googleanalytics.php\";s:35:\"monsterinsights_lite_uninstall_hook\";s:37:\"optinmonster/optin-monster-wp-api.php\";s:32:\"optin_monster_api_uninstall_hook\";}', 'no');
INSERT INTO `wp_options` VALUES (80, 'timezone_string', '', 'yes');
INSERT INTO `wp_options` VALUES (81, 'page_for_posts', '9', 'yes');
INSERT INTO `wp_options` VALUES (82, 'page_on_front', '8', 'yes');
INSERT INTO `wp_options` VALUES (83, 'default_post_format', '0', 'yes');
INSERT INTO `wp_options` VALUES (84, 'link_manager_enabled', '0', 'yes');
INSERT INTO `wp_options` VALUES (85, 'finished_splitting_shared_terms', '1', 'yes');
INSERT INTO `wp_options` VALUES (86, 'site_icon', '0', 'yes');
INSERT INTO `wp_options` VALUES (87, 'medium_large_size_w', '768', 'yes');
INSERT INTO `wp_options` VALUES (88, 'medium_large_size_h', '0', 'yes');
INSERT INTO `wp_options` VALUES (89, 'wp_page_for_privacy_policy', '3', 'yes');
INSERT INTO `wp_options` VALUES (90, 'show_comments_cookies_opt_in', '1', 'yes');
INSERT INTO `wp_options` VALUES (91, 'admin_email_lifespan', '1687918821', 'yes');
INSERT INTO `wp_options` VALUES (92, 'disallowed_keys', '', 'no');
INSERT INTO `wp_options` VALUES (93, 'comment_previously_approved', '1', 'yes');
INSERT INTO `wp_options` VALUES (94, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no');
INSERT INTO `wp_options` VALUES (95, 'auto_update_core_dev', 'enabled', 'yes');
INSERT INTO `wp_options` VALUES (96, 'auto_update_core_minor', 'enabled', 'yes');
INSERT INTO `wp_options` VALUES (97, 'auto_update_core_major', 'enabled', 'yes');
INSERT INTO `wp_options` VALUES (98, 'wp_force_deactivated_plugins', 'a:0:{}', 'yes');
INSERT INTO `wp_options` VALUES (99, 'initial_db_version', '53496', 'yes');
INSERT INTO `wp_options` VALUES (100, 'wp_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:72:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:17:\"aioseo_manage_seo\";b:1;s:20:\"aioseo_page_analysis\";b:1;s:28:\"aioseo_page_general_settings\";b:1;s:29:\"aioseo_page_advanced_settings\";b:1;s:27:\"aioseo_page_schema_settings\";b:1;s:27:\"aioseo_page_social_settings\";b:1;s:17:\"manage_forminator\";b:1;s:11:\"smartslider\";b:1;s:18:\"smartslider_config\";b:1;s:16:\"smartslider_edit\";b:1;s:18:\"smartslider_delete\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:39:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:20:\"aioseo_page_analysis\";b:1;s:28:\"aioseo_page_general_settings\";b:1;s:29:\"aioseo_page_advanced_settings\";b:1;s:27:\"aioseo_page_schema_settings\";b:1;s:27:\"aioseo_page_social_settings\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:15:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"aioseo_page_analysis\";b:1;s:28:\"aioseo_page_general_settings\";b:1;s:29:\"aioseo_page_advanced_settings\";b:1;s:27:\"aioseo_page_schema_settings\";b:1;s:27:\"aioseo_page_social_settings\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:10:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:20:\"aioseo_page_analysis\";b:1;s:28:\"aioseo_page_general_settings\";b:1;s:29:\"aioseo_page_advanced_settings\";b:1;s:27:\"aioseo_page_schema_settings\";b:1;s:27:\"aioseo_page_social_settings\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes');
INSERT INTO `wp_options` VALUES (101, 'fresh_site', '0', 'yes');
INSERT INTO `wp_options` VALUES (102, 'user_count', '1', 'no');
INSERT INTO `wp_options` VALUES (103, 'widget_block', 'a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:154:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Posts</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:227:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Comments</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:146:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Archives</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:150:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Categories</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES (104, 'sidebars_widgets', 'a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:18:\"footer_widget_area\";a:0:{}s:13:\"array_version\";i:3;}', 'yes');
INSERT INTO `wp_options` VALUES (105, 'cron', 'a:13:{i:1673024475;a:2:{s:22:\"forminator_send_export\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:12:\"every_minute\";s:4:\"args\";a:0:{}s:8:\"interval\";i:60;}}s:25:\"forminator_process_report\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:12:\"every_minute\";s:4:\"args\";a:0:{}s:8:\"interval\";i:60;}}}i:1673024482;a:1:{s:26:\"action_scheduler_run_queue\";a:1:{s:32:\"0d04ed39571b55704c122d726248bbac\";a:3:{s:8:\"schedule\";s:12:\"every_minute\";s:4:\"args\";a:1:{i:0;s:7:\"WP Cron\";}s:8:\"interval\";i:60;}}}i:1673025622;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1673026550;a:1:{s:20:\"jetpack_clean_nonces\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1673026561;a:1:{s:42:\"forminator_general_data_protection_cleanup\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1673058022;a:6:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}s:18:\"wp_https_detection\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1673058031;a:3:{s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1673058033;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1673061000;a:1:{s:44:\"optin_monster_api_admin_notifications_update\";a:1:{s:32:\"ab4ac09344b84968a0c8367e826a8531\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:1:{i:0;s:6:\"wpcron\";}}}}i:1673080550;a:1:{s:20:\"jetpack_v2_heartbeat\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1673082019;a:1:{s:18:\"wsm_dailyScheduler\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1673508609;a:1:{s:35:\"monsterinsights_usage_tracking_cron\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}', 'yes');
INSERT INTO `wp_options` VALUES (106, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES (107, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES (108, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES (109, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES (110, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES (111, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES (112, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES (113, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES (114, 'widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES (115, 'nonce_key', 'f4}}R)2v$3znJ+3e^Wt$(*W>]vlB~nB-6CJ(#2U<l<w@TRtI:J dx#lspiocFMKF', 'no');
INSERT INTO `wp_options` VALUES (116, 'nonce_salt', '8aCJra>W4/vO$P<L}Z)x_z+y0I3%EM.C>oX]OT~TUB%jl/E|f)c[qxbFwO}&n;g]', 'no');
INSERT INTO `wp_options` VALUES (117, 'widget_recent-posts', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES (118, 'widget_recent-comments', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES (119, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES (120, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES (121, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES (123, 'recovery_keys', 'a:0:{}', 'yes');
INSERT INTO `wp_options` VALUES (124, 'https_detection_errors', 'a:1:{s:20:\"https_request_failed\";a:1:{i:0;s:21:\"HTTPS request failed.\";}}', 'yes');
INSERT INTO `wp_options` VALUES (125, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.1.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.1.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.1.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-6.1.1-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"6.1.1\";s:7:\"version\";s:5:\"6.1.1\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"6.1\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1673024463;s:15:\"version_checked\";s:5:\"6.1.1\";s:12:\"translations\";a:0:{}}', 'no');
INSERT INTO `wp_options` VALUES (130, 'theme_mods_twentytwentythree', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1672366901;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}}', 'yes');
INSERT INTO `wp_options` VALUES (135, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1673024466;s:7:\"checked\";a:4:{s:8:\"agencyup\";s:4:\"1.28\";s:15:\"twentytwentyone\";s:3:\"1.7\";s:17:\"twentytwentythree\";s:3:\"1.0\";s:15:\"twentytwentytwo\";s:3:\"1.3\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:4:{s:8:\"agencyup\";a:6:{s:5:\"theme\";s:8:\"agencyup\";s:11:\"new_version\";s:4:\"1.28\";s:3:\"url\";s:38:\"https://wordpress.org/themes/agencyup/\";s:7:\"package\";s:55:\"https://downloads.wordpress.org/theme/agencyup.1.28.zip\";s:8:\"requires\";b:0;s:12:\"requires_php\";s:3:\"5.6\";}s:15:\"twentytwentyone\";a:6:{s:5:\"theme\";s:15:\"twentytwentyone\";s:11:\"new_version\";s:3:\"1.7\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentytwentyone/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentytwentyone.1.7.zip\";s:8:\"requires\";s:3:\"5.3\";s:12:\"requires_php\";s:3:\"5.6\";}s:17:\"twentytwentythree\";a:6:{s:5:\"theme\";s:17:\"twentytwentythree\";s:11:\"new_version\";s:3:\"1.0\";s:3:\"url\";s:47:\"https://wordpress.org/themes/twentytwentythree/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/theme/twentytwentythree.1.0.zip\";s:8:\"requires\";s:3:\"6.1\";s:12:\"requires_php\";s:3:\"5.6\";}s:15:\"twentytwentytwo\";a:6:{s:5:\"theme\";s:15:\"twentytwentytwo\";s:11:\"new_version\";s:3:\"1.3\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentytwentytwo/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentytwentytwo.1.3.zip\";s:8:\"requires\";s:3:\"5.9\";s:12:\"requires_php\";s:3:\"5.6\";}}s:12:\"translations\";a:0:{}}', 'no');
INSERT INTO `wp_options` VALUES (137, 'auth_key', 'kiCK`^P4Xz*GLh_Z=SGG&D_3P`77V1h=j1m;_Q1kdN}cuU,pe;8cy%AZ<=@SEKR?', 'no');
INSERT INTO `wp_options` VALUES (138, 'auth_salt', 'V*,J=|8(3GUnQH`9{uJ49&k!10-F.H09;v$b1E|^A,J[>CH9F5FOP-uX=Fhl4W 4', 'no');
INSERT INTO `wp_options` VALUES (139, 'logged_in_key', 'E2%N~ou2xOzl1FtW$gx +O8lJlbKTvGGZ/Dklh-^pD<R?o@ntj  e&,z$2}nr7;P', 'no');
INSERT INTO `wp_options` VALUES (140, 'logged_in_salt', 'vcSeIzw0gp-Cem]Is`pr)0O61NUrgS*[;<Toz&>+MQgyG+`rQb[u|$0-hLk{GzKb', 'no');
INSERT INTO `wp_options` VALUES (146, 'can_compress_scripts', '1', 'no');
INSERT INTO `wp_options` VALUES (162, 'finished_updating_comment_type', '1', 'yes');
INSERT INTO `wp_options` VALUES (164, 'current_theme', 'Agencyup', 'yes');
INSERT INTO `wp_options` VALUES (165, 'theme_mods_agencyup', 'a:8:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:7:\"primary\";i:2;}s:18:\"custom_css_post_id\";i:-1;s:11:\"custom_logo\";i:44;s:12:\"slider_image\";s:111:\"http://localhost:82/wpbaru/wp-content/uploads/2023/01/highcompress-Depositphotos_88915472_l-2015-compressor.jpg\";s:12:\"slider_title\";s:8:\"Komitmen\";s:18:\"slider_discription\";s:37:\"Tepat Waktu, Aman &amp; Layanan Cepat\";s:24:\"agencyup_title_font_size\";s:2:\"24\";}', 'yes');
INSERT INTO `wp_options` VALUES (166, 'theme_switched', '', 'yes');
INSERT INTO `wp_options` VALUES (180, '_transient_health-check-site-status-result', '{\"good\":15,\"recommended\":6,\"critical\":0}', 'yes');
INSERT INTO `wp_options` VALUES (196, 'item_details_page', 'Done', 'yes');
INSERT INTO `wp_options` VALUES (212, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes');
INSERT INTO `wp_options` VALUES (230, 'wp_calendar_block_has_published_posts', '', 'yes');
INSERT INTO `wp_options` VALUES (245, 'site_logo', '44', 'yes');
INSERT INTO `wp_options` VALUES (275, 'recently_activated', 'a:0:{}', 'yes');
INSERT INTO `wp_options` VALUES (295, 'WPLANG', '', 'yes');
INSERT INTO `wp_options` VALUES (296, 'new_admin_email', 'andramarkov@gmail.com', 'yes');
INSERT INTO `wp_options` VALUES (307, 'category_children', 'a:0:{}', 'yes');
INSERT INTO `wp_options` VALUES (322, 'action_scheduler_hybrid_store_demarkation', '46', 'yes');
INSERT INTO `wp_options` VALUES (323, 'schema-ActionScheduler_StoreSchema', '6.0.1672902562', 'yes');
INSERT INTO `wp_options` VALUES (324, 'schema-ActionScheduler_LoggerSchema', '3.0.1672902562', 'yes');
INSERT INTO `wp_options` VALUES (325, 'action_scheduler_lock_async-request-runner', '1673024521', 'yes');
INSERT INTO `wp_options` VALUES (326, 'aioseo_options_internal', '{\"internal\":{\"validLicenseKey\":null,\"lastActiveVersion\":\"4.2.8\",\"migratedVersion\":\"0.0\",\"siteAnalysis\":{\"connectToken\":\"496e9b3d-c041-53d3-896d-7d1b0e871ab4\",\"score\":0,\"results\":\"\",\"competitors\":[]},\"headlineAnalysis\":{\"headlines\":[]},\"wizard\":\"{\\\"currentStage\\\":\\\"license-key\\\",\\\"stages\\\":[\\\"category\\\",\\\"additional-information\\\",\\\"features\\\",\\\"search-appearance\\\",\\\"smart-recommendations\\\",\\\"license-key\\\"],\\\"importers\\\":[],\\\"category\\\":{\\\"category\\\":\\\"corporation\\\",\\\"categoryOther\\\":null,\\\"siteTitle\\\":\\\"Home -\\\",\\\"metaDescription\\\":\\\"Transporindo Agung Sejahtera Jasa Freight Forwarder EMKL Import Ekspedisi Muatan Kapal Laut Medan Jakarta Surabaya Makassar\\\"},\\\"additionalInformation\\\":{\\\"siteRepresents\\\":\\\"organization\\\",\\\"person\\\":null,\\\"organizationName\\\":\\\"PT. Transporindo Agung Sejahtera\\\",\\\"organizationLogo\\\":\\\"http:\\\\\\/\\\\\\/localhost:82\\\\\\/wpbaru\\\\\\/wp-content\\\\\\/uploads\\\\\\/2023\\\\\\/01\\\\\\/Screen-Shot-2023-01-05-at-2.15.16-PM.png\\\",\\\"personName\\\":null,\\\"personLogo\\\":null,\\\"phone\\\":\\\"+62616871095\\\",\\\"contactType\\\":\\\"Customer Support\\\",\\\"contactTypeManual\\\":null,\\\"socialShareImage\\\":\\\"\\\",\\\"social\\\":{\\\"profiles\\\":{\\\"sameUsername\\\":{\\\"enable\\\":false,\\\"username\\\":null,\\\"included\\\":[\\\"facebookPageUrl\\\",\\\"twitterUrl\\\",\\\"pinterestUrl\\\",\\\"instagramUrl\\\",\\\"youtubeUrl\\\",\\\"linkedinUrl\\\"]},\\\"urls\\\":{\\\"facebookPageUrl\\\":null,\\\"twitterUrl\\\":null,\\\"instagramUrl\\\":null,\\\"pinterestUrl\\\":null,\\\"youtubeUrl\\\":null,\\\"linkedinUrl\\\":null,\\\"tumblrUrl\\\":null,\\\"yelpPageUrl\\\":null,\\\"soundCloudUrl\\\":null,\\\"wikipediaUrl\\\":null,\\\"myspaceUrl\\\":null,\\\"googlePlacesUrl\\\":null},\\\"additionalUrls\\\":null}}},\\\"features\\\":[\\\"optimized-search-appearance\\\",\\\"analytics\\\",\\\"conversion-tools\\\",\\\"image-seo\\\",\\\"sitemaps\\\",\\\"redirects\\\",\\\"index-now\\\",\\\"link-assistant\\\",\\\"local-seo\\\",\\\"news-sitemap\\\",\\\"video-sitemap\\\",\\\"rest-api\\\"],\\\"searchAppearance\\\":{\\\"underConstruction\\\":false,\\\"postTypes\\\":{\\\"postTypes\\\":{\\\"all\\\":true,\\\"included\\\":[\\\"post\\\",\\\"page\\\",\\\"attachment\\\",\\\"product\\\"]}},\\\"multipleAuthors\\\":true,\\\"redirectAttachmentPages\\\":true},\\\"smartRecommendations\\\":{\\\"accountInfo\\\":\\\"andramarkov@gmail.com\\\",\\\"usageTracking\\\":false},\\\"licenseKey\\\":\\\"Asrama#311366\\\"}\",\"category\":\"corporation\",\"categoryOther\":null,\"deprecatedOptions\":[]},\"integrations\":{\"semrush\":{\"accessToken\":null,\"tokenType\":null,\"expires\":null,\"refreshToken\":null}},\"database\":{\"installedTables\":\"{\\\"wp_aioseo_posts\\\":[\\\"id\\\",\\\"post_id\\\",\\\"title\\\",\\\"description\\\",\\\"keywords\\\",\\\"keyphrases\\\",\\\"page_analysis\\\",\\\"canonical_url\\\",\\\"og_title\\\",\\\"og_description\\\",\\\"og_object_type\\\",\\\"og_image_type\\\",\\\"og_image_url\\\",\\\"og_image_width\\\",\\\"og_image_height\\\",\\\"og_image_custom_url\\\",\\\"og_image_custom_fields\\\",\\\"og_video\\\",\\\"og_custom_url\\\",\\\"og_article_section\\\",\\\"og_article_tags\\\",\\\"twitter_use_og\\\",\\\"twitter_card\\\",\\\"twitter_image_type\\\",\\\"twitter_image_url\\\",\\\"twitter_image_custom_url\\\",\\\"twitter_image_custom_fields\\\",\\\"twitter_title\\\",\\\"twitter_description\\\",\\\"seo_score\\\",\\\"schema\\\",\\\"schema_type\\\",\\\"schema_type_options\\\",\\\"pillar_content\\\",\\\"robots_default\\\",\\\"robots_noindex\\\",\\\"robots_noarchive\\\",\\\"robots_nosnippet\\\",\\\"robots_nofollow\\\",\\\"robots_noimageindex\\\",\\\"robots_noodp\\\",\\\"robots_notranslate\\\",\\\"robots_max_snippet\\\",\\\"robots_max_videopreview\\\",\\\"robots_max_imagepreview\\\",\\\"images\\\",\\\"image_scan_date\\\",\\\"priority\\\",\\\"frequency\\\",\\\"videos\\\",\\\"video_thumbnail\\\",\\\"video_scan_date\\\",\\\"local_seo\\\",\\\"limit_modified_date\\\",\\\"options\\\",\\\"created\\\",\\\"updated\\\"],\\\"wp_actionscheduler_actions\\\":[],\\\"wp_actionscheduler_logs\\\":[],\\\"wp_actionscheduler_groups\\\":[],\\\"wp_actionscheduler_claims\\\":[],\\\"wp_aioseo_notifications\\\":[]}\"}}', 'yes');
INSERT INTO `wp_options` VALUES (327, 'aioseo_options_internal_lite', '{\"internal\":{\"activated\":1672902563,\"firstActivated\":1672902563,\"installed\":0,\"connect\":{\"key\":null,\"time\":0,\"network\":false,\"token\":null}}}', 'yes');
INSERT INTO `wp_options` VALUES (328, 'widget_aioseo-breadcrumb-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES (329, 'widget_aioseo-html-sitemap-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES (332, 'aioseo_options_dynamic_localized', 'a:4:{s:42:\"searchAppearance_taxonomies_category_title\";s:41:\"#taxonomy_title #separator_sa #site_title\";s:52:\"searchAppearance_taxonomies_category_metaDescription\";s:21:\"#taxonomy_description\";s:42:\"searchAppearance_taxonomies_post_tag_title\";s:41:\"#taxonomy_title #separator_sa #site_title\";s:52:\"searchAppearance_taxonomies_post_tag_metaDescription\";s:21:\"#taxonomy_description\";}', 'yes');
INSERT INTO `wp_options` VALUES (335, 'aioseo_dynamic_settings_backup', '{}', 'yes');
INSERT INTO `wp_options` VALUES (336, 'aioseo_options', '{\"internal\":[],\"webmasterTools\":{\"google\":null,\"bing\":null,\"yandex\":null,\"baidu\":null,\"pinterest\":null,\"microsoftClarityProjectId\":null,\"norton\":null,\"miscellaneousVerification\":null},\"breadcrumbs\":{\"enable\":true,\"separator\":\"&raquo;\",\"homepageLink\":true,\"homepageLabel\":\"Home\",\"breadcrumbPrefix\":null,\"archiveFormat\":\"Archives for #breadcrumb_archive_post_type_name\",\"searchResultFormat\":\"Search Results for \'#breadcrumb_search_string\'\",\"errorFormat404\":\"404 - Page Not Found\",\"showCurrentItem\":true,\"linkCurrentItem\":false,\"categoryFullHierarchy\":false,\"showBlogHome\":false},\"rssContent\":{\"before\":null,\"after\":\"&lt;p&gt;The post #post_link first appeared on #site_link.&lt;\\/p&gt;\"},\"advanced\":{\"truSeo\":true,\"headlineAnalyzer\":true,\"seoAnalysis\":true,\"dashboardWidgets\":[\"seoSetup\",\"seoOverview\",\"seoNews\"],\"announcements\":true,\"postTypes\":{\"all\":true,\"included\":[\"post\",\"page\",\"product\"]},\"taxonomies\":{\"all\":true,\"included\":[\"category\",\"post_tag\",\"product_cat\",\"product_tag\"]},\"uninstall\":false},\"sitemap\":{\"general\":{\"enable\":true,\"filename\":\"sitemap\",\"indexes\":true,\"linksPerIndex\":1000,\"postTypes\":{\"all\":true,\"included\":[\"post\",\"page\",\"attachment\",\"product\"]},\"taxonomies\":{\"all\":true,\"included\":[\"category\",\"post_tag\",\"product_cat\",\"product_tag\"]},\"author\":false,\"date\":false,\"additionalPages\":{\"enable\":false,\"pages\":[]},\"advancedSettings\":{\"enable\":false,\"excludeImages\":false,\"excludePosts\":[],\"excludeTerms\":[],\"priority\":{\"homePage\":{\"priority\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\",\"frequency\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\"},\"postTypes\":{\"grouped\":true,\"priority\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\",\"frequency\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\"},\"taxonomies\":{\"grouped\":true,\"priority\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\",\"frequency\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\"},\"archive\":{\"priority\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\",\"frequency\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\"},\"author\":{\"priority\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\",\"frequency\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\"}}}},\"rss\":{\"enable\":true,\"linksPerIndex\":50,\"postTypes\":{\"all\":true,\"included\":[\"post\",\"page\",\"product\"]}},\"html\":{\"enable\":true,\"pageUrl\":\"\",\"postTypes\":{\"all\":true,\"included\":[\"post\",\"page\",\"product\"]},\"taxonomies\":{\"all\":true,\"included\":[\"category\",\"post_tag\",\"product_cat\",\"product_tag\"]},\"sortOrder\":\"publish_date\",\"sortDirection\":\"asc\",\"publicationDate\":true,\"compactArchives\":false,\"advancedSettings\":{\"enable\":false,\"nofollowLinks\":false,\"excludePosts\":[],\"excludeTerms\":[]}}},\"social\":{\"profiles\":{\"sameUsername\":{\"enable\":false,\"username\":null,\"included\":[\"facebookPageUrl\",\"twitterUrl\",\"pinterestUrl\",\"instagramUrl\",\"youtubeUrl\",\"linkedinUrl\"]},\"urls\":{\"facebookPageUrl\":null,\"twitterUrl\":null,\"instagramUrl\":null,\"pinterestUrl\":null,\"youtubeUrl\":null,\"linkedinUrl\":null,\"tumblrUrl\":null,\"yelpPageUrl\":null,\"soundCloudUrl\":null,\"wikipediaUrl\":null,\"myspaceUrl\":null,\"googlePlacesUrl\":null},\"additionalUrls\":null},\"facebook\":{\"general\":{\"enable\":true,\"defaultImageSourcePosts\":\"default\",\"customFieldImagePosts\":null,\"defaultImagePosts\":\"\",\"defaultImagePostsWidth\":\"\",\"defaultImagePostsHeight\":\"\",\"showAuthor\":true,\"siteName\":\"#site_title #separator_sa #tagline\"},\"homePage\":{\"image\":\"\",\"title\":\"\",\"description\":\"\",\"imageWidth\":\"\",\"imageHeight\":\"\",\"objectType\":\"website\"},\"advanced\":{\"enable\":false,\"adminId\":\"\",\"appId\":\"\",\"authorUrl\":\"\",\"generateArticleTags\":false,\"useKeywordsInTags\":true,\"useCategoriesInTags\":true,\"usePostTagsInTags\":true}},\"twitter\":{\"general\":{\"enable\":true,\"useOgData\":false,\"defaultCardType\":\"summary_large_image\",\"defaultImageSourcePosts\":\"default\",\"customFieldImagePosts\":null,\"defaultImagePosts\":\"\",\"showAuthor\":true,\"additionalData\":false},\"homePage\":{\"image\":\"\",\"title\":\"\",\"description\":\"\",\"cardType\":\"summary\"}}},\"searchAppearance\":{\"global\":{\"separator\":\"&#45;\",\"siteTitle\":\"#site_title #separator_sa #tagline\",\"metaDescription\":\"#tagline\",\"keywords\":null,\"schema\":{\"websiteName\":\"\",\"websiteAlternateName\":null,\"siteRepresents\":\"organization\",\"person\":null,\"organizationName\":\"PT. Transporindo Agung Sejahtera\",\"organizationLogo\":\"http:\\/\\/localhost:82\\/wpbaru\\/wp-content\\/uploads\\/2023\\/01\\/Screen-Shot-2023-01-05-at-2.15.16-PM.png\",\"personName\":null,\"personLogo\":null,\"phone\":\"+62616871095\",\"contactType\":\"Customer Support\",\"contactTypeManual\":null}},\"advanced\":{\"globalRobotsMeta\":{\"default\":true,\"noindex\":false,\"nofollow\":false,\"noindexPaginated\":true,\"nofollowPaginated\":true,\"noindexFeed\":true,\"noarchive\":false,\"noimageindex\":false,\"notranslate\":false,\"nosnippet\":false,\"noodp\":false,\"maxSnippet\":-1,\"maxVideoPreview\":-1,\"maxImagePreview\":\"large\"},\"sitelinks\":true,\"noIndexEmptyCat\":true,\"removeStopWords\":false,\"noPaginationForCanonical\":true,\"useKeywords\":false,\"keywordsLooking\":true,\"useCategoriesForMetaKeywords\":false,\"useTagsForMetaKeywords\":false,\"dynamicallyGenerateKeywords\":false,\"pagedFormat\":\"- Page #page_number\",\"runShortcodes\":false,\"crawlCleanup\":{\"enable\":false,\"feeds\":{\"global\":true,\"globalComments\":false,\"staticBlogPage\":true,\"authors\":true,\"postComments\":false,\"search\":false,\"attachments\":false,\"archives\":{\"all\":false,\"included\":[]},\"taxonomies\":{\"all\":false,\"included\":[\"category\"]},\"atom\":false,\"rdf\":false,\"paginated\":false},\"removeUnrecognizedQueryArgs\":true,\"allowedQueryArgs\":\"\\/^utm_*\\/\"}},\"archives\":{\"author\":{\"show\":true,\"title\":\"#author_name #separator_sa #site_title\",\"metaDescription\":\"#author_bio\",\"advanced\":{\"robotsMeta\":{\"default\":true,\"noindex\":false,\"nofollow\":false,\"noarchive\":false,\"noimageindex\":false,\"notranslate\":false,\"nosnippet\":false,\"noodp\":false,\"maxSnippet\":-1,\"maxVideoPreview\":-1,\"maxImagePreview\":\"large\"},\"showDateInGooglePreview\":true,\"showPostThumbnailInSearch\":true,\"showMetaBox\":true,\"keywords\":null}},\"date\":{\"show\":true,\"title\":\"#archive_date #separator_sa #site_title\",\"metaDescription\":\"\",\"advanced\":{\"robotsMeta\":{\"default\":true,\"noindex\":false,\"nofollow\":false,\"noarchive\":false,\"noimageindex\":false,\"notranslate\":false,\"nosnippet\":false,\"noodp\":false,\"maxSnippet\":-1,\"maxVideoPreview\":-1,\"maxImagePreview\":\"large\"},\"showDateInGooglePreview\":true,\"showPostThumbnailInSearch\":true,\"showMetaBox\":true,\"keywords\":null}},\"search\":{\"show\":false,\"title\":\"#search_term #separator_sa #site_title\",\"metaDescription\":\"\",\"advanced\":{\"robotsMeta\":{\"default\":false,\"noindex\":true,\"nofollow\":false,\"noarchive\":false,\"noimageindex\":false,\"notranslate\":false,\"nosnippet\":false,\"noodp\":false,\"maxSnippet\":-1,\"maxVideoPreview\":-1,\"maxImagePreview\":\"large\"},\"showDateInGooglePreview\":true,\"showPostThumbnailInSearch\":true,\"showMetaBox\":true,\"keywords\":null}}}},\"tools\":{\"robots\":{\"enable\":false,\"rules\":[],\"robotsDetected\":true},\"importExport\":{\"backup\":{\"lastTime\":null,\"data\":null}}},\"deprecated\":{\"webmasterTools\":{\"googleAnalytics\":{\"id\":null,\"advanced\":false,\"trackingDomain\":null,\"multipleDomains\":false,\"additionalDomains\":null,\"anonymizeIp\":false,\"displayAdvertiserTracking\":false,\"excludeUsers\":[],\"trackOutboundLinks\":false,\"enhancedLinkAttribution\":false,\"enhancedEcommerce\":false}},\"searchAppearance\":{\"global\":{\"descriptionFormat\":null,\"schema\":{\"enableSchemaMarkup\":true}},\"advanced\":{\"autogenerateDescriptions\":true,\"runShortcodesInDescription\":true,\"useContentForAutogeneratedDescriptions\":false,\"excludePosts\":[],\"excludeTerms\":[]}},\"sitemap\":{\"general\":{\"advancedSettings\":{\"dynamic\":true}}},\"tools\":{\"blocker\":{\"blockBots\":null,\"blockReferer\":null,\"track\":null,\"custom\":{\"enable\":null,\"bots\":\"Abonti\\naggregator\\nAhrefsBot\\nasterias\\nBDCbot\\nBLEXBot\\nBuiltBotTough\\nBullseye\\nBunnySlippers\\nca-crawler\\nCCBot\\nCegbfeieh\\nCheeseBot\\nCherryPicker\\nCopyRightCheck\\ncosmos\\nCrescent\\ndiscobot\\nDittoSpyder\\nDotBot\\nDownload Ninja\\nEasouSpider\\nEmailCollector\\nEmailSiphon\\nEmailWolf\\nEroCrawler\\nExtractorPro\\nFasterfox\\nFeedBooster\\nFoobot\\nGenieo\\ngrub-client\\nHarvest\\nhloader\\nhttplib\\nHTTrack\\nhumanlinks\\nieautodiscovery\\nInfoNaviRobot\\nIstellaBot\\nJava\\/1.\\nJennyBot\\nk2spider\\nKenjin Spider\\nKeyword Density\\/0.9\\nlarbin\\nLexiBot\\nlibWeb\\nlibwww\\nLinkextractorPro\\nlinko\\nLinkScan\\/8.1a Unix\\nLinkWalker\\nLNSpiderguy\\nlwp-trivial\\nmagpie\\nMata Hari\\nMaxPointCrawler\\nMegaIndex\\nMicrosoft URL Control\\nMIIxpc\\nMippin\\nMissigua Locator\\nMister PiX\\nMJ12bot\\nmoget\\nMSIECrawler\\nNetAnts\\nNICErsPRO\\nNiki-Bot\\nNPBot\\nNutch\\nOffline Explorer\\nOpenfind\\npanscient.com\\nPHP\\/5.{\\nProPowerBot\\/2.14\\nProWebWalker\\nPython-urllib\\nQueryN Metasearch\\nRepoMonkey\\nSISTRIX\\nsitecheck.Internetseer.com\\nSiteSnagger\\nSnapPreviewBot\\nSogou\\nSpankBot\\nspanner\\nspbot\\nSpinn3r\\nsuzuran\\nSzukacz\\/1.4\\nTeleport\\nTelesoft\\nThe Intraformant\\nTheNomad\\nTightTwatBot\\nTitan\\ntoCrawl\\/UrlDispatcher\\nTrue_Robot\\nturingos\\nTurnitinBot\\nUbiCrawler\\nUnisterBot\\nURLy Warning\\nVCI\\nWBSearchBot\\nWeb Downloader\\/6.9\\nWeb Image Collector\\nWebAuto\\nWebBandit\\nWebCopier\\nWebEnhancer\\nWebmasterWorldForumBot\\nWebReaper\\nWebSauger\\nWebsite Quester\\nWebster Pro\\nWebStripper\\nWebZip\\nWotbox\\nwsr-agent\\nWWW-Collector-E\\nXenu\\nZao\\nZeus\\nZyBORG\\ncoccoc\\nIncutio\\nlmspider\\nmemoryBot\\nserf\\nUnknown\\nuptime files\",\"referer\":\"semalt.com\\nkambasoft.com\\nsavetubevideo.com\\nbuttons-for-website.com\\nsharebutton.net\\nsoundfrost.org\\nsrecorder.com\\nsoftomix.com\\nsoftomix.net\\nmyprintscreen.com\\njoinandplay.me\\nfbfreegifts.com\\nopenmediasoft.com\\nzazagames.org\\nextener.org\\nopenfrost.com\\nopenfrost.net\\ngooglsucks.com\\nbest-seo-offer.com\\nbuttons-for-your-website.com\\nwww.Get-Free-Traffic-Now.com\\nbest-seo-solution.com\\nbuy-cheap-online.info\\nsite3.free-share-buttons.com\\nwebmaster-traffic.com\"}}}}}', 'yes');
INSERT INTO `wp_options` VALUES (337, 'aioseo_options_lite', '{\"advanced\":{\"usageTracking\":false}}', 'yes');
INSERT INTO `wp_options` VALUES (338, 'aioseo_options_dynamic', '{\"sitemap\":{\"priority\":{\"postTypes\":{\"post\":{\"priority\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\",\"frequency\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\"},\"page\":{\"priority\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\",\"frequency\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\"},\"attachment\":{\"priority\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\",\"frequency\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\"}},\"taxonomies\":[]}},\"social\":{\"facebook\":{\"general\":{\"postTypes\":{\"post\":{\"objectType\":\"article\"},\"page\":{\"objectType\":\"article\"},\"attachment\":{\"objectType\":\"article\"}}}}},\"searchAppearance\":{\"postTypes\":{\"post\":{\"show\":true,\"advanced\":{\"robotsMeta\":{\"default\":true,\"noindex\":false,\"nofollow\":false,\"noarchive\":false,\"noimageindex\":false,\"notranslate\":false,\"nosnippet\":false,\"noodp\":false,\"maxSnippet\":-1,\"maxVideoPreview\":-1,\"maxImagePreview\":\"large\"},\"showDateInGooglePreview\":true,\"showPostThumbnailInSearch\":true,\"showMetaBox\":true,\"bulkEditing\":\"enabled\"},\"title\":\"#post_title #separator_sa #site_title\",\"metaDescription\":\"#post_excerpt\",\"schemaType\":\"Article\",\"webPageType\":\"WebPage\",\"articleType\":\"BlogPosting\",\"customFields\":null},\"page\":{\"show\":true,\"advanced\":{\"robotsMeta\":{\"default\":true,\"noindex\":false,\"nofollow\":false,\"noarchive\":false,\"noimageindex\":false,\"notranslate\":false,\"nosnippet\":false,\"noodp\":false,\"maxSnippet\":-1,\"maxVideoPreview\":-1,\"maxImagePreview\":\"large\"},\"showDateInGooglePreview\":true,\"showPostThumbnailInSearch\":true,\"showMetaBox\":true,\"bulkEditing\":\"enabled\"},\"title\":\"#post_title #separator_sa #site_title\",\"metaDescription\":\"#post_content\",\"schemaType\":\"WebPage\",\"webPageType\":\"WebPage\",\"articleType\":\"BlogPosting\",\"customFields\":null},\"attachment\":{\"show\":true,\"advanced\":{\"robotsMeta\":{\"default\":true,\"noindex\":false,\"nofollow\":false,\"noarchive\":false,\"noimageindex\":false,\"notranslate\":false,\"nosnippet\":false,\"noodp\":false,\"maxSnippet\":-1,\"maxVideoPreview\":-1,\"maxImagePreview\":\"large\"},\"showDateInGooglePreview\":true,\"showPostThumbnailInSearch\":true,\"showMetaBox\":true,\"bulkEditing\":\"enabled\"},\"title\":\"#post_title #separator_sa #site_title\",\"metaDescription\":\"#attachment_caption\",\"schemaType\":\"ItemPage\",\"webPageType\":\"ItemPage\",\"articleType\":\"BlogPosting\",\"customFields\":null,\"redirectAttachmentUrls\":\"attachment\"}},\"taxonomies\":{\"category\":{\"show\":true,\"advanced\":{\"robotsMeta\":{\"default\":true,\"noindex\":false,\"nofollow\":false,\"noarchive\":false,\"noimageindex\":false,\"notranslate\":false,\"nosnippet\":false,\"noodp\":false,\"maxSnippet\":-1,\"maxVideoPreview\":-1,\"maxImagePreview\":\"large\"},\"showDateInGooglePreview\":true,\"showPostThumbnailInSearch\":true,\"showMetaBox\":true},\"title\":\"#taxonomy_title #separator_sa #site_title\",\"metaDescription\":\"#taxonomy_description\"},\"post_tag\":{\"show\":true,\"advanced\":{\"robotsMeta\":{\"default\":true,\"noindex\":false,\"nofollow\":false,\"noarchive\":false,\"noimageindex\":false,\"notranslate\":false,\"nosnippet\":false,\"noodp\":false,\"maxSnippet\":-1,\"maxVideoPreview\":-1,\"maxImagePreview\":\"large\"},\"showDateInGooglePreview\":true,\"showPostThumbnailInSearch\":true,\"showMetaBox\":true},\"title\":\"#taxonomy_title #separator_sa #site_title\",\"metaDescription\":\"#taxonomy_description\"}},\"archives\":[]}}', 'yes');
INSERT INTO `wp_options` VALUES (340, 'action_scheduler_migration_status', 'complete', 'yes');
INSERT INTO `wp_options` VALUES (344, 'optin_monster_api', 'a:11:{s:3:\"api\";a:0:{}s:10:\"is_expired\";b:0;s:11:\"is_disabled\";b:0;s:10:\"is_invalid\";b:0;s:9:\"installed\";i:1672902960;s:9:\"connected\";s:0:\"\";s:4:\"beta\";b:0;s:12:\"auto_updates\";s:0:\"\";s:14:\"usage_tracking\";b:0;s:18:\"hide_announcements\";b:0;s:7:\"welcome\";a:1:{s:6:\"status\";s:4:\"none\";}}', 'yes');
INSERT INTO `wp_options` VALUES (345, 'omapi_review', 'a:2:{s:4:\"time\";i:1672902960;s:9:\"dismissed\";b:0;}', 'yes');
INSERT INTO `wp_options` VALUES (348, 'widget_optin-monster-api', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES (349, 'widget_monsterinsights-popular-posts-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES (350, 'monsterinsights_settings', 'a:42:{s:22:\"enable_affiliate_links\";b:1;s:15:\"affiliate_links\";a:2:{i:0;a:2:{s:4:\"path\";s:4:\"/go/\";s:5:\"label\";s:9:\"affiliate\";}i:1;a:2:{s:4:\"path\";s:11:\"/recommend/\";s:5:\"label\";s:9:\"affiliate\";}}s:12:\"demographics\";i:1;s:12:\"ignore_users\";a:2:{i:0;s:13:\"administrator\";i:1;s:6:\"editor\";}s:19:\"dashboards_disabled\";i:0;s:13:\"anonymize_ips\";i:0;s:19:\"extensions_of_files\";s:34:\"doc,pdf,ppt,zip,xls,docx,pptx,xlsx\";s:18:\"subdomain_tracking\";s:0:\"\";s:16:\"link_attribution\";b:1;s:16:\"tag_links_in_rss\";b:1;s:12:\"allow_anchor\";i:0;s:16:\"add_allow_linker\";i:0;s:13:\"save_settings\";a:1:{i:0;s:13:\"administrator\";}s:12:\"view_reports\";a:2:{i:0;s:13:\"administrator\";i:1;s:6:\"editor\";}s:11:\"events_mode\";s:2:\"js\";s:13:\"tracking_mode\";s:4:\"gtag\";s:15:\"email_summaries\";s:2:\"on\";s:23:\"summaries_html_template\";s:3:\"yes\";s:25:\"summaries_email_addresses\";a:1:{i:0;a:1:{s:5:\"email\";s:21:\"andramarkov@gmail.com\";}}s:17:\"automatic_updates\";s:4:\"none\";s:26:\"popular_posts_inline_theme\";s:5:\"alpha\";s:26:\"popular_posts_widget_theme\";s:5:\"alpha\";s:28:\"popular_posts_products_theme\";s:5:\"alpha\";s:30:\"popular_posts_inline_placement\";s:6:\"manual\";s:34:\"popular_posts_widget_theme_columns\";s:1:\"2\";s:36:\"popular_posts_products_theme_columns\";s:1:\"2\";s:26:\"popular_posts_widget_count\";s:1:\"4\";s:28:\"popular_posts_products_count\";s:1:\"4\";s:38:\"popular_posts_widget_theme_meta_author\";s:2:\"on\";s:36:\"popular_posts_widget_theme_meta_date\";s:2:\"on\";s:40:\"popular_posts_widget_theme_meta_comments\";s:2:\"on\";s:39:\"popular_posts_products_theme_meta_price\";s:2:\"on\";s:40:\"popular_posts_products_theme_meta_rating\";s:2:\"on\";s:39:\"popular_posts_products_theme_meta_image\";s:2:\"on\";s:32:\"popular_posts_inline_after_count\";s:3:\"150\";s:36:\"popular_posts_inline_multiple_number\";s:1:\"3\";s:38:\"popular_posts_inline_multiple_distance\";s:3:\"250\";s:39:\"popular_posts_inline_multiple_min_words\";s:3:\"100\";s:31:\"popular_posts_inline_post_types\";a:1:{i:0;s:4:\"post\";}s:31:\"popular_posts_widget_post_types\";a:1:{i:0;s:4:\"post\";}s:19:\"verified_appearance\";s:5:\"light\";s:17:\"verified_position\";s:6:\"center\";}', 'yes');
INSERT INTO `wp_options` VALUES (351, 'monsterinsights_over_time', 'a:4:{s:17:\"installed_version\";s:6:\"8.11.0\";s:14:\"installed_date\";i:1672902979;s:13:\"installed_pro\";b:0;s:14:\"installed_lite\";i:1672902979;}', 'no');
INSERT INTO `wp_options` VALUES (352, 'monsterinsights_db_version', '7.4.0', 'yes');
INSERT INTO `wp_options` VALUES (353, 'monsterinsights_current_version', '8.11.0', 'yes');
INSERT INTO `wp_options` VALUES (357, 'om_notifications', 'a:4:{s:7:\"updated\";i:1672902985;s:4:\"feed\";a:0:{}s:6:\"events\";a:0:{}s:9:\"dismissed\";a:0:{}}', 'no');
INSERT INTO `wp_options` VALUES (358, 'optinmonster_upgrade_completed', '2.11.1', 'yes');
INSERT INTO `wp_options` VALUES (359, 'monsterinsights_usage_tracking_config', 'a:6:{s:3:\"day\";i:4;s:4:\"hour\";i:7;s:6:\"minute\";i:30;s:6:\"second\";i:9;s:6:\"offset\";i:372609;s:8:\"initsend\";i:1673508609;}', 'yes');
INSERT INTO `wp_options` VALUES (360, '_transient_timeout__omapi_validate', '1673110870', 'no');
INSERT INTO `wp_options` VALUES (361, '_transient__omapi_validate', '1', 'no');
INSERT INTO `wp_options` VALUES (366, 'monsterinsights_notifications', 'a:4:{s:6:\"update\";i:1672903011;s:4:\"feed\";a:0:{}s:6:\"events\";a:0:{}s:9:\"dismissed\";a:0:{}}', 'no');
INSERT INTO `wp_options` VALUES (367, 'monsterinsights_notifications_run', 'a:25:{s:37:\"monsterinsights_notification_visitors\";i:1672903011;s:37:\"monsterinsights_notification_audience\";i:1672903011;s:55:\"monsterinsights_notification_mobile_device_high_traffic\";i:1672903011;s:42:\"monsterinsights_notification_mobile_device\";i:1672903011;s:43:\"monsterinsights_notification_upgrade_to_pro\";i:1672903011;s:56:\"monsterinsights_notification_upgrade_to_pro_high_traffic\";i:1672903011;s:40:\"monsterinsights_notification_bounce_rate\";i:1672903011;s:42:\"monsterinsights_notification_dual_tracking\";i:1672903011;s:47:\"monsterinsights_notification_returning_visitors\";i:1672903011;s:45:\"monsterinsights_notification_traffic_dropping\";i:1672903011;s:64:\"monsterinsights_notification_upgrade_for_popular_posts_templates\";i:1672903011;s:57:\"monsterinsights_notification_upgrade_for_events_reporting\";i:1672903011;s:62:\"monsterinsights_notification_upgrade_for_search_console_report\";i:1672903011;s:56:\"monsterinsights_notification_upgrade_for_form_conversion\";i:1672903011;s:56:\"monsterinsights_notification_upgrade_for_email_summaries\";i:1672903011;s:58:\"monsterinsights_notification_upgrade_for_custom_dimensions\";i:1672903011;s:56:\"monsterinsights_notification_upgrade_for_google_optimize\";i:1672903011;s:39:\"monsterinsights_notification_eu_traffic\";i:1672903011;s:56:\"monsterinsights_notification_to_add_more_file_extensions\";i:1672903011;s:53:\"monsterinsights_notification_to_setup_affiliate_links\";i:1672903011;s:46:\"monsterinsights_notification_headline_analyzer\";i:1672903011;s:49:\"monsterinsights_notification_install_optinmonster\";i:1672903011;s:43:\"monsterinsights_notification_install_aioseo\";i:1672903011;s:44:\"monsterinsights_notification_install_wpforms\";i:1672903011;s:43:\"monsterinsights_notification_multiple_gtags\";i:1672903011;}', 'no');
INSERT INTO `wp_options` VALUES (369, 'monsterinsights_review', 'a:2:{s:4:\"time\";i:1672903090;s:9:\"dismissed\";b:0;}', 'yes');
INSERT INTO `wp_options` VALUES (410, 'jetpack_activated', '1', 'yes');
INSERT INTO `wp_options` VALUES (413, 'jetpack_activation_source', 'a:2:{i:0;s:4:\"list\";i:1;N;}', 'yes');
INSERT INTO `wp_options` VALUES (414, 'jetpack_sync_settings_disable', '0', 'yes');
INSERT INTO `wp_options` VALUES (415, 'jetpack_options', 'a:5:{s:7:\"version\";s:15:\"11.6:1672907750\";s:11:\"old_version\";s:15:\"11.6:1672907750\";s:28:\"fallback_no_verify_ssl_certs\";i:0;s:9:\"time_diff\";i:0;s:14:\"last_heartbeat\";i:1673024467;}', 'yes');
INSERT INTO `wp_options` VALUES (416, '_transient_timeout_jetpack_file_data_11.6', '1675413371', 'no');
INSERT INTO `wp_options` VALUES (417, '_transient_jetpack_file_data_11.6', 'a:1:{s:32:\"3fd340ad52927afb3bbb9e98575eccfd\";a:15:{s:4:\"name\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:0:\"\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:0:\"\";s:24:\"requires_user_connection\";s:0:\"\";s:13:\"auto_activate\";s:0:\"\";s:11:\"module_tags\";s:0:\"\";s:7:\"feature\";s:0:\"\";s:25:\"additional_search_queries\";s:0:\"\";s:12:\"plan_classes\";s:0:\"\";}}', 'no');
INSERT INTO `wp_options` VALUES (418, 'jetpack_available_modules', 'a:1:{s:4:\"11.6\";a:46:{s:10:\"action-bar\";s:4:\"11.4\";s:8:\"carousel\";s:3:\"1.5\";s:13:\"comment-likes\";s:3:\"5.1\";s:8:\"comments\";s:3:\"1.4\";s:12:\"contact-form\";s:3:\"1.3\";s:9:\"copy-post\";s:3:\"7.0\";s:20:\"custom-content-types\";s:3:\"3.1\";s:10:\"custom-css\";s:3:\"1.7\";s:21:\"enhanced-distribution\";s:3:\"1.2\";s:16:\"google-analytics\";s:3:\"4.5\";s:12:\"google-fonts\";s:6:\"10.8.0\";s:19:\"gravatar-hovercards\";s:3:\"1.1\";s:15:\"infinite-scroll\";s:3:\"2.0\";s:8:\"json-api\";s:3:\"1.9\";s:5:\"latex\";s:3:\"1.1\";s:11:\"lazy-images\";s:5:\"5.6.0\";s:5:\"likes\";s:3:\"2.2\";s:8:\"markdown\";s:3:\"2.8\";s:9:\"masterbar\";s:3:\"4.8\";s:7:\"monitor\";s:3:\"2.6\";s:5:\"notes\";s:3:\"1.9\";s:10:\"photon-cdn\";s:3:\"6.6\";s:6:\"photon\";s:3:\"2.0\";s:13:\"post-by-email\";s:3:\"2.0\";s:9:\"post-list\";s:4:\"11.3\";s:7:\"protect\";s:3:\"3.4\";s:9:\"publicize\";s:3:\"2.0\";s:13:\"related-posts\";s:3:\"2.9\";s:6:\"search\";s:3:\"5.0\";s:9:\"seo-tools\";s:3:\"4.4\";s:10:\"sharedaddy\";s:3:\"1.1\";s:10:\"shortcodes\";s:3:\"1.1\";s:10:\"shortlinks\";s:3:\"1.1\";s:8:\"sitemaps\";s:3:\"3.9\";s:3:\"sso\";s:3:\"2.6\";s:5:\"stats\";s:3:\"1.1\";s:13:\"subscriptions\";s:3:\"1.2\";s:13:\"tiled-gallery\";s:3:\"2.1\";s:10:\"vaultpress\";s:5:\"0:1.2\";s:18:\"verification-tools\";s:3:\"3.0\";s:10:\"videopress\";s:3:\"2.5\";s:3:\"waf\";s:4:\"10.9\";s:17:\"widget-visibility\";s:3:\"2.4\";s:7:\"widgets\";s:3:\"1.2\";s:21:\"woocommerce-analytics\";s:3:\"8.4\";s:7:\"wordads\";s:5:\"4.5.0\";}}', 'yes');
INSERT INTO `wp_options` VALUES (419, '_transient_jetpack_autoloader_plugin_paths', 'a:1:{i:0;s:25:\"{{WP_PLUGIN_DIR}}/jetpack\";}', 'yes');
INSERT INTO `wp_options` VALUES (420, 'jetpack_connection_active_plugins', 'a:1:{s:7:\"jetpack\";a:1:{s:4:\"name\";s:7:\"Jetpack\";}}', 'yes');
INSERT INTO `wp_options` VALUES (421, 'jetpack_testimonial', '0', 'yes');
INSERT INTO `wp_options` VALUES (423, 'do_activate', '0', 'yes');
INSERT INTO `wp_options` VALUES (430, 'forminator_free_install_date', '1672932960', 'no');
INSERT INTO `wp_options` VALUES (431, 'wpmudev_recommended_plugins_registered', 'a:1:{s:25:\"forminator/forminator.php\";a:1:{s:13:\"registered_at\";i:1672907760;}}', 'no');
INSERT INTO `wp_options` VALUES (432, 'forminator_default_report_entry', '1', 'yes');
INSERT INTO `wp_options` VALUES (433, 'forminator_version', '1.22.1', 'yes');
INSERT INTO `wp_options` VALUES (434, 'widget_forminator_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES (436, 'sharing-options', 'a:1:{s:6:\"global\";a:5:{s:12:\"button_style\";s:9:\"icon-text\";s:13:\"sharing_label\";s:11:\"Share this:\";s:10:\"open_links\";s:4:\"same\";s:4:\"show\";a:2:{i:0;s:4:\"post\";i:1;s:4:\"page\";}s:6:\"custom\";a:0:{}}}', 'yes');
INSERT INTO `wp_options` VALUES (443, 'forminator_appearance_presets', 'a:1:{s:7:\"default\";s:14:\"Default Preset\";}', 'yes');
INSERT INTO `wp_options` VALUES (444, 'wpmudev_notices', 'a:3:{s:7:\"plugins\";a:1:{s:10:\"forminator\";i:1672907791;}s:5:\"queue\";a:1:{s:10:\"forminator\";a:3:{s:5:\"email\";i:1672907791;s:4:\"rate\";i:1672907791;s:8:\"giveaway\";i:1672907791;}}s:4:\"done\";a:0:{}}', 'no');
INSERT INTO `wp_options` VALUES (466, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1673024466;s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:15:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"5.0.2\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.5.0.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:60:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=2818463\";s:2:\"1x\";s:60:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=2818463\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.0\";}s:43:\"all-in-one-seo-pack/all_in_one_seo_pack.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:33:\"w.org/plugins/all-in-one-seo-pack\";s:4:\"slug\";s:19:\"all-in-one-seo-pack\";s:6:\"plugin\";s:43:\"all-in-one-seo-pack/all_in_one_seo_pack.php\";s:11:\"new_version\";s:5:\"4.2.8\";s:3:\"url\";s:50:\"https://wordpress.org/plugins/all-in-one-seo-pack/\";s:7:\"package\";s:68:\"https://downloads.wordpress.org/plugin/all-in-one-seo-pack.4.2.8.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:72:\"https://ps.w.org/all-in-one-seo-pack/assets/icon-256x256.png?rev=2443290\";s:2:\"1x\";s:64:\"https://ps.w.org/all-in-one-seo-pack/assets/icon.svg?rev=2443290\";s:3:\"svg\";s:64:\"https://ps.w.org/all-in-one-seo-pack/assets/icon.svg?rev=2443290\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:75:\"https://ps.w.org/all-in-one-seo-pack/assets/banner-1544x500.png?rev=2443290\";s:2:\"1x\";s:74:\"https://ps.w.org/all-in-one-seo-pack/assets/banner-772x250.png?rev=2443290\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.9\";}s:47:\"automatic-domain-changer/auto-domain-change.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:38:\"w.org/plugins/automatic-domain-changer\";s:4:\"slug\";s:24:\"automatic-domain-changer\";s:6:\"plugin\";s:47:\"automatic-domain-changer/auto-domain-change.php\";s:11:\"new_version\";s:5:\"2.0.3\";s:3:\"url\";s:55:\"https://wordpress.org/plugins/automatic-domain-changer/\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/plugin/automatic-domain-changer.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:77:\"https://ps.w.org/automatic-domain-changer/assets/icon-256x256.png?rev=1151255\";s:2:\"1x\";s:77:\"https://ps.w.org/automatic-domain-changer/assets/icon-128x128.png?rev=1151260\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:78:\"https://ps.w.org/automatic-domain-changer/assets/banner-772x250.png?rev=732952\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"3.0\";}s:33:\"classic-editor/classic-editor.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:28:\"w.org/plugins/classic-editor\";s:4:\"slug\";s:14:\"classic-editor\";s:6:\"plugin\";s:33:\"classic-editor/classic-editor.php\";s:11:\"new_version\";s:5:\"1.6.2\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/classic-editor/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/classic-editor.1.6.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/classic-editor/assets/icon-256x256.png?rev=1998671\";s:2:\"1x\";s:67:\"https://ps.w.org/classic-editor/assets/icon-128x128.png?rev=1998671\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/classic-editor/assets/banner-1544x500.png?rev=1998671\";s:2:\"1x\";s:69:\"https://ps.w.org/classic-editor/assets/banner-772x250.png?rev=1998676\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.9\";}s:51:\"counter-number-showcase/counter-number-showcase.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:37:\"w.org/plugins/counter-number-showcase\";s:4:\"slug\";s:23:\"counter-number-showcase\";s:6:\"plugin\";s:51:\"counter-number-showcase/counter-number-showcase.php\";s:11:\"new_version\";s:5:\"1.3.2\";s:3:\"url\";s:54:\"https://wordpress.org/plugins/counter-number-showcase/\";s:7:\"package\";s:72:\"https://downloads.wordpress.org/plugin/counter-number-showcase.1.3.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:76:\"https://ps.w.org/counter-number-showcase/assets/icon-256x256.png?rev=1704297\";s:2:\"1x\";s:76:\"https://ps.w.org/counter-number-showcase/assets/icon-128x128.png?rev=1704297\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:78:\"https://ps.w.org/counter-number-showcase/assets/banner-772x250.jpg?rev=1704297\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.0\";}s:25:\"forminator/forminator.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:24:\"w.org/plugins/forminator\";s:4:\"slug\";s:10:\"forminator\";s:6:\"plugin\";s:25:\"forminator/forminator.php\";s:11:\"new_version\";s:6:\"1.22.1\";s:3:\"url\";s:41:\"https://wordpress.org/plugins/forminator/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/forminator.1.22.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/forminator/assets/icon-256x256.png?rev=2746202\";s:2:\"1x\";s:63:\"https://ps.w.org/forminator/assets/icon-128x128.png?rev=2746202\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:66:\"https://ps.w.org/forminator/assets/banner-1544x500.png?rev=2626060\";s:2:\"1x\";s:65:\"https://ps.w.org/forminator/assets/banner-772x250.png?rev=2626060\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.2\";}s:50:\"google-analytics-for-wordpress/googleanalytics.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:44:\"w.org/plugins/google-analytics-for-wordpress\";s:4:\"slug\";s:30:\"google-analytics-for-wordpress\";s:6:\"plugin\";s:50:\"google-analytics-for-wordpress/googleanalytics.php\";s:11:\"new_version\";s:6:\"8.11.0\";s:3:\"url\";s:61:\"https://wordpress.org/plugins/google-analytics-for-wordpress/\";s:7:\"package\";s:80:\"https://downloads.wordpress.org/plugin/google-analytics-for-wordpress.8.11.0.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:83:\"https://ps.w.org/google-analytics-for-wordpress/assets/icon-256x256.png?rev=1598927\";s:2:\"1x\";s:75:\"https://ps.w.org/google-analytics-for-wordpress/assets/icon.svg?rev=1598927\";s:3:\"svg\";s:75:\"https://ps.w.org/google-analytics-for-wordpress/assets/icon.svg?rev=1598927\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:86:\"https://ps.w.org/google-analytics-for-wordpress/assets/banner-1544x500.png?rev=2159532\";s:2:\"1x\";s:85:\"https://ps.w.org/google-analytics-for-wordpress/assets/banner-772x250.png?rev=2159532\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:5:\"4.8.0\";}s:9:\"hello.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/hello-dolly/assets/banner-1544x500.jpg?rev=2645582\";s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.6\";}s:19:\"icyclub/icyclub.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:21:\"w.org/plugins/icyclub\";s:4:\"slug\";s:7:\"icyclub\";s:6:\"plugin\";s:19:\"icyclub/icyclub.php\";s:11:\"new_version\";s:5:\"1.9.7\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/icyclub/\";s:7:\"package\";s:50:\"https://downloads.wordpress.org/plugin/icyclub.zip\";s:5:\"icons\";a:1:{s:7:\"default\";s:51:\"https://s.w.org/plugins/geopattern-icon/icyclub.svg\";}s:7:\"banners\";a:0:{}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.0\";}s:19:\"jetpack/jetpack.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:21:\"w.org/plugins/jetpack\";s:4:\"slug\";s:7:\"jetpack\";s:6:\"plugin\";s:19:\"jetpack/jetpack.php\";s:11:\"new_version\";s:4:\"11.6\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/jetpack/\";s:7:\"package\";s:55:\"https://downloads.wordpress.org/plugin/jetpack.11.6.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:60:\"https://ps.w.org/jetpack/assets/icon-256x256.png?rev=2819237\";s:2:\"1x\";s:52:\"https://ps.w.org/jetpack/assets/icon.svg?rev=2819237\";s:3:\"svg\";s:52:\"https://ps.w.org/jetpack/assets/icon.svg?rev=2819237\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/jetpack/assets/banner-1544x500.png?rev=2653649\";s:2:\"1x\";s:62:\"https://ps.w.org/jetpack/assets/banner-772x250.png?rev=2653649\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"6.0\";}s:23:\"ml-slider/ml-slider.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:23:\"w.org/plugins/ml-slider\";s:4:\"slug\";s:9:\"ml-slider\";s:6:\"plugin\";s:23:\"ml-slider/ml-slider.php\";s:11:\"new_version\";s:6:\"3.28.2\";s:3:\"url\";s:40:\"https://wordpress.org/plugins/ml-slider/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/plugin/ml-slider.3.28.2.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:62:\"https://ps.w.org/ml-slider/assets/icon-256x256.png?rev=2370840\";s:2:\"1x\";s:54:\"https://ps.w.org/ml-slider/assets/icon.svg?rev=2771717\";s:3:\"svg\";s:54:\"https://ps.w.org/ml-slider/assets/icon.svg?rev=2771717\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:65:\"https://ps.w.org/ml-slider/assets/banner-1544x500.png?rev=1837669\";s:2:\"1x\";s:64:\"https://ps.w.org/ml-slider/assets/banner-772x250.png?rev=2370840\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"3.5\";}s:37:\"optinmonster/optin-monster-wp-api.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:26:\"w.org/plugins/optinmonster\";s:4:\"slug\";s:12:\"optinmonster\";s:6:\"plugin\";s:37:\"optinmonster/optin-monster-wp-api.php\";s:11:\"new_version\";s:6:\"2.11.1\";s:3:\"url\";s:43:\"https://wordpress.org/plugins/optinmonster/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/plugin/optinmonster.2.11.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:65:\"https://ps.w.org/optinmonster/assets/icon-256x256.png?rev=1145864\";s:2:\"1x\";s:65:\"https://ps.w.org/optinmonster/assets/icon-128x128.png?rev=1145864\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:68:\"https://ps.w.org/optinmonster/assets/banner-1544x500.png?rev=2311621\";s:2:\"1x\";s:67:\"https://ps.w.org/optinmonster/assets/banner-772x250.png?rev=2311621\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:5:\"4.7.0\";}s:28:\"robo-gallery/robogallery.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:26:\"w.org/plugins/robo-gallery\";s:4:\"slug\";s:12:\"robo-gallery\";s:6:\"plugin\";s:28:\"robo-gallery/robogallery.php\";s:11:\"new_version\";s:6:\"3.2.11\";s:3:\"url\";s:43:\"https://wordpress.org/plugins/robo-gallery/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/plugin/robo-gallery.3.2.11.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:65:\"https://ps.w.org/robo-gallery/assets/icon-256x256.gif?rev=2291186\";s:2:\"1x\";s:65:\"https://ps.w.org/robo-gallery/assets/icon-128x128.gif?rev=2291186\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:68:\"https://ps.w.org/robo-gallery/assets/banner-1544x500.png?rev=2176511\";s:2:\"1x\";s:67:\"https://ps.w.org/robo-gallery/assets/banner-772x250.png?rev=2176511\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"3.3\";}s:33:\"smart-slider-3/smart-slider-3.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:28:\"w.org/plugins/smart-slider-3\";s:4:\"slug\";s:14:\"smart-slider-3\";s:6:\"plugin\";s:33:\"smart-slider-3/smart-slider-3.php\";s:11:\"new_version\";s:8:\"3.5.1.12\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/smart-slider-3/\";s:7:\"package\";s:66:\"https://downloads.wordpress.org/plugin/smart-slider-3.3.5.1.12.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:67:\"https://ps.w.org/smart-slider-3/assets/icon-256x256.png?rev=2307688\";s:2:\"1x\";s:59:\"https://ps.w.org/smart-slider-3/assets/icon.svg?rev=2307688\";s:3:\"svg\";s:59:\"https://ps.w.org/smart-slider-3/assets/icon.svg?rev=2307688\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/smart-slider-3/assets/banner-1544x500.png?rev=2632650\";s:2:\"1x\";s:69:\"https://ps.w.org/smart-slider-3/assets/banner-772x250.png?rev=2632650\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.0\";}s:37:\"wp-stats-manager/wp-stats-manager.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:30:\"w.org/plugins/wp-stats-manager\";s:4:\"slug\";s:16:\"wp-stats-manager\";s:6:\"plugin\";s:37:\"wp-stats-manager/wp-stats-manager.php\";s:11:\"new_version\";s:3:\"6.4\";s:3:\"url\";s:47:\"https://wordpress.org/plugins/wp-stats-manager/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/wp-stats-manager.6.4.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/wp-stats-manager/assets/icon-256x256.gif?rev=2271306\";s:2:\"1x\";s:69:\"https://ps.w.org/wp-stats-manager/assets/icon-128x128.gif?rev=2271306\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:71:\"https://ps.w.org/wp-stats-manager/assets/banner-772x250.png?rev=1839900\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"3.0\";}}s:7:\"checked\";a:15:{s:19:\"akismet/akismet.php\";s:5:\"5.0.2\";s:43:\"all-in-one-seo-pack/all_in_one_seo_pack.php\";s:5:\"4.2.8\";s:47:\"automatic-domain-changer/auto-domain-change.php\";s:5:\"2.0.3\";s:33:\"classic-editor/classic-editor.php\";s:5:\"1.6.2\";s:51:\"counter-number-showcase/counter-number-showcase.php\";s:5:\"1.3.2\";s:25:\"forminator/forminator.php\";s:6:\"1.22.1\";s:50:\"google-analytics-for-wordpress/googleanalytics.php\";s:6:\"8.11.0\";s:9:\"hello.php\";s:5:\"1.7.2\";s:19:\"icyclub/icyclub.php\";s:5:\"1.9.7\";s:19:\"jetpack/jetpack.php\";s:4:\"11.6\";s:23:\"ml-slider/ml-slider.php\";s:6:\"3.28.2\";s:37:\"optinmonster/optin-monster-wp-api.php\";s:6:\"2.11.1\";s:28:\"robo-gallery/robogallery.php\";s:6:\"3.2.11\";s:33:\"smart-slider-3/smart-slider-3.php\";s:8:\"3.5.1.12\";s:37:\"wp-stats-manager/wp-stats-manager.php\";s:3:\"6.4\";}}', 'no');
INSERT INTO `wp_options` VALUES (468, 'n2_ss3_version', '3.5.1.12/b:release-3.5.1.12/r:23139749a8387f67159e398e0146aff72bfb37ed', 'yes');
INSERT INTO `wp_options` VALUES (469, 'widget_smartslider3', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES (471, 'wsmKeepData', '1', 'yes');
INSERT INTO `wp_options` VALUES (472, 'wsm_tables', 'a:16:{s:7:\"LOG_URL\";s:8:\"_url_log\";s:10:\"LOG_UNIQUE\";s:15:\"_logUniqueVisit\";s:9:\"LOG_VISIT\";s:9:\"_logVisit\";s:2:\"OS\";s:9:\"_oSystems\";s:4:\"BROW\";s:9:\"_browsers\";s:4:\"TOOL\";s:9:\"_toolBars\";s:2:\"SE\";s:14:\"_searchEngines\";s:2:\"RG\";s:8:\"_regions\";s:4:\"RSOL\";s:12:\"_resolutions\";s:7:\"COUNTRY\";s:10:\"_countries\";s:3:\"DHR\";s:18:\"_dailyHourlyReport\";s:3:\"MDR\";s:19:\"_monthlyDailyReport\";s:3:\"YMR\";s:20:\"_yearlyMonthlyReport\";s:3:\"DWR\";s:16:\"_datewise_report\";s:3:\"MWR\";s:17:\"_monthwise_report\";s:3:\"YWR\";s:16:\"_yearwise_report\";}', 'yes');
INSERT INTO `wp_options` VALUES (473, 'wsm_dailyReportedTime', '2023-01-07', 'yes');
INSERT INTO `wp_options` VALUES (475, 'wsm_free_active_time', '1672909220', 'no');
INSERT INTO `wp_options` VALUES (477, '_transient_timeout_global_styles_agencyup', '1673024522', 'no');
INSERT INTO `wp_options` VALUES (478, '_transient_global_styles_agencyup', 'body{--wp--preset--color--black: #000000;--wp--preset--color--cyan-bluish-gray: #abb8c3;--wp--preset--color--white: #ffffff;--wp--preset--color--pale-pink: #f78da7;--wp--preset--color--vivid-red: #cf2e2e;--wp--preset--color--luminous-vivid-orange: #ff6900;--wp--preset--color--luminous-vivid-amber: #fcb900;--wp--preset--color--light-green-cyan: #7bdcb5;--wp--preset--color--vivid-green-cyan: #00d084;--wp--preset--color--pale-cyan-blue: #8ed1fc;--wp--preset--color--vivid-cyan-blue: #0693e3;--wp--preset--color--vivid-purple: #9b51e0;--wp--preset--gradient--vivid-cyan-blue-to-vivid-purple: linear-gradient(135deg,rgba(6,147,227,1) 0%,rgb(155,81,224) 100%);--wp--preset--gradient--light-green-cyan-to-vivid-green-cyan: linear-gradient(135deg,rgb(122,220,180) 0%,rgb(0,208,130) 100%);--wp--preset--gradient--luminous-vivid-amber-to-luminous-vivid-orange: linear-gradient(135deg,rgba(252,185,0,1) 0%,rgba(255,105,0,1) 100%);--wp--preset--gradient--luminous-vivid-orange-to-vivid-red: linear-gradient(135deg,rgba(255,105,0,1) 0%,rgb(207,46,46) 100%);--wp--preset--gradient--very-light-gray-to-cyan-bluish-gray: linear-gradient(135deg,rgb(238,238,238) 0%,rgb(169,184,195) 100%);--wp--preset--gradient--cool-to-warm-spectrum: linear-gradient(135deg,rgb(74,234,220) 0%,rgb(151,120,209) 20%,rgb(207,42,186) 40%,rgb(238,44,130) 60%,rgb(251,105,98) 80%,rgb(254,248,76) 100%);--wp--preset--gradient--blush-light-purple: linear-gradient(135deg,rgb(255,206,236) 0%,rgb(152,150,240) 100%);--wp--preset--gradient--blush-bordeaux: linear-gradient(135deg,rgb(254,205,165) 0%,rgb(254,45,45) 50%,rgb(107,0,62) 100%);--wp--preset--gradient--luminous-dusk: linear-gradient(135deg,rgb(255,203,112) 0%,rgb(199,81,192) 50%,rgb(65,88,208) 100%);--wp--preset--gradient--pale-ocean: linear-gradient(135deg,rgb(255,245,203) 0%,rgb(182,227,212) 50%,rgb(51,167,181) 100%);--wp--preset--gradient--electric-grass: linear-gradient(135deg,rgb(202,248,128) 0%,rgb(113,206,126) 100%);--wp--preset--gradient--midnight: linear-gradient(135deg,rgb(2,3,129) 0%,rgb(40,116,252) 100%);--wp--preset--duotone--dark-grayscale: url(\'#wp-duotone-dark-grayscale\');--wp--preset--duotone--grayscale: url(\'#wp-duotone-grayscale\');--wp--preset--duotone--purple-yellow: url(\'#wp-duotone-purple-yellow\');--wp--preset--duotone--blue-red: url(\'#wp-duotone-blue-red\');--wp--preset--duotone--midnight: url(\'#wp-duotone-midnight\');--wp--preset--duotone--magenta-yellow: url(\'#wp-duotone-magenta-yellow\');--wp--preset--duotone--purple-green: url(\'#wp-duotone-purple-green\');--wp--preset--duotone--blue-orange: url(\'#wp-duotone-blue-orange\');--wp--preset--font-size--small: 13px;--wp--preset--font-size--medium: 20px;--wp--preset--font-size--large: 36px;--wp--preset--font-size--x-large: 42px;--wp--preset--spacing--20: 0.44rem;--wp--preset--spacing--30: 0.67rem;--wp--preset--spacing--40: 1rem;--wp--preset--spacing--50: 1.5rem;--wp--preset--spacing--60: 2.25rem;--wp--preset--spacing--70: 3.38rem;--wp--preset--spacing--80: 5.06rem;}:where(.is-layout-flex){gap: 0.5em;}body .is-layout-flow > .alignleft{float: left;margin-inline-start: 0;margin-inline-end: 2em;}body .is-layout-flow > .alignright{float: right;margin-inline-start: 2em;margin-inline-end: 0;}body .is-layout-flow > .aligncenter{margin-left: auto !important;margin-right: auto !important;}body .is-layout-constrained > .alignleft{float: left;margin-inline-start: 0;margin-inline-end: 2em;}body .is-layout-constrained > .alignright{float: right;margin-inline-start: 2em;margin-inline-end: 0;}body .is-layout-constrained > .aligncenter{margin-left: auto !important;margin-right: auto !important;}body .is-layout-constrained > :where(:not(.alignleft):not(.alignright):not(.alignfull)){max-width: var(--wp--style--global--content-size);margin-left: auto !important;margin-right: auto !important;}body .is-layout-constrained > .alignwide{max-width: var(--wp--style--global--wide-size);}body .is-layout-flex{display: flex;}body .is-layout-flex{flex-wrap: wrap;align-items: center;}body .is-layout-flex > *{margin: 0;}:where(.wp-block-columns.is-layout-flex){gap: 2em;}.has-black-color{color: var(--wp--preset--color--black) !important;}.has-cyan-bluish-gray-color{color: var(--wp--preset--color--cyan-bluish-gray) !important;}.has-white-color{color: var(--wp--preset--color--white) !important;}.has-pale-pink-color{color: var(--wp--preset--color--pale-pink) !important;}.has-vivid-red-color{color: var(--wp--preset--color--vivid-red) !important;}.has-luminous-vivid-orange-color{color: var(--wp--preset--color--luminous-vivid-orange) !important;}.has-luminous-vivid-amber-color{color: var(--wp--preset--color--luminous-vivid-amber) !important;}.has-light-green-cyan-color{color: var(--wp--preset--color--light-green-cyan) !important;}.has-vivid-green-cyan-color{color: var(--wp--preset--color--vivid-green-cyan) !important;}.has-pale-cyan-blue-color{color: var(--wp--preset--color--pale-cyan-blue) !important;}.has-vivid-cyan-blue-color{color: var(--wp--preset--color--vivid-cyan-blue) !important;}.has-vivid-purple-color{color: var(--wp--preset--color--vivid-purple) !important;}.has-black-background-color{background-color: var(--wp--preset--color--black) !important;}.has-cyan-bluish-gray-background-color{background-color: var(--wp--preset--color--cyan-bluish-gray) !important;}.has-white-background-color{background-color: var(--wp--preset--color--white) !important;}.has-pale-pink-background-color{background-color: var(--wp--preset--color--pale-pink) !important;}.has-vivid-red-background-color{background-color: var(--wp--preset--color--vivid-red) !important;}.has-luminous-vivid-orange-background-color{background-color: var(--wp--preset--color--luminous-vivid-orange) !important;}.has-luminous-vivid-amber-background-color{background-color: var(--wp--preset--color--luminous-vivid-amber) !important;}.has-light-green-cyan-background-color{background-color: var(--wp--preset--color--light-green-cyan) !important;}.has-vivid-green-cyan-background-color{background-color: var(--wp--preset--color--vivid-green-cyan) !important;}.has-pale-cyan-blue-background-color{background-color: var(--wp--preset--color--pale-cyan-blue) !important;}.has-vivid-cyan-blue-background-color{background-color: var(--wp--preset--color--vivid-cyan-blue) !important;}.has-vivid-purple-background-color{background-color: var(--wp--preset--color--vivid-purple) !important;}.has-black-border-color{border-color: var(--wp--preset--color--black) !important;}.has-cyan-bluish-gray-border-color{border-color: var(--wp--preset--color--cyan-bluish-gray) !important;}.has-white-border-color{border-color: var(--wp--preset--color--white) !important;}.has-pale-pink-border-color{border-color: var(--wp--preset--color--pale-pink) !important;}.has-vivid-red-border-color{border-color: var(--wp--preset--color--vivid-red) !important;}.has-luminous-vivid-orange-border-color{border-color: var(--wp--preset--color--luminous-vivid-orange) !important;}.has-luminous-vivid-amber-border-color{border-color: var(--wp--preset--color--luminous-vivid-amber) !important;}.has-light-green-cyan-border-color{border-color: var(--wp--preset--color--light-green-cyan) !important;}.has-vivid-green-cyan-border-color{border-color: var(--wp--preset--color--vivid-green-cyan) !important;}.has-pale-cyan-blue-border-color{border-color: var(--wp--preset--color--pale-cyan-blue) !important;}.has-vivid-cyan-blue-border-color{border-color: var(--wp--preset--color--vivid-cyan-blue) !important;}.has-vivid-purple-border-color{border-color: var(--wp--preset--color--vivid-purple) !important;}.has-vivid-cyan-blue-to-vivid-purple-gradient-background{background: var(--wp--preset--gradient--vivid-cyan-blue-to-vivid-purple) !important;}.has-light-green-cyan-to-vivid-green-cyan-gradient-background{background: var(--wp--preset--gradient--light-green-cyan-to-vivid-green-cyan) !important;}.has-luminous-vivid-amber-to-luminous-vivid-orange-gradient-background{background: var(--wp--preset--gradient--luminous-vivid-amber-to-luminous-vivid-orange) !important;}.has-luminous-vivid-orange-to-vivid-red-gradient-background{background: var(--wp--preset--gradient--luminous-vivid-orange-to-vivid-red) !important;}.has-very-light-gray-to-cyan-bluish-gray-gradient-background{background: var(--wp--preset--gradient--very-light-gray-to-cyan-bluish-gray) !important;}.has-cool-to-warm-spectrum-gradient-background{background: var(--wp--preset--gradient--cool-to-warm-spectrum) !important;}.has-blush-light-purple-gradient-background{background: var(--wp--preset--gradient--blush-light-purple) !important;}.has-blush-bordeaux-gradient-background{background: var(--wp--preset--gradient--blush-bordeaux) !important;}.has-luminous-dusk-gradient-background{background: var(--wp--preset--gradient--luminous-dusk) !important;}.has-pale-ocean-gradient-background{background: var(--wp--preset--gradient--pale-ocean) !important;}.has-electric-grass-gradient-background{background: var(--wp--preset--gradient--electric-grass) !important;}.has-midnight-gradient-background{background: var(--wp--preset--gradient--midnight) !important;}.has-small-font-size{font-size: var(--wp--preset--font-size--small) !important;}.has-medium-font-size{font-size: var(--wp--preset--font-size--medium) !important;}.has-large-font-size{font-size: var(--wp--preset--font-size--large) !important;}.has-x-large-font-size{font-size: var(--wp--preset--font-size--x-large) !important;}', 'no');
INSERT INTO `wp_options` VALUES (479, '_transient_timeout_global_styles_svg_filters_agencyup', '1673024522', 'no');
INSERT INTO `wp_options` VALUES (480, '_transient_global_styles_svg_filters_agencyup', '<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-dark-grayscale\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0 0.49803921568627\" /><feFuncG type=\"table\" tableValues=\"0 0.49803921568627\" /><feFuncB type=\"table\" tableValues=\"0 0.49803921568627\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-grayscale\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0 1\" /><feFuncG type=\"table\" tableValues=\"0 1\" /><feFuncB type=\"table\" tableValues=\"0 1\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-purple-yellow\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0.54901960784314 0.98823529411765\" /><feFuncG type=\"table\" tableValues=\"0 1\" /><feFuncB type=\"table\" tableValues=\"0.71764705882353 0.25490196078431\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-blue-red\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0 1\" /><feFuncG type=\"table\" tableValues=\"0 0.27843137254902\" /><feFuncB type=\"table\" tableValues=\"0.5921568627451 0.27843137254902\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-midnight\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0 0\" /><feFuncG type=\"table\" tableValues=\"0 0.64705882352941\" /><feFuncB type=\"table\" tableValues=\"0 1\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-magenta-yellow\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0.78039215686275 1\" /><feFuncG type=\"table\" tableValues=\"0 0.94901960784314\" /><feFuncB type=\"table\" tableValues=\"0.35294117647059 0.47058823529412\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-purple-green\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0.65098039215686 0.40392156862745\" /><feFuncG type=\"table\" tableValues=\"0 1\" /><feFuncB type=\"table\" tableValues=\"0.44705882352941 0.4\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-blue-orange\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0.098039215686275 1\" /><feFuncG type=\"table\" tableValues=\"0 0.66274509803922\" /><feFuncB type=\"table\" tableValues=\"0.84705882352941 0.41960784313725\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg>', 'no');
INSERT INTO `wp_options` VALUES (482, '_site_transient_timeout_theme_roots', '1673026265', 'no');
INSERT INTO `wp_options` VALUES (483, '_site_transient_theme_roots', 'a:4:{s:8:\"agencyup\";s:7:\"/themes\";s:15:\"twentytwentyone\";s:7:\"/themes\";s:17:\"twentytwentythree\";s:7:\"/themes\";s:15:\"twentytwentytwo\";s:7:\"/themes\";}', 'no');
INSERT INTO `wp_options` VALUES (484, 'forminator_posts_map', 'a:0:{}', 'yes');
INSERT INTO `wp_options` VALUES (485, 'wsm_lastHitTime', '2023-01-06 17:01:19', 'yes');
COMMIT;

-- ----------------------------
-- Table structure for wp_postmeta
-- ----------------------------
DROP TABLE IF EXISTS `wp_postmeta`;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of wp_postmeta
-- ----------------------------
BEGIN;
INSERT INTO `wp_postmeta` VALUES (1, 2, '_wp_page_template', 'default');
INSERT INTO `wp_postmeta` VALUES (2, 3, '_wp_page_template', 'default');
INSERT INTO `wp_postmeta` VALUES (3, 5, '_wp_attached_file', '2023/01/highcompress-Depositphotos_88915472_l-2015-compressor.jpg');
INSERT INTO `wp_postmeta` VALUES (4, 5, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:2000;s:6:\"height\";i:1333;s:4:\"file\";s:65:\"2023/01/highcompress-Depositphotos_88915472_l-2015-compressor.jpg\";s:8:\"filesize\";i:164779;s:5:\"sizes\";a:5:{s:6:\"medium\";a:5:{s:4:\"file\";s:65:\"highcompress-Depositphotos_88915472_l-2015-compressor-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:12318;}s:5:\"large\";a:5:{s:4:\"file\";s:66:\"highcompress-Depositphotos_88915472_l-2015-compressor-1024x682.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:682;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:104607;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:65:\"highcompress-Depositphotos_88915472_l-2015-compressor-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5917;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:65:\"highcompress-Depositphotos_88915472_l-2015-compressor-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:63511;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:67:\"highcompress-Depositphotos_88915472_l-2015-compressor-1536x1024.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:203147;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (5, 6, '_wp_attached_file', '2023/01/cropped-highcompress-Depositphotos_88915472_l-2015-compressor.jpg');
INSERT INTO `wp_postmeta` VALUES (6, 6, '_wp_attachment_context', 'custom-logo');
INSERT INTO `wp_postmeta` VALUES (7, 6, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1333;s:6:\"height\";i:1333;s:4:\"file\";s:73:\"2023/01/cropped-highcompress-Depositphotos_88915472_l-2015-compressor.jpg\";s:8:\"filesize\";i:242196;s:5:\"sizes\";a:4:{s:6:\"medium\";a:5:{s:4:\"file\";s:73:\"cropped-highcompress-Depositphotos_88915472_l-2015-compressor-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:18902;}s:5:\"large\";a:5:{s:4:\"file\";s:75:\"cropped-highcompress-Depositphotos_88915472_l-2015-compressor-1024x1024.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:152538;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:73:\"cropped-highcompress-Depositphotos_88915472_l-2015-compressor-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5930;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:73:\"cropped-highcompress-Depositphotos_88915472_l-2015-compressor-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:94660;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (8, 7, '_wp_trash_meta_status', 'publish');
INSERT INTO `wp_postmeta` VALUES (9, 7, '_wp_trash_meta_time', '1672815856');
INSERT INTO `wp_postmeta` VALUES (10, 8, '_wp_page_template', 'template-homepage.php');
INSERT INTO `wp_postmeta` VALUES (11, 9, '_wp_page_template', 'page.php');
INSERT INTO `wp_postmeta` VALUES (12, 10, '_wp_trash_meta_status', 'publish');
INSERT INTO `wp_postmeta` VALUES (13, 10, '_wp_trash_meta_time', '1672815945');
INSERT INTO `wp_postmeta` VALUES (14, 11, '_wp_trash_meta_status', 'publish');
INSERT INTO `wp_postmeta` VALUES (15, 11, '_wp_trash_meta_time', '1672815988');
INSERT INTO `wp_postmeta` VALUES (16, 12, '_edit_lock', '1672816074:1');
INSERT INTO `wp_postmeta` VALUES (17, 12, '_wp_trash_meta_status', 'publish');
INSERT INTO `wp_postmeta` VALUES (18, 12, '_wp_trash_meta_time', '1672816093');
INSERT INTO `wp_postmeta` VALUES (19, 13, '_menu_item_type', 'post_type');
INSERT INTO `wp_postmeta` VALUES (20, 13, '_menu_item_menu_item_parent', '0');
INSERT INTO `wp_postmeta` VALUES (21, 13, '_menu_item_object_id', '8');
INSERT INTO `wp_postmeta` VALUES (22, 13, '_menu_item_object', 'page');
INSERT INTO `wp_postmeta` VALUES (23, 13, '_menu_item_target', '');
INSERT INTO `wp_postmeta` VALUES (24, 13, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (25, 13, '_menu_item_xfn', '');
INSERT INTO `wp_postmeta` VALUES (26, 13, '_menu_item_url', '');
INSERT INTO `wp_postmeta` VALUES (28, 14, '_menu_item_type', 'post_type');
INSERT INTO `wp_postmeta` VALUES (29, 14, '_menu_item_menu_item_parent', '0');
INSERT INTO `wp_postmeta` VALUES (30, 14, '_menu_item_object_id', '9');
INSERT INTO `wp_postmeta` VALUES (31, 14, '_menu_item_object', 'page');
INSERT INTO `wp_postmeta` VALUES (32, 14, '_menu_item_target', '');
INSERT INTO `wp_postmeta` VALUES (33, 14, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (34, 14, '_menu_item_xfn', '');
INSERT INTO `wp_postmeta` VALUES (35, 14, '_menu_item_url', '');
INSERT INTO `wp_postmeta` VALUES (37, 15, '_menu_item_type', 'post_type');
INSERT INTO `wp_postmeta` VALUES (38, 15, '_menu_item_menu_item_parent', '0');
INSERT INTO `wp_postmeta` VALUES (39, 15, '_menu_item_object_id', '2');
INSERT INTO `wp_postmeta` VALUES (40, 15, '_menu_item_object', 'page');
INSERT INTO `wp_postmeta` VALUES (41, 15, '_menu_item_target', '');
INSERT INTO `wp_postmeta` VALUES (42, 15, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (43, 15, '_menu_item_xfn', '');
INSERT INTO `wp_postmeta` VALUES (44, 15, '_menu_item_url', '');
INSERT INTO `wp_postmeta` VALUES (46, 16, '_edit_lock', '1672816545:1');
INSERT INTO `wp_postmeta` VALUES (47, 18, '_menu_item_type', 'post_type');
INSERT INTO `wp_postmeta` VALUES (48, 18, '_menu_item_menu_item_parent', '15');
INSERT INTO `wp_postmeta` VALUES (49, 18, '_menu_item_object_id', '16');
INSERT INTO `wp_postmeta` VALUES (50, 18, '_menu_item_object', 'page');
INSERT INTO `wp_postmeta` VALUES (51, 18, '_menu_item_target', '');
INSERT INTO `wp_postmeta` VALUES (52, 18, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (53, 18, '_menu_item_xfn', '');
INSERT INTO `wp_postmeta` VALUES (54, 18, '_menu_item_url', '');
INSERT INTO `wp_postmeta` VALUES (56, 19, '_edit_lock', '1672816641:1');
INSERT INTO `wp_postmeta` VALUES (57, 21, '_edit_lock', '1672816653:1');
INSERT INTO `wp_postmeta` VALUES (58, 23, '_edit_lock', '1672816669:1');
INSERT INTO `wp_postmeta` VALUES (59, 25, '_edit_lock', '1672816689:1');
INSERT INTO `wp_postmeta` VALUES (60, 27, '_edit_lock', '1672816702:1');
INSERT INTO `wp_postmeta` VALUES (61, 29, '_menu_item_type', 'post_type');
INSERT INTO `wp_postmeta` VALUES (62, 29, '_menu_item_menu_item_parent', '15');
INSERT INTO `wp_postmeta` VALUES (63, 29, '_menu_item_object_id', '27');
INSERT INTO `wp_postmeta` VALUES (64, 29, '_menu_item_object', 'page');
INSERT INTO `wp_postmeta` VALUES (65, 29, '_menu_item_target', '');
INSERT INTO `wp_postmeta` VALUES (66, 29, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (67, 29, '_menu_item_xfn', '');
INSERT INTO `wp_postmeta` VALUES (68, 29, '_menu_item_url', '');
INSERT INTO `wp_postmeta` VALUES (70, 30, '_menu_item_type', 'post_type');
INSERT INTO `wp_postmeta` VALUES (71, 30, '_menu_item_menu_item_parent', '15');
INSERT INTO `wp_postmeta` VALUES (72, 30, '_menu_item_object_id', '25');
INSERT INTO `wp_postmeta` VALUES (73, 30, '_menu_item_object', 'page');
INSERT INTO `wp_postmeta` VALUES (74, 30, '_menu_item_target', '');
INSERT INTO `wp_postmeta` VALUES (75, 30, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (76, 30, '_menu_item_xfn', '');
INSERT INTO `wp_postmeta` VALUES (77, 30, '_menu_item_url', '');
INSERT INTO `wp_postmeta` VALUES (79, 31, '_menu_item_type', 'post_type');
INSERT INTO `wp_postmeta` VALUES (80, 31, '_menu_item_menu_item_parent', '15');
INSERT INTO `wp_postmeta` VALUES (81, 31, '_menu_item_object_id', '23');
INSERT INTO `wp_postmeta` VALUES (82, 31, '_menu_item_object', 'page');
INSERT INTO `wp_postmeta` VALUES (83, 31, '_menu_item_target', '');
INSERT INTO `wp_postmeta` VALUES (84, 31, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (85, 31, '_menu_item_xfn', '');
INSERT INTO `wp_postmeta` VALUES (86, 31, '_menu_item_url', '');
INSERT INTO `wp_postmeta` VALUES (88, 32, '_menu_item_type', 'post_type');
INSERT INTO `wp_postmeta` VALUES (89, 32, '_menu_item_menu_item_parent', '15');
INSERT INTO `wp_postmeta` VALUES (90, 32, '_menu_item_object_id', '21');
INSERT INTO `wp_postmeta` VALUES (91, 32, '_menu_item_object', 'page');
INSERT INTO `wp_postmeta` VALUES (92, 32, '_menu_item_target', '');
INSERT INTO `wp_postmeta` VALUES (93, 32, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (94, 32, '_menu_item_xfn', '');
INSERT INTO `wp_postmeta` VALUES (95, 32, '_menu_item_url', '');
INSERT INTO `wp_postmeta` VALUES (97, 33, '_menu_item_type', 'post_type');
INSERT INTO `wp_postmeta` VALUES (98, 33, '_menu_item_menu_item_parent', '15');
INSERT INTO `wp_postmeta` VALUES (99, 33, '_menu_item_object_id', '19');
INSERT INTO `wp_postmeta` VALUES (100, 33, '_menu_item_object', 'page');
INSERT INTO `wp_postmeta` VALUES (101, 33, '_menu_item_target', '');
INSERT INTO `wp_postmeta` VALUES (102, 33, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (103, 33, '_menu_item_xfn', '');
INSERT INTO `wp_postmeta` VALUES (104, 33, '_menu_item_url', '');
INSERT INTO `wp_postmeta` VALUES (106, 34, '_edit_lock', '1672816770:1');
INSERT INTO `wp_postmeta` VALUES (107, 36, '_menu_item_type', 'post_type');
INSERT INTO `wp_postmeta` VALUES (108, 36, '_menu_item_menu_item_parent', '0');
INSERT INTO `wp_postmeta` VALUES (109, 36, '_menu_item_object_id', '34');
INSERT INTO `wp_postmeta` VALUES (110, 36, '_menu_item_object', 'page');
INSERT INTO `wp_postmeta` VALUES (111, 36, '_menu_item_target', '');
INSERT INTO `wp_postmeta` VALUES (112, 36, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (113, 36, '_menu_item_xfn', '');
INSERT INTO `wp_postmeta` VALUES (114, 36, '_menu_item_url', '');
INSERT INTO `wp_postmeta` VALUES (116, 37, '_edit_lock', '1672816828:1');
INSERT INTO `wp_postmeta` VALUES (119, 37, '_wp_trash_meta_status', 'publish');
INSERT INTO `wp_postmeta` VALUES (120, 37, '_wp_trash_meta_time', '1672817015');
INSERT INTO `wp_postmeta` VALUES (121, 37, '_wp_desired_post_slug', 'testimonial');
INSERT INTO `wp_postmeta` VALUES (122, 1, '_wp_trash_meta_status', 'publish');
INSERT INTO `wp_postmeta` VALUES (123, 1, '_wp_trash_meta_time', '1672817015');
INSERT INTO `wp_postmeta` VALUES (124, 1, '_wp_desired_post_slug', 'hello-world');
INSERT INTO `wp_postmeta` VALUES (125, 1, '_wp_trash_meta_comments_status', 'a:1:{i:1;s:1:\"1\";}');
INSERT INTO `wp_postmeta` VALUES (126, 40, '_edit_lock', '1672816885:1');
INSERT INTO `wp_postmeta` VALUES (127, 42, '_menu_item_type', 'post_type');
INSERT INTO `wp_postmeta` VALUES (128, 42, '_menu_item_menu_item_parent', '0');
INSERT INTO `wp_postmeta` VALUES (129, 42, '_menu_item_object_id', '40');
INSERT INTO `wp_postmeta` VALUES (130, 42, '_menu_item_object', 'page');
INSERT INTO `wp_postmeta` VALUES (131, 42, '_menu_item_target', '');
INSERT INTO `wp_postmeta` VALUES (132, 42, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (133, 42, '_menu_item_xfn', '');
INSERT INTO `wp_postmeta` VALUES (134, 42, '_menu_item_url', '');
INSERT INTO `wp_postmeta` VALUES (136, 43, '_wp_attached_file', '2023/01/logo2xx-1-e1549956915663-1.png');
INSERT INTO `wp_postmeta` VALUES (137, 43, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:500;s:6:\"height\";i:77;s:4:\"file\";s:38:\"2023/01/logo2xx-1-e1549956915663-1.png\";s:8:\"filesize\";i:33910;s:5:\"sizes\";a:2:{s:6:\"medium\";a:5:{s:4:\"file\";s:37:\"logo2xx-1-e1549956915663-1-300x46.png\";s:5:\"width\";i:300;s:6:\"height\";i:46;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:15169;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:37:\"logo2xx-1-e1549956915663-1-150x77.png\";s:5:\"width\";i:150;s:6:\"height\";i:77;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:7766;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (138, 44, '_wp_attached_file', '2023/01/cropped-logo2xx-1-e1549956915663-1.png');
INSERT INTO `wp_postmeta` VALUES (139, 44, '_wp_attachment_context', 'custom-logo');
INSERT INTO `wp_postmeta` VALUES (140, 44, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:77;s:6:\"height\";i:77;s:4:\"file\";s:46:\"2023/01/cropped-logo2xx-1-e1549956915663-1.png\";s:8:\"filesize\";i:11928;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (141, 45, '_edit_lock', '1672817326:1');
INSERT INTO `wp_postmeta` VALUES (142, 45, '_wp_trash_meta_status', 'publish');
INSERT INTO `wp_postmeta` VALUES (143, 45, '_wp_trash_meta_time', '1672817328');
INSERT INTO `wp_postmeta` VALUES (144, 46, '_wp_attached_file', '2023/01/Screen-Shot-2023-01-05-at-2.15.16-PM.png');
INSERT INTO `wp_postmeta` VALUES (145, 46, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:101;s:6:\"height\";i:81;s:4:\"file\";s:48:\"2023/01/Screen-Shot-2023-01-05-at-2.15.16-PM.png\";s:8:\"filesize\";i:15967;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (146, 8, '_edit_lock', '1672903368:1');
INSERT INTO `wp_postmeta` VALUES (147, 8, '_edit_last', '1');
INSERT INTO `wp_postmeta` VALUES (148, 8, 'om_disable_all_campaigns', '');
INSERT INTO `wp_postmeta` VALUES (149, 8, '_aioseo_title', 'Home - PT. Transporindo Agung Sejahtera');
INSERT INTO `wp_postmeta` VALUES (150, 8, '_aioseo_description', 'Transporindo Agung Sejahtera Jasa Freight Forwarder EMKL Import Ekspedisi Muatan Kapal Laut Medan Jakarta Surabaya Makassar');
INSERT INTO `wp_postmeta` VALUES (151, 8, '_aioseo_keywords', '');
INSERT INTO `wp_postmeta` VALUES (152, 8, '_aioseo_og_title', NULL);
INSERT INTO `wp_postmeta` VALUES (153, 8, '_aioseo_og_description', NULL);
INSERT INTO `wp_postmeta` VALUES (154, 8, '_aioseo_og_article_section', '');
INSERT INTO `wp_postmeta` VALUES (155, 8, '_aioseo_og_article_tags', '');
INSERT INTO `wp_postmeta` VALUES (156, 8, '_aioseo_twitter_title', NULL);
INSERT INTO `wp_postmeta` VALUES (157, 8, '_aioseo_twitter_description', NULL);
INSERT INTO `wp_postmeta` VALUES (158, 48, '_edit_last', '1');
INSERT INTO `wp_postmeta` VALUES (159, 48, '_edit_lock', '1672903403:1');
INSERT INTO `wp_postmeta` VALUES (160, 48, '_wp_page_template', 'default');
INSERT INTO `wp_postmeta` VALUES (161, 48, 'om_disable_all_campaigns', '');
INSERT INTO `wp_postmeta` VALUES (162, 48, '_aioseo_title', NULL);
INSERT INTO `wp_postmeta` VALUES (163, 48, '_aioseo_description', NULL);
INSERT INTO `wp_postmeta` VALUES (164, 48, '_aioseo_keywords', '');
INSERT INTO `wp_postmeta` VALUES (165, 48, '_aioseo_og_title', NULL);
INSERT INTO `wp_postmeta` VALUES (166, 48, '_aioseo_og_description', NULL);
INSERT INTO `wp_postmeta` VALUES (167, 48, '_aioseo_og_article_section', '');
INSERT INTO `wp_postmeta` VALUES (168, 48, '_aioseo_og_article_tags', '');
INSERT INTO `wp_postmeta` VALUES (169, 48, '_aioseo_twitter_title', NULL);
INSERT INTO `wp_postmeta` VALUES (170, 48, '_aioseo_twitter_description', NULL);
INSERT INTO `wp_postmeta` VALUES (171, 50, '_edit_last', '1');
INSERT INTO `wp_postmeta` VALUES (172, 50, '_edit_lock', '1672903434:1');
INSERT INTO `wp_postmeta` VALUES (173, 50, '_wp_page_template', 'default');
INSERT INTO `wp_postmeta` VALUES (174, 50, 'om_disable_all_campaigns', '');
INSERT INTO `wp_postmeta` VALUES (175, 50, '_aioseo_title', NULL);
INSERT INTO `wp_postmeta` VALUES (176, 50, '_aioseo_description', NULL);
INSERT INTO `wp_postmeta` VALUES (177, 50, '_aioseo_keywords', '');
INSERT INTO `wp_postmeta` VALUES (178, 50, '_aioseo_og_title', NULL);
INSERT INTO `wp_postmeta` VALUES (179, 50, '_aioseo_og_description', NULL);
INSERT INTO `wp_postmeta` VALUES (180, 50, '_aioseo_og_article_section', '');
INSERT INTO `wp_postmeta` VALUES (181, 50, '_aioseo_og_article_tags', '');
INSERT INTO `wp_postmeta` VALUES (182, 50, '_aioseo_twitter_title', NULL);
INSERT INTO `wp_postmeta` VALUES (183, 50, '_aioseo_twitter_description', NULL);
INSERT INTO `wp_postmeta` VALUES (184, 52, '_menu_item_type', 'post_type');
INSERT INTO `wp_postmeta` VALUES (185, 52, '_menu_item_menu_item_parent', '0');
INSERT INTO `wp_postmeta` VALUES (186, 52, '_menu_item_object_id', '50');
INSERT INTO `wp_postmeta` VALUES (187, 52, '_menu_item_object', 'page');
INSERT INTO `wp_postmeta` VALUES (188, 52, '_menu_item_target', '');
INSERT INTO `wp_postmeta` VALUES (189, 52, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (190, 52, '_menu_item_xfn', '');
INSERT INTO `wp_postmeta` VALUES (191, 52, '_menu_item_url', '');
INSERT INTO `wp_postmeta` VALUES (193, 53, '_menu_item_type', 'post_type');
INSERT INTO `wp_postmeta` VALUES (194, 53, '_menu_item_menu_item_parent', '0');
INSERT INTO `wp_postmeta` VALUES (195, 53, '_menu_item_object_id', '48');
INSERT INTO `wp_postmeta` VALUES (196, 53, '_menu_item_object', 'page');
INSERT INTO `wp_postmeta` VALUES (197, 53, '_menu_item_target', '');
INSERT INTO `wp_postmeta` VALUES (198, 53, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (199, 53, '_menu_item_xfn', '');
INSERT INTO `wp_postmeta` VALUES (200, 53, '_menu_item_url', '');
INSERT INTO `wp_postmeta` VALUES (202, 13, '_wp_old_date', '2023-01-04');
INSERT INTO `wp_postmeta` VALUES (203, 15, '_wp_old_date', '2023-01-04');
INSERT INTO `wp_postmeta` VALUES (204, 31, '_wp_old_date', '2023-01-04');
INSERT INTO `wp_postmeta` VALUES (205, 18, '_wp_old_date', '2023-01-04');
INSERT INTO `wp_postmeta` VALUES (206, 33, '_wp_old_date', '2023-01-04');
INSERT INTO `wp_postmeta` VALUES (207, 32, '_wp_old_date', '2023-01-04');
INSERT INTO `wp_postmeta` VALUES (208, 29, '_wp_old_date', '2023-01-04');
INSERT INTO `wp_postmeta` VALUES (209, 30, '_wp_old_date', '2023-01-04');
INSERT INTO `wp_postmeta` VALUES (210, 42, '_wp_old_date', '2023-01-04');
INSERT INTO `wp_postmeta` VALUES (211, 14, '_wp_old_date', '2023-01-04');
INSERT INTO `wp_postmeta` VALUES (212, 36, '_wp_old_date', '2023-01-04');
COMMIT;

-- ----------------------------
-- Table structure for wp_posts
-- ----------------------------
DROP TABLE IF EXISTS `wp_posts`;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of wp_posts
-- ----------------------------
BEGIN;
INSERT INTO `wp_posts` VALUES (1, 1, '2022-12-30 02:20:22', '2022-12-30 02:20:22', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'trash', 'open', 'open', '', 'hello-world__trashed', '', '', '2023-01-04 07:23:35', '2023-01-04 07:23:35', '', 0, 'http://localhost:82/wpbaru/?p=1', 0, 'post', '', 1);
INSERT INTO `wp_posts` VALUES (2, 1, '2022-12-30 02:20:22', '2022-12-30 02:20:22', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://localhost:82/wpbaru/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2022-12-30 02:20:22', '2022-12-30 02:20:22', '', 0, 'http://localhost:82/wpbaru/?page_id=2', 0, 'page', '', 0);
INSERT INTO `wp_posts` VALUES (3, 1, '2022-12-30 02:20:22', '2022-12-30 02:20:22', '<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Our website address is: http://localhost:82/wpbaru.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Comments</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Media</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Cookies</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Embedded content from other websites</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you request a password reset, your IP address will be included in the reset email.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where your data is sent</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph -->', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2022-12-30 02:20:22', '2022-12-30 02:20:22', '', 0, 'http://localhost:82/wpbaru/?page_id=3', 0, 'page', '', 0);
INSERT INTO `wp_posts` VALUES (5, 1, '2023-01-04 07:04:04', '2023-01-04 07:04:04', '', 'highcompress-Depositphotos_88915472_l-2015-compressor', '', 'inherit', 'open', 'closed', '', 'highcompress-depositphotos_88915472_l-2015-compressor', '', '', '2023-01-04 07:04:04', '2023-01-04 07:04:04', '', 0, 'http://localhost:82/wpbaru/wp-content/uploads/2023/01/highcompress-Depositphotos_88915472_l-2015-compressor.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `wp_posts` VALUES (6, 1, '2023-01-04 07:04:10', '2023-01-04 07:04:10', 'http://localhost:82/wpbaru/wp-content/uploads/2023/01/cropped-highcompress-Depositphotos_88915472_l-2015-compressor.jpg', 'cropped-highcompress-Depositphotos_88915472_l-2015-compressor.jpg', '', 'inherit', 'open', 'closed', '', 'cropped-highcompress-depositphotos_88915472_l-2015-compressor-jpg', '', '', '2023-01-04 07:04:10', '2023-01-04 07:04:10', '', 0, 'http://localhost:82/wpbaru/wp-content/uploads/2023/01/cropped-highcompress-Depositphotos_88915472_l-2015-compressor.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `wp_posts` VALUES (7, 1, '2023-01-04 07:04:16', '2023-01-04 07:04:16', '{\n    \"agencyup::custom_logo\": {\n        \"value\": 6,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2023-01-04 07:04:16\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '94e938ea-6b1e-4dc3-b4f2-29abf18ddeca', '', '', '2023-01-04 07:04:16', '2023-01-04 07:04:16', '', 0, 'http://localhost:82/wpbaru/2023/01/04/94e938ea-6b1e-4dc3-b4f2-29abf18ddeca/', 0, 'customize_changeset', '', 0);
INSERT INTO `wp_posts` VALUES (8, 1, '2023-01-04 07:05:06', '2023-01-04 07:05:06', '', 'Home', '', 'publish', 'closed', 'closed', '', 'home', '', '', '2023-01-05 14:24:33', '2023-01-05 07:24:33', '', 0, 'http://localhost:82/wpbaru/home/', 0, 'page', '', 0);
INSERT INTO `wp_posts` VALUES (9, 1, '2023-01-04 07:05:06', '2023-01-04 07:05:06', '', 'Blog', '', 'publish', 'closed', 'closed', '', 'blog', '', '', '2023-01-04 07:05:06', '2023-01-04 07:05:06', '', 0, 'http://localhost:82/wpbaru/blog/', 0, 'page', '', 0);
INSERT INTO `wp_posts` VALUES (10, 1, '2023-01-04 07:05:45', '2023-01-04 07:05:45', '{\n    \"agencyup::custom_logo\": {\n        \"value\": \"\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2023-01-04 07:05:45\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '56f16f67-43c5-46ba-bca6-d212e7d3aaba', '', '', '2023-01-04 07:05:45', '2023-01-04 07:05:45', '', 0, 'http://localhost:82/wpbaru/2023/01/04/56f16f67-43c5-46ba-bca6-d212e7d3aaba/', 0, 'customize_changeset', '', 0);
INSERT INTO `wp_posts` VALUES (11, 1, '2023-01-04 07:06:28', '2023-01-04 07:06:28', '{\n    \"agencyup::slider_image\": {\n        \"value\": \"http://localhost:82/wpbaru/wp-content/uploads/2023/01/highcompress-Depositphotos_88915472_l-2015-compressor.jpg\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2023-01-04 07:06:28\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '5a0f6be8-804c-49d5-9323-38d2a546d06f', '', '', '2023-01-04 07:06:28', '2023-01-04 07:06:28', '', 0, 'http://localhost:82/wpbaru/2023/01/04/5a0f6be8-804c-49d5-9323-38d2a546d06f/', 0, 'customize_changeset', '', 0);
INSERT INTO `wp_posts` VALUES (12, 1, '2023-01-04 07:08:13', '2023-01-04 07:08:13', '{\n    \"agencyup::slider_title\": {\n        \"value\": \"Komitmen\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2023-01-04 07:07:28\"\n    },\n    \"agencyup::slider_discription\": {\n        \"value\": \"Tepat Waktu, Aman & Layanan Cepat\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2023-01-04 07:08:13\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '37e5a312-312b-4627-ab39-2dca16312584', '', '', '2023-01-04 07:08:13', '2023-01-04 07:08:13', '', 0, 'http://localhost:82/wpbaru/?p=12', 0, 'customize_changeset', '', 0);
INSERT INTO `wp_posts` VALUES (13, 1, '2023-01-05 14:26:36', '2023-01-04 07:14:16', ' ', '', '', 'publish', 'closed', 'closed', '', '13', '', '', '2023-01-05 14:26:36', '2023-01-05 07:26:36', '', 0, 'http://localhost:82/wpbaru/?p=13', 1, 'nav_menu_item', '', 0);
INSERT INTO `wp_posts` VALUES (14, 1, '2023-01-05 14:26:36', '2023-01-04 07:14:16', ' ', '', '', 'publish', 'closed', 'closed', '', '14', '', '', '2023-01-05 14:26:36', '2023-01-05 07:26:36', '', 0, 'http://localhost:82/wpbaru/?p=14', 10, 'nav_menu_item', '', 0);
INSERT INTO `wp_posts` VALUES (15, 1, '2023-01-05 14:26:36', '2023-01-04 07:14:16', '', 'Sejarah', '', 'publish', 'closed', 'closed', '', '15', '', '', '2023-01-05 14:26:36', '2023-01-05 07:26:36', '', 0, 'http://localhost:82/wpbaru/?p=15', 2, 'nav_menu_item', '', 0);
INSERT INTO `wp_posts` VALUES (16, 1, '2023-01-04 07:17:57', '2023-01-04 07:17:57', '', 'Visi & Misi', '', 'publish', 'closed', 'closed', '', 'visi-misi', '', '', '2023-01-04 07:17:57', '2023-01-04 07:17:57', '', 0, 'http://localhost:82/wpbaru/?page_id=16', 0, 'page', '', 0);
INSERT INTO `wp_posts` VALUES (17, 1, '2023-01-04 07:17:57', '2023-01-04 07:17:57', '', 'Visi & Misi', '', 'inherit', 'closed', 'closed', '', '16-revision-v1', '', '', '2023-01-04 07:17:57', '2023-01-04 07:17:57', '', 16, 'http://localhost:82/wpbaru/?p=17', 0, 'revision', '', 0);
INSERT INTO `wp_posts` VALUES (18, 1, '2023-01-05 14:26:36', '2023-01-04 07:18:35', ' ', '', '', 'publish', 'closed', 'closed', '', '18', '', '', '2023-01-05 14:26:36', '2023-01-05 07:26:36', '', 0, 'http://localhost:82/wpbaru/?p=18', 4, 'nav_menu_item', '', 0);
INSERT INTO `wp_posts` VALUES (19, 1, '2023-01-04 07:19:41', '2023-01-04 07:19:41', '', 'Budaya Perusahaan', '', 'publish', 'closed', 'closed', '', 'budaya-perusahaan', '', '', '2023-01-04 07:19:41', '2023-01-04 07:19:41', '', 0, 'http://localhost:82/wpbaru/?page_id=19', 0, 'page', '', 0);
INSERT INTO `wp_posts` VALUES (20, 1, '2023-01-04 07:19:41', '2023-01-04 07:19:41', '', 'Budaya Perusahaan', '', 'inherit', 'closed', 'closed', '', '19-revision-v1', '', '', '2023-01-04 07:19:41', '2023-01-04 07:19:41', '', 19, 'http://localhost:82/wpbaru/?p=20', 0, 'revision', '', 0);
INSERT INTO `wp_posts` VALUES (21, 1, '2023-01-04 07:19:55', '2023-01-04 07:19:55', '', 'Video', '', 'publish', 'closed', 'closed', '', 'video', '', '', '2023-01-04 07:19:55', '2023-01-04 07:19:55', '', 0, 'http://localhost:82/wpbaru/?page_id=21', 0, 'page', '', 0);
INSERT INTO `wp_posts` VALUES (22, 1, '2023-01-04 07:19:55', '2023-01-04 07:19:55', '', 'Video', '', 'inherit', 'closed', 'closed', '', '21-revision-v1', '', '', '2023-01-04 07:19:55', '2023-01-04 07:19:55', '', 21, 'http://localhost:82/wpbaru/?p=22', 0, 'revision', '', 0);
INSERT INTO `wp_posts` VALUES (23, 1, '2023-01-04 07:20:05', '2023-01-04 07:20:05', '', 'Sejarah', '', 'publish', 'closed', 'closed', '', 'sejarah', '', '', '2023-01-04 07:20:05', '2023-01-04 07:20:05', '', 0, 'http://localhost:82/wpbaru/?page_id=23', 0, 'page', '', 0);
INSERT INTO `wp_posts` VALUES (24, 1, '2023-01-04 07:20:05', '2023-01-04 07:20:05', '', 'Sejarah', '', 'inherit', 'closed', 'closed', '', '23-revision-v1', '', '', '2023-01-04 07:20:05', '2023-01-04 07:20:05', '', 23, 'http://localhost:82/wpbaru/?p=24', 0, 'revision', '', 0);
INSERT INTO `wp_posts` VALUES (25, 1, '2023-01-04 07:20:30', '2023-01-04 07:20:30', '', 'Foto Amal Sembako', '', 'publish', 'closed', 'closed', '', 'foto-amal-sembako', '', '', '2023-01-04 07:20:30', '2023-01-04 07:20:30', '', 0, 'http://localhost:82/wpbaru/?page_id=25', 0, 'page', '', 0);
INSERT INTO `wp_posts` VALUES (26, 1, '2023-01-04 07:20:30', '2023-01-04 07:20:30', '', 'Foto Amal Sembako', '', 'inherit', 'closed', 'closed', '', '25-revision-v1', '', '', '2023-01-04 07:20:30', '2023-01-04 07:20:30', '', 25, 'http://localhost:82/wpbaru/?p=26', 0, 'revision', '', 0);
INSERT INTO `wp_posts` VALUES (27, 1, '2023-01-04 07:20:44', '2023-01-04 07:20:44', '', 'Foto Amal Rumah', '', 'publish', 'closed', 'closed', '', 'foto-amal-rumah', '', '', '2023-01-04 07:20:44', '2023-01-04 07:20:44', '', 0, 'http://localhost:82/wpbaru/?page_id=27', 0, 'page', '', 0);
INSERT INTO `wp_posts` VALUES (28, 1, '2023-01-04 07:20:44', '2023-01-04 07:20:44', '', 'Foto Amal Rumah', '', 'inherit', 'closed', 'closed', '', '27-revision-v1', '', '', '2023-01-04 07:20:44', '2023-01-04 07:20:44', '', 27, 'http://localhost:82/wpbaru/?p=28', 0, 'revision', '', 0);
INSERT INTO `wp_posts` VALUES (29, 1, '2023-01-05 14:26:36', '2023-01-04 07:21:38', ' ', '', '', 'publish', 'closed', 'closed', '', '29', '', '', '2023-01-05 14:26:36', '2023-01-05 07:26:36', '', 0, 'http://localhost:82/wpbaru/?p=29', 7, 'nav_menu_item', '', 0);
INSERT INTO `wp_posts` VALUES (30, 1, '2023-01-05 14:26:36', '2023-01-04 07:21:38', ' ', '', '', 'publish', 'closed', 'closed', '', '30', '', '', '2023-01-05 14:26:36', '2023-01-05 07:26:36', '', 0, 'http://localhost:82/wpbaru/?p=30', 8, 'nav_menu_item', '', 0);
INSERT INTO `wp_posts` VALUES (31, 1, '2023-01-05 14:26:36', '2023-01-04 07:21:38', ' ', '', '', 'publish', 'closed', 'closed', '', '31', '', '', '2023-01-05 14:26:36', '2023-01-05 07:26:36', '', 0, 'http://localhost:82/wpbaru/?p=31', 3, 'nav_menu_item', '', 0);
INSERT INTO `wp_posts` VALUES (32, 1, '2023-01-05 14:26:36', '2023-01-04 07:21:38', ' ', '', '', 'publish', 'closed', 'closed', '', '32', '', '', '2023-01-05 14:26:36', '2023-01-05 07:26:36', '', 0, 'http://localhost:82/wpbaru/?p=32', 6, 'nav_menu_item', '', 0);
INSERT INTO `wp_posts` VALUES (33, 1, '2023-01-05 14:26:36', '2023-01-04 07:21:38', ' ', '', '', 'publish', 'closed', 'closed', '', '33', '', '', '2023-01-05 14:26:36', '2023-01-05 07:26:36', '', 0, 'http://localhost:82/wpbaru/?p=33', 5, 'nav_menu_item', '', 0);
INSERT INTO `wp_posts` VALUES (34, 1, '2023-01-04 07:21:53', '2023-01-04 07:21:53', '', 'Hubungi Kami', '', 'publish', 'closed', 'closed', '', 'hubungi-kami', '', '', '2023-01-04 07:21:53', '2023-01-04 07:21:53', '', 0, 'http://localhost:82/wpbaru/?page_id=34', 0, 'page', '', 0);
INSERT INTO `wp_posts` VALUES (35, 1, '2023-01-04 07:21:53', '2023-01-04 07:21:53', '', 'Hubungi Kami', '', 'inherit', 'closed', 'closed', '', '34-revision-v1', '', '', '2023-01-04 07:21:53', '2023-01-04 07:21:53', '', 34, 'http://localhost:82/wpbaru/?p=35', 0, 'revision', '', 0);
INSERT INTO `wp_posts` VALUES (36, 1, '2023-01-05 14:26:36', '2023-01-04 07:22:06', ' ', '', '', 'publish', 'closed', 'closed', '', '36', '', '', '2023-01-05 14:26:36', '2023-01-05 07:26:36', '', 0, 'http://localhost:82/wpbaru/?p=36', 13, 'nav_menu_item', '', 0);
INSERT INTO `wp_posts` VALUES (37, 1, '2023-01-04 07:22:49', '2023-01-04 07:22:49', '', 'Testimonial', '', 'trash', 'open', 'open', '', 'testimonial__trashed', '', '', '2023-01-04 07:23:35', '2023-01-04 07:23:35', '', 0, 'http://localhost:82/wpbaru/?p=37', 0, 'post', '', 0);
INSERT INTO `wp_posts` VALUES (38, 1, '2023-01-04 07:22:49', '2023-01-04 07:22:49', '', 'Testimonial', '', 'inherit', 'closed', 'closed', '', '37-revision-v1', '', '', '2023-01-04 07:22:49', '2023-01-04 07:22:49', '', 37, 'http://localhost:82/wpbaru/?p=38', 0, 'revision', '', 0);
INSERT INTO `wp_posts` VALUES (39, 1, '2023-01-04 07:23:35', '2023-01-04 07:23:35', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2023-01-04 07:23:35', '2023-01-04 07:23:35', '', 1, 'http://localhost:82/wpbaru/?p=39', 0, 'revision', '', 0);
INSERT INTO `wp_posts` VALUES (40, 1, '2023-01-04 07:23:48', '2023-01-04 07:23:48', '', 'Testimonial', '', 'publish', 'closed', 'closed', '', 'testimonial', '', '', '2023-01-04 07:23:48', '2023-01-04 07:23:48', '', 0, 'http://localhost:82/wpbaru/?page_id=40', 0, 'page', '', 0);
INSERT INTO `wp_posts` VALUES (41, 1, '2023-01-04 07:23:48', '2023-01-04 07:23:48', '', 'Testimonial', '', 'inherit', 'closed', 'closed', '', '40-revision-v1', '', '', '2023-01-04 07:23:48', '2023-01-04 07:23:48', '', 40, 'http://localhost:82/wpbaru/?p=41', 0, 'revision', '', 0);
INSERT INTO `wp_posts` VALUES (42, 1, '2023-01-05 14:26:36', '2023-01-04 07:24:16', ' ', '', '', 'publish', 'closed', 'closed', '', '42', '', '', '2023-01-05 14:26:36', '2023-01-05 07:26:36', '', 0, 'http://localhost:82/wpbaru/?p=42', 9, 'nav_menu_item', '', 0);
INSERT INTO `wp_posts` VALUES (43, 1, '2023-01-04 07:27:45', '2023-01-04 07:27:45', '', 'logo2xx-1-e1549956915663 (1)', '', 'inherit', 'open', 'closed', '', 'logo2xx-1-e1549956915663-1', '', '', '2023-01-04 07:27:45', '2023-01-04 07:27:45', '', 0, 'http://localhost:82/wpbaru/wp-content/uploads/2023/01/logo2xx-1-e1549956915663-1.png', 0, 'attachment', 'image/png', 0);
INSERT INTO `wp_posts` VALUES (44, 1, '2023-01-04 07:27:55', '2023-01-04 07:27:55', 'http://localhost:82/wpbaru/wp-content/uploads/2023/01/cropped-logo2xx-1-e1549956915663-1.png', 'cropped-logo2xx-1-e1549956915663-1.png', '', 'inherit', 'open', 'closed', '', 'cropped-logo2xx-1-e1549956915663-1-png', '', '', '2023-01-04 07:27:55', '2023-01-04 07:27:55', '', 0, 'http://localhost:82/wpbaru/wp-content/uploads/2023/01/cropped-logo2xx-1-e1549956915663-1.png', 0, 'attachment', 'image/png', 0);
INSERT INTO `wp_posts` VALUES (45, 1, '2023-01-04 07:28:48', '2023-01-04 07:28:48', '{\n    \"agencyup::custom_logo\": {\n        \"value\": 44,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2023-01-04 07:28:08\"\n    },\n    \"blogname\": {\n        \"value\": \"\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2023-01-04 07:28:48\"\n    },\n    \"agencyup::agencyup_title_font_size\": {\n        \"value\": \"24\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2023-01-04 07:28:48\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'ffa98a84-ff81-4f22-8438-e3c6b24f47c9', '', '', '2023-01-04 07:28:48', '2023-01-04 07:28:48', '', 0, 'http://localhost:82/wpbaru/?p=45', 0, 'customize_changeset', '', 0);
INSERT INTO `wp_posts` VALUES (46, 1, '2023-01-05 14:15:35', '2023-01-05 07:15:35', '', 'Screen Shot 2023-01-05 at 2.15.16 PM', '', 'inherit', 'open', 'closed', '', 'screen-shot-2023-01-05-at-2-15-16-pm', '', '', '2023-01-05 14:15:35', '2023-01-05 07:15:35', '', 0, 'http://localhost:82/wpbaru/wp-content/uploads/2023/01/Screen-Shot-2023-01-05-at-2.15.16-PM.png', 0, 'attachment', 'image/png', 0);
INSERT INTO `wp_posts` VALUES (47, 1, '2023-01-05 14:23:57', '2023-01-05 07:23:57', '', 'Home', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2023-01-05 14:23:57', '2023-01-05 07:23:57', '', 8, 'http://localhost:82/wpbaru/?p=47', 0, 'revision', '', 0);
INSERT INTO `wp_posts` VALUES (48, 1, '2023-01-05 14:25:41', '2023-01-05 07:25:41', '', 'Schedule', '', 'publish', 'closed', 'closed', '', 'schedule', '', '', '2023-01-05 14:25:41', '2023-01-05 07:25:41', '', 0, 'http://localhost:82/wpbaru/?page_id=48', 0, 'page', '', 0);
INSERT INTO `wp_posts` VALUES (49, 1, '2023-01-05 14:25:41', '2023-01-05 07:25:41', '', 'Schedule', '', 'inherit', 'closed', 'closed', '', '48-revision-v1', '', '', '2023-01-05 14:25:41', '2023-01-05 07:25:41', '', 48, 'http://localhost:82/wpbaru/?p=49', 0, 'revision', '', 0);
INSERT INTO `wp_posts` VALUES (50, 1, '2023-01-05 14:26:00', '2023-01-05 07:26:00', '', 'Tracing', '', 'publish', 'closed', 'closed', '', 'tracing', '', '', '2023-01-05 14:26:00', '2023-01-05 07:26:00', '', 0, 'http://localhost:82/wpbaru/?page_id=50', 0, 'page', '', 0);
INSERT INTO `wp_posts` VALUES (51, 1, '2023-01-05 14:26:00', '2023-01-05 07:26:00', '', 'Tracing', '', 'inherit', 'closed', 'closed', '', '50-revision-v1', '', '', '2023-01-05 14:26:00', '2023-01-05 07:26:00', '', 50, 'http://localhost:82/wpbaru/?p=51', 0, 'revision', '', 0);
INSERT INTO `wp_posts` VALUES (52, 1, '2023-01-05 14:26:36', '2023-01-05 07:26:36', ' ', '', '', 'publish', 'closed', 'closed', '', '52', '', '', '2023-01-05 14:26:36', '2023-01-05 07:26:36', '', 0, 'http://localhost:82/wpbaru/?p=52', 11, 'nav_menu_item', '', 0);
INSERT INTO `wp_posts` VALUES (53, 1, '2023-01-05 14:26:36', '2023-01-05 07:26:36', ' ', '', '', 'publish', 'closed', 'closed', '', '53', '', '', '2023-01-05 14:26:36', '2023-01-05 07:26:36', '', 0, 'http://localhost:82/wpbaru/?p=53', 12, 'nav_menu_item', '', 0);
COMMIT;

-- ----------------------------
-- Table structure for wp_term_relationships
-- ----------------------------
DROP TABLE IF EXISTS `wp_term_relationships`;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of wp_term_relationships
-- ----------------------------
BEGIN;
INSERT INTO `wp_term_relationships` VALUES (1, 1, 0);
INSERT INTO `wp_term_relationships` VALUES (13, 2, 0);
INSERT INTO `wp_term_relationships` VALUES (14, 2, 0);
INSERT INTO `wp_term_relationships` VALUES (15, 2, 0);
INSERT INTO `wp_term_relationships` VALUES (18, 2, 0);
INSERT INTO `wp_term_relationships` VALUES (29, 2, 0);
INSERT INTO `wp_term_relationships` VALUES (30, 2, 0);
INSERT INTO `wp_term_relationships` VALUES (31, 2, 0);
INSERT INTO `wp_term_relationships` VALUES (32, 2, 0);
INSERT INTO `wp_term_relationships` VALUES (33, 2, 0);
INSERT INTO `wp_term_relationships` VALUES (36, 2, 0);
INSERT INTO `wp_term_relationships` VALUES (37, 1, 0);
INSERT INTO `wp_term_relationships` VALUES (42, 2, 0);
INSERT INTO `wp_term_relationships` VALUES (52, 2, 0);
INSERT INTO `wp_term_relationships` VALUES (53, 2, 0);
COMMIT;

-- ----------------------------
-- Table structure for wp_term_taxonomy
-- ----------------------------
DROP TABLE IF EXISTS `wp_term_taxonomy`;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of wp_term_taxonomy
-- ----------------------------
BEGIN;
INSERT INTO `wp_term_taxonomy` VALUES (1, 1, 'category', '', 0, 0);
INSERT INTO `wp_term_taxonomy` VALUES (2, 2, 'nav_menu', '', 0, 13);
INSERT INTO `wp_term_taxonomy` VALUES (4, 4, 'category', '', 0, 0);
INSERT INTO `wp_term_taxonomy` VALUES (5, 5, 'category', '', 0, 0);
INSERT INTO `wp_term_taxonomy` VALUES (6, 6, 'category', '', 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for wp_termmeta
-- ----------------------------
DROP TABLE IF EXISTS `wp_termmeta`;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of wp_termmeta
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wp_terms
-- ----------------------------
DROP TABLE IF EXISTS `wp_terms`;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of wp_terms
-- ----------------------------
BEGIN;
INSERT INTO `wp_terms` VALUES (1, 'Uncategorized', 'uncategorized', 0);
INSERT INTO `wp_terms` VALUES (2, 'Menu 1', 'menu-1', 0);
INSERT INTO `wp_terms` VALUES (4, 'Artikel', 'artikel', 0);
INSERT INTO `wp_terms` VALUES (5, 'Sejarah', 'sejarah', 0);
INSERT INTO `wp_terms` VALUES (6, 'Amal', 'amal', 0);
COMMIT;

-- ----------------------------
-- Table structure for wp_usermeta
-- ----------------------------
DROP TABLE IF EXISTS `wp_usermeta`;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of wp_usermeta
-- ----------------------------
BEGIN;
INSERT INTO `wp_usermeta` VALUES (1, 1, 'nickname', 'admin');
INSERT INTO `wp_usermeta` VALUES (2, 1, 'first_name', '');
INSERT INTO `wp_usermeta` VALUES (3, 1, 'last_name', '');
INSERT INTO `wp_usermeta` VALUES (4, 1, 'description', '');
INSERT INTO `wp_usermeta` VALUES (5, 1, 'rich_editing', 'true');
INSERT INTO `wp_usermeta` VALUES (6, 1, 'syntax_highlighting', 'true');
INSERT INTO `wp_usermeta` VALUES (7, 1, 'comment_shortcuts', 'false');
INSERT INTO `wp_usermeta` VALUES (8, 1, 'admin_color', 'fresh');
INSERT INTO `wp_usermeta` VALUES (9, 1, 'use_ssl', '0');
INSERT INTO `wp_usermeta` VALUES (10, 1, 'show_admin_bar_front', 'true');
INSERT INTO `wp_usermeta` VALUES (11, 1, 'locale', '');
INSERT INTO `wp_usermeta` VALUES (12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}');
INSERT INTO `wp_usermeta` VALUES (13, 1, 'wp_user_level', '10');
INSERT INTO `wp_usermeta` VALUES (14, 1, 'dismissed_wp_pointers', '');
INSERT INTO `wp_usermeta` VALUES (15, 1, 'show_welcome_panel', '1');
INSERT INTO `wp_usermeta` VALUES (16, 1, 'session_tokens', 'a:1:{s:64:\"7bf25cbbbaf1745c15f99c7c934fa23eacd14a57ce7b059705516d41a0c13787\";a:4:{s:10:\"expiration\";i:1672987608;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36\";s:5:\"login\";i:1672814808;}}');
INSERT INTO `wp_usermeta` VALUES (17, 1, 'wp_dashboard_quick_press_last_post_id', '4');
INSERT INTO `wp_usermeta` VALUES (18, 1, 'wp_user-settings', 'libraryContent=browse');
INSERT INTO `wp_usermeta` VALUES (19, 1, 'wp_user-settings-time', '1672815860');
INSERT INTO `wp_usermeta` VALUES (20, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}');
INSERT INTO `wp_usermeta` VALUES (21, 1, 'metaboxhidden_nav-menus', 'a:1:{i:0;s:12:\"add-post_tag\";}');
INSERT INTO `wp_usermeta` VALUES (22, 1, 'nav_menu_recently_edited', '2');
INSERT INTO `wp_usermeta` VALUES (23, 1, 'wp_persisted_preferences', 'a:2:{s:14:\"core/edit-post\";a:2:{s:26:\"isComplementaryAreaVisible\";b:0;s:12:\"welcomeGuide\";b:0;}s:9:\"_modified\";s:24:\"2023-01-04T07:18:01.895Z\";}');
INSERT INTO `wp_usermeta` VALUES (24, 1, '_aioseo_settings', 'a:6:{s:14:\"showUpgradeBar\";b:0;s:15:\"showSetupWizard\";b:1;s:12:\"toggledCards\";a:80:{s:17:\"dashboardOverview\";b:1;s:17:\"dashboardSeoSetup\";b:1;s:21:\"dashboardSeoSiteScore\";b:1;s:22:\"dashboardNotifications\";b:1;s:16:\"dashboardSupport\";b:1;s:7:\"license\";b:1;s:14:\"webmasterTools\";b:1;s:17:\"enableBreadcrumbs\";b:1;s:18:\"breadcrumbSettings\";b:1;s:19:\"breadcrumbTemplates\";b:1;s:8:\"advanced\";b:1;s:13:\"accessControl\";b:1;s:10:\"rssContent\";b:1;s:14:\"generalSitemap\";b:1;s:22:\"generalSitemapSettings\";b:1;s:12:\"imageSitemap\";b:1;s:12:\"videoSitemap\";b:1;s:11:\"newsSitemap\";b:1;s:10:\"rssSitemap\";b:1;s:18:\"rssSitemapSettings\";b:1;s:18:\"rssAdditionalPages\";b:1;s:19:\"rssAdvancedSettings\";b:1;s:15:\"additionalPages\";b:1;s:16:\"advancedSettings\";b:1;s:20:\"videoSitemapSettings\";b:1;s:20:\"videoAdditionalPages\";b:1;s:21:\"videoAdvancedSettings\";b:1;s:18:\"videoEmbedSettings\";b:1;s:19:\"newsSitemapSettings\";b:1;s:19:\"newsAdditionalPages\";b:1;s:20:\"newsAdvancedSettings\";b:1;s:17:\"newsEmbedSettings\";b:1;s:14:\"socialProfiles\";b:1;s:8:\"facebook\";b:1;s:24:\"facebookHomePageSettings\";b:1;s:24:\"facebookAdvancedSettings\";b:1;s:7:\"twitter\";b:1;s:23:\"twitterHomePageSettings\";b:1;s:9:\"pinterest\";b:1;s:20:\"searchTitleSeparator\";b:1;s:14:\"searchHomePage\";b:1;s:12:\"searchSchema\";b:1;s:22:\"searchMediaAttachments\";b:1;s:14:\"searchAdvanced\";b:1;s:26:\"searchAdvancedCrawlCleanup\";b:1;s:14:\"authorArchives\";b:1;s:12:\"dateArchives\";b:1;s:14:\"searchArchives\";b:1;s:8:\"imageSeo\";b:1;s:20:\"completeSeoChecklist\";b:1;s:17:\"localBusinessInfo\";b:1;s:25:\"localBusinessOpeningHours\";b:1;s:17:\"locationsSettings\";b:1;s:25:\"advancedLocationsSettings\";b:1;s:23:\"localBusinessMapsApiKey\";b:1;s:25:\"localBusinessMapsSettings\";b:1;s:12:\"robotsEditor\";b:1;s:13:\"badBotBlocker\";b:1;s:13:\"databaseTools\";b:1;s:14:\"htaccessEditor\";b:1;s:17:\"databaseToolsLogs\";b:1;s:16:\"systemStatusInfo\";b:1;s:17:\"addNewRedirection\";b:1;s:16:\"redirectSettings\";b:1;s:5:\"debug\";b:1;s:25:\"fullSiteRedirectsRelocate\";b:1;s:24:\"fullSiteRedirectsAliases\";b:1;s:26:\"fullSiteRedirectsCanonical\";b:1;s:28:\"fullSiteRedirectsHttpHeaders\";b:1;s:11:\"htmlSitemap\";b:1;s:19:\"htmlSitemapSettings\";b:1;s:27:\"htmlSitemapAdvancedSettings\";b:1;s:21:\"linkAssistantSettings\";b:1;s:17:\"domainActivations\";b:1;s:11:\"404Settings\";b:1;s:6:\"postSA\";b:1;s:6:\"pageSA\";b:1;s:12:\"attachmentSA\";b:1;s:10:\"categorySA\";b:1;s:10:\"post_tagSA\";b:1;}s:12:\"toggledRadio\";a:5:{s:22:\"locationsShowOnWebsite\";s:6:\"widget\";s:24:\"breadcrumbsShowOnWebsite\";s:9:\"shortcode\";s:29:\"breadcrumbsShowMoreSeparators\";b:0;s:24:\"searchShowMoreSeparators\";b:0;s:16:\"overviewPostType\";s:4:\"post\";}s:12:\"internalTabs\";a:9:{s:14:\"authorArchives\";s:17:\"title-description\";s:12:\"dateArchives\";s:17:\"title-description\";s:14:\"searchArchives\";s:17:\"title-description\";s:17:\"seoAuditChecklist\";s:9:\"all-items\";s:6:\"postSA\";s:17:\"title-description\";s:6:\"pageSA\";s:17:\"title-description\";s:12:\"attachmentSA\";s:17:\"title-description\";s:10:\"categorySA\";s:17:\"title-description\";s:10:\"post_tagSA\";s:17:\"title-description\";}s:15:\"tablePagination\";a:8:{s:14:\"networkDomains\";i:20;s:9:\"redirects\";i:20;s:12:\"redirectLogs\";i:20;s:15:\"redirect404Logs\";i:20;s:22:\"sitemapAdditionalPages\";i:20;s:24:\"linkAssistantLinksReport\";i:20;s:24:\"linkAssistantPostsReport\";i:20;s:26:\"linkAssistantDomainsReport\";i:20;}}');
COMMIT;

-- ----------------------------
-- Table structure for wp_users
-- ----------------------------
DROP TABLE IF EXISTS `wp_users`;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of wp_users
-- ----------------------------
BEGIN;
INSERT INTO `wp_users` VALUES (1, 'admin', '$P$BkuJCDZkliLTldebgpDAj1ZY15p8rJ1', 'admin', 'andramarkov@gmail.com', 'http://localhost:82/wpbaru', '2022-12-30 02:20:22', '', 0, 'admin');
COMMIT;

-- ----------------------------
-- Table structure for wp_wsm_browsers
-- ----------------------------
DROP TABLE IF EXISTS `wp_wsm_browsers`;
CREATE TABLE `wp_wsm_browsers` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_wsm_browsers
-- ----------------------------
BEGIN;
INSERT INTO `wp_wsm_browsers` VALUES (1, 'Mozilla Firefox');
INSERT INTO `wp_wsm_browsers` VALUES (2, 'Google Chrome');
INSERT INTO `wp_wsm_browsers` VALUES (3, 'Opera');
INSERT INTO `wp_wsm_browsers` VALUES (4, 'Safari');
INSERT INTO `wp_wsm_browsers` VALUES (5, 'Internet Explorer');
INSERT INTO `wp_wsm_browsers` VALUES (6, 'Micorsoft Edge');
INSERT INTO `wp_wsm_browsers` VALUES (7, 'Torch');
INSERT INTO `wp_wsm_browsers` VALUES (8, 'Maxthon');
INSERT INTO `wp_wsm_browsers` VALUES (9, 'SeaMonkey');
INSERT INTO `wp_wsm_browsers` VALUES (10, 'Avant Browser');
INSERT INTO `wp_wsm_browsers` VALUES (11, 'Deepnet Explorer');
INSERT INTO `wp_wsm_browsers` VALUES (12, 'UE Browser');
COMMIT;

-- ----------------------------
-- Table structure for wp_wsm_countries
-- ----------------------------
DROP TABLE IF EXISTS `wp_wsm_countries`;
CREATE TABLE `wp_wsm_countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `alpha2Code` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `alpha3Code` varchar(3) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `numericCode` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_wsm_countries
-- ----------------------------
BEGIN;
INSERT INTO `wp_wsm_countries` VALUES (1, 'Afghanistan', 'AF', 'AFG', 4);
INSERT INTO `wp_wsm_countries` VALUES (2, '&Aring;land Islands', 'AX', 'ALA', 248);
INSERT INTO `wp_wsm_countries` VALUES (3, 'Albania', 'AL', 'ALB', 8);
INSERT INTO `wp_wsm_countries` VALUES (4, 'Algeria', 'DZ', 'DZA', 12);
INSERT INTO `wp_wsm_countries` VALUES (5, 'American Samoa', 'AS', 'ASM', 16);
INSERT INTO `wp_wsm_countries` VALUES (6, 'Andorra', 'AD', 'AND', 20);
INSERT INTO `wp_wsm_countries` VALUES (7, 'Angola', 'AO', 'AGO', 24);
INSERT INTO `wp_wsm_countries` VALUES (8, 'Anguilla', 'AI', 'AIA', 660);
INSERT INTO `wp_wsm_countries` VALUES (9, 'Antarctica', 'AQ', 'ATA', 10);
INSERT INTO `wp_wsm_countries` VALUES (10, 'Antigua and Barbuda', 'AG', 'ATG', 28);
INSERT INTO `wp_wsm_countries` VALUES (11, 'Argentina', 'AR', 'ARG', 32);
INSERT INTO `wp_wsm_countries` VALUES (12, 'Armenia', 'AM', 'ARM', 51);
INSERT INTO `wp_wsm_countries` VALUES (13, 'Aruba', 'AW', 'ABW', 533);
INSERT INTO `wp_wsm_countries` VALUES (14, 'Australia', 'AU', 'AUS', 36);
INSERT INTO `wp_wsm_countries` VALUES (15, 'Austria', 'AT', 'AUT', 40);
INSERT INTO `wp_wsm_countries` VALUES (16, 'Azerbaijan', 'AZ', 'AZE', 31);
INSERT INTO `wp_wsm_countries` VALUES (17, 'Bahamas', 'BS', 'BHS', 44);
INSERT INTO `wp_wsm_countries` VALUES (18, 'Bahrain', 'BH', 'BHR', 48);
INSERT INTO `wp_wsm_countries` VALUES (19, 'Bangladesh', 'BD', 'BGD', 50);
INSERT INTO `wp_wsm_countries` VALUES (20, 'Barbados', 'BB', 'BRB', 52);
INSERT INTO `wp_wsm_countries` VALUES (21, 'Belarus', 'BY', 'BLR', 112);
INSERT INTO `wp_wsm_countries` VALUES (22, 'Belgium', 'BE', 'BEL', 56);
INSERT INTO `wp_wsm_countries` VALUES (23, 'Belize', 'BZ', 'BLZ', 84);
INSERT INTO `wp_wsm_countries` VALUES (24, 'Benin', 'BJ', 'BEN', 204);
INSERT INTO `wp_wsm_countries` VALUES (25, 'Bermuda', 'BM', 'BMU', 60);
INSERT INTO `wp_wsm_countries` VALUES (26, 'Bhutan', 'BT', 'BTN', 64);
INSERT INTO `wp_wsm_countries` VALUES (27, 'Bolivia, Plurinational State of', 'BO', 'BOL', 68);
INSERT INTO `wp_wsm_countries` VALUES (28, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', 535);
INSERT INTO `wp_wsm_countries` VALUES (29, 'Bosnia and Herzegovina', 'BA', 'BIH', 70);
INSERT INTO `wp_wsm_countries` VALUES (30, 'Botswana', 'BW', 'BWA', 72);
INSERT INTO `wp_wsm_countries` VALUES (31, 'Bouvet Island', 'BV', 'BVT', 74);
INSERT INTO `wp_wsm_countries` VALUES (32, 'Brazil', 'BR', 'BRA', 76);
INSERT INTO `wp_wsm_countries` VALUES (33, 'British Indian Ocean Territory', 'IO', 'IOT', 86);
INSERT INTO `wp_wsm_countries` VALUES (34, 'Brunei Darussalam', 'BN', 'BRN', 96);
INSERT INTO `wp_wsm_countries` VALUES (35, 'Bulgaria', 'BG', 'BGR', 100);
INSERT INTO `wp_wsm_countries` VALUES (36, 'Burkina Faso', 'BF', 'BFA', 854);
INSERT INTO `wp_wsm_countries` VALUES (37, 'Burundi', 'BI', 'BDI', 108);
INSERT INTO `wp_wsm_countries` VALUES (38, 'Cambodia', 'KH', 'KHM', 116);
INSERT INTO `wp_wsm_countries` VALUES (39, 'Cameroon', 'CM', 'CMR', 120);
INSERT INTO `wp_wsm_countries` VALUES (40, 'Canada', 'CA', 'CAN', 124);
INSERT INTO `wp_wsm_countries` VALUES (41, 'Cape Verde', 'CV', 'CPV', 132);
INSERT INTO `wp_wsm_countries` VALUES (42, 'Cayman Islands', 'KY', 'CYM', 136);
INSERT INTO `wp_wsm_countries` VALUES (43, 'Central African Republic', 'CF', 'CAF', 140);
INSERT INTO `wp_wsm_countries` VALUES (44, 'Chad', 'TD', 'TCD', 148);
INSERT INTO `wp_wsm_countries` VALUES (45, 'Chile', 'CL', 'CHL', 152);
INSERT INTO `wp_wsm_countries` VALUES (46, 'China', 'CN', 'CHN', 156);
INSERT INTO `wp_wsm_countries` VALUES (47, 'Christmas Island', 'CX', 'CXR', 162);
INSERT INTO `wp_wsm_countries` VALUES (48, 'Cocos (Keeling) Islands', 'CC', 'CCK', 166);
INSERT INTO `wp_wsm_countries` VALUES (49, 'Colombia', 'CO', 'COL', 170);
INSERT INTO `wp_wsm_countries` VALUES (50, 'Comoros', 'KM', 'COM', 174);
INSERT INTO `wp_wsm_countries` VALUES (51, 'Congo', 'CG', 'COG', 178);
INSERT INTO `wp_wsm_countries` VALUES (52, 'Congo, the Democratic Republic of the', 'CD', 'COD', 180);
INSERT INTO `wp_wsm_countries` VALUES (53, 'Cook Islands', 'CK', 'COK', 184);
INSERT INTO `wp_wsm_countries` VALUES (54, 'Costa Rica', 'CR', 'CRI', 188);
INSERT INTO `wp_wsm_countries` VALUES (55, 'C&ocirc;te d\'\'Ivoire', 'CI', 'CIV', 384);
INSERT INTO `wp_wsm_countries` VALUES (56, 'Croatia', 'HR', 'HRV', 191);
INSERT INTO `wp_wsm_countries` VALUES (57, 'Cuba', 'CU', 'CUB', 192);
INSERT INTO `wp_wsm_countries` VALUES (58, 'Cura', 'CW', 'CUW', 531);
INSERT INTO `wp_wsm_countries` VALUES (59, 'Cyprus', 'CY', 'CYP', 196);
INSERT INTO `wp_wsm_countries` VALUES (60, 'Czech Republic', 'CZ', 'CZE', 203);
INSERT INTO `wp_wsm_countries` VALUES (61, 'Denmark', 'DK', 'DNK', 208);
INSERT INTO `wp_wsm_countries` VALUES (62, 'Djibouti', 'DJ', 'DJI', 262);
INSERT INTO `wp_wsm_countries` VALUES (63, 'Dominica', 'DM', 'DMA', 212);
INSERT INTO `wp_wsm_countries` VALUES (64, 'Dominican Republic', 'DO', 'DOM', 214);
INSERT INTO `wp_wsm_countries` VALUES (65, 'Ecuador', 'EC', 'ECU', 218);
INSERT INTO `wp_wsm_countries` VALUES (66, 'Egypt', 'EG', 'EGY', 818);
INSERT INTO `wp_wsm_countries` VALUES (67, 'El Salvador', 'SV', 'SLV', 222);
INSERT INTO `wp_wsm_countries` VALUES (68, 'Equatorial Guinea', 'GQ', 'GNQ', 226);
INSERT INTO `wp_wsm_countries` VALUES (69, 'Eritrea', 'ER', 'ERI', 232);
INSERT INTO `wp_wsm_countries` VALUES (70, 'Estonia', 'EE', 'EST', 233);
INSERT INTO `wp_wsm_countries` VALUES (71, 'Ethiopia', 'ET', 'ETH', 231);
INSERT INTO `wp_wsm_countries` VALUES (72, 'Falkland Islands (Malvinas)', 'FK', 'FLK', 238);
INSERT INTO `wp_wsm_countries` VALUES (73, 'Faroe Islands', 'FO', 'FRO', 234);
INSERT INTO `wp_wsm_countries` VALUES (74, 'Fiji', 'FJ', 'FJI', 242);
INSERT INTO `wp_wsm_countries` VALUES (75, 'Finland', 'FI', 'FIN', 246);
INSERT INTO `wp_wsm_countries` VALUES (76, 'France', 'FR', 'FRA', 250);
INSERT INTO `wp_wsm_countries` VALUES (77, 'French Guiana', 'GF', 'GUF', 254);
INSERT INTO `wp_wsm_countries` VALUES (78, 'French Polynesia', 'PF', 'PYF', 258);
INSERT INTO `wp_wsm_countries` VALUES (79, 'French Southern Territories', 'TF', 'ATF', 260);
INSERT INTO `wp_wsm_countries` VALUES (80, 'Gabon', 'GA', 'GAB', 266);
INSERT INTO `wp_wsm_countries` VALUES (81, 'Gambia', 'GM', 'GMB', 270);
INSERT INTO `wp_wsm_countries` VALUES (82, 'Georgia', 'GE', 'GEO', 268);
INSERT INTO `wp_wsm_countries` VALUES (83, 'Germany', 'DE', 'DEU', 276);
INSERT INTO `wp_wsm_countries` VALUES (84, 'Ghana', 'GH', 'GHA', 288);
INSERT INTO `wp_wsm_countries` VALUES (85, 'Gibraltar', 'GI', 'GIB', 292);
INSERT INTO `wp_wsm_countries` VALUES (86, 'Greece', 'GR', 'GRC', 300);
INSERT INTO `wp_wsm_countries` VALUES (87, 'Greenland', 'GL', 'GRL', 304);
INSERT INTO `wp_wsm_countries` VALUES (88, 'Grenada', 'GD', 'GRD', 308);
INSERT INTO `wp_wsm_countries` VALUES (89, 'Guadeloupe', 'GP', 'GLP', 312);
INSERT INTO `wp_wsm_countries` VALUES (90, 'Guam', 'GU', 'GUM', 316);
INSERT INTO `wp_wsm_countries` VALUES (91, 'Guatemala', 'GT', 'GTM', 320);
INSERT INTO `wp_wsm_countries` VALUES (92, 'Guernsey', 'GG', 'GGY', 831);
INSERT INTO `wp_wsm_countries` VALUES (93, 'Guinea', 'GN', 'GIN', 324);
INSERT INTO `wp_wsm_countries` VALUES (94, 'Guinea-Bissau', 'GW', 'GNB', 624);
INSERT INTO `wp_wsm_countries` VALUES (95, 'Guyana', 'GY', 'GUY', 328);
INSERT INTO `wp_wsm_countries` VALUES (96, 'Haiti', 'HT', 'HTI', 332);
INSERT INTO `wp_wsm_countries` VALUES (97, 'Heard Island and McDonald Islands', 'HM', 'HMD', 334);
INSERT INTO `wp_wsm_countries` VALUES (98, 'Holy See (Vatican City State)', 'VA', 'VAT', 336);
INSERT INTO `wp_wsm_countries` VALUES (99, 'Honduras', 'HN', 'HND', 340);
INSERT INTO `wp_wsm_countries` VALUES (100, 'Hong Kong', 'HK', 'HKG', 344);
INSERT INTO `wp_wsm_countries` VALUES (101, 'Hungary', 'HU', 'HUN', 348);
INSERT INTO `wp_wsm_countries` VALUES (102, 'Iceland', 'IS', 'ISL', 352);
INSERT INTO `wp_wsm_countries` VALUES (103, 'India', 'IN', 'IND', 356);
INSERT INTO `wp_wsm_countries` VALUES (104, 'Indonesia', 'ID', 'IDN', 360);
INSERT INTO `wp_wsm_countries` VALUES (105, 'Iran, Islamic Republic of', 'IR', 'IRN', 364);
INSERT INTO `wp_wsm_countries` VALUES (106, 'Iraq', 'IQ', 'IRQ', 368);
INSERT INTO `wp_wsm_countries` VALUES (107, 'Ireland', 'IE', 'IRL', 372);
INSERT INTO `wp_wsm_countries` VALUES (108, 'Isle of Man', 'IM', 'IMN', 833);
INSERT INTO `wp_wsm_countries` VALUES (109, 'Israel', 'IL', 'ISR', 376);
INSERT INTO `wp_wsm_countries` VALUES (110, 'Italy', 'IT', 'ITA', 380);
INSERT INTO `wp_wsm_countries` VALUES (111, 'Jamaica', 'JM', 'JAM', 388);
INSERT INTO `wp_wsm_countries` VALUES (112, 'Japan', 'JP', 'JPN', 392);
INSERT INTO `wp_wsm_countries` VALUES (113, 'Jersey', 'JE', 'JEY', 832);
INSERT INTO `wp_wsm_countries` VALUES (114, 'Jordan', 'JO', 'JOR', 400);
INSERT INTO `wp_wsm_countries` VALUES (115, 'Kazakhstan', 'KZ', 'KAZ', 398);
INSERT INTO `wp_wsm_countries` VALUES (116, 'Kenya', 'KE', 'KEN', 404);
INSERT INTO `wp_wsm_countries` VALUES (117, 'Kiribati', 'KI', 'KIR', 296);
INSERT INTO `wp_wsm_countries` VALUES (118, 'Korea, Democratic People\'s Republic of', 'KP', 'PRK', 408);
INSERT INTO `wp_wsm_countries` VALUES (119, 'Korea, Republic of', 'KR', 'KOR', 410);
INSERT INTO `wp_wsm_countries` VALUES (120, 'Kuwait', 'KW', 'KWT', 414);
INSERT INTO `wp_wsm_countries` VALUES (121, 'Kyrgyzstan', 'KG', 'KGZ', 417);
INSERT INTO `wp_wsm_countries` VALUES (122, 'Lao People\'s Democratic Republic', 'LA', 'LAO', 418);
INSERT INTO `wp_wsm_countries` VALUES (123, 'Latvia', 'LV', 'LVA', 428);
INSERT INTO `wp_wsm_countries` VALUES (124, 'Lebanon', 'LB', 'LBN', 422);
INSERT INTO `wp_wsm_countries` VALUES (125, 'Lesotho', 'LS', 'LSO', 426);
INSERT INTO `wp_wsm_countries` VALUES (126, 'Liberia', 'LR', 'LBR', 430);
INSERT INTO `wp_wsm_countries` VALUES (127, 'Libya', 'LY', 'LBY', 434);
INSERT INTO `wp_wsm_countries` VALUES (128, 'Liechtenstein', 'LI', 'LIE', 438);
INSERT INTO `wp_wsm_countries` VALUES (129, 'Lithuania', 'LT', 'LTU', 440);
INSERT INTO `wp_wsm_countries` VALUES (130, 'Luxembourg', 'LU', 'LUX', 442);
INSERT INTO `wp_wsm_countries` VALUES (131, 'Macao', 'MO', 'MAC', 446);
INSERT INTO `wp_wsm_countries` VALUES (132, 'Macedonia, the former Yugoslav Republic of', 'MK', 'MKD', 807);
INSERT INTO `wp_wsm_countries` VALUES (133, 'Madagascar', 'MG', 'MDG', 450);
INSERT INTO `wp_wsm_countries` VALUES (134, 'Malawi', 'MW', 'MWI', 454);
INSERT INTO `wp_wsm_countries` VALUES (135, 'Malaysia', 'MY', 'MYS', 458);
INSERT INTO `wp_wsm_countries` VALUES (136, 'Maldives', 'MV', 'MDV', 462);
INSERT INTO `wp_wsm_countries` VALUES (137, 'Mali', 'ML', 'MLI', 466);
INSERT INTO `wp_wsm_countries` VALUES (138, 'Malta', 'MT', 'MLT', 470);
INSERT INTO `wp_wsm_countries` VALUES (139, 'Marshall Islands', 'MH', 'MHL', 584);
INSERT INTO `wp_wsm_countries` VALUES (140, 'Martinique', 'MQ', 'MTQ', 474);
INSERT INTO `wp_wsm_countries` VALUES (141, 'Mauritania', 'MR', 'MRT', 478);
INSERT INTO `wp_wsm_countries` VALUES (142, 'Mauritius', 'MU', 'MUS', 480);
INSERT INTO `wp_wsm_countries` VALUES (143, 'Mayotte', 'YT', 'MYT', 175);
INSERT INTO `wp_wsm_countries` VALUES (144, 'Mexico', 'MX', 'MEX', 484);
INSERT INTO `wp_wsm_countries` VALUES (145, 'Micronesia, Federated States of', 'FM', 'FSM', 583);
INSERT INTO `wp_wsm_countries` VALUES (146, 'Moldova, Republic of', 'MD', 'MDA', 498);
INSERT INTO `wp_wsm_countries` VALUES (147, 'Monaco', 'MC', 'MCO', 492);
INSERT INTO `wp_wsm_countries` VALUES (148, 'Mongolia', 'MN', 'MNG', 496);
INSERT INTO `wp_wsm_countries` VALUES (149, 'Montenegro', 'ME', 'MNE', 499);
INSERT INTO `wp_wsm_countries` VALUES (150, 'Montserrat', 'MS', 'MSR', 500);
INSERT INTO `wp_wsm_countries` VALUES (151, 'Morocco', 'MA', 'MAR', 504);
INSERT INTO `wp_wsm_countries` VALUES (152, 'Mozambique', 'MZ', 'MOZ', 508);
INSERT INTO `wp_wsm_countries` VALUES (153, 'Myanmar', 'MM', 'MMR', 104);
INSERT INTO `wp_wsm_countries` VALUES (154, 'Namibia', 'NA', 'NAM', 516);
INSERT INTO `wp_wsm_countries` VALUES (155, 'Nauru', 'NR', 'NRU', 520);
INSERT INTO `wp_wsm_countries` VALUES (156, 'Nepal', 'NP', 'NPL', 524);
INSERT INTO `wp_wsm_countries` VALUES (157, 'Netherlands', 'NL', 'NLD', 528);
INSERT INTO `wp_wsm_countries` VALUES (158, 'New Caledonia', 'NC', 'NCL', 540);
INSERT INTO `wp_wsm_countries` VALUES (159, 'New Zealand', 'NZ', 'NZL', 554);
INSERT INTO `wp_wsm_countries` VALUES (160, 'Nicaragua', 'NI', 'NIC', 558);
INSERT INTO `wp_wsm_countries` VALUES (161, 'Niger', 'NE', 'NER', 562);
INSERT INTO `wp_wsm_countries` VALUES (162, 'Nigeria', 'NG', 'NGA', 566);
INSERT INTO `wp_wsm_countries` VALUES (163, 'Niue', 'NU', 'NIU', 570);
INSERT INTO `wp_wsm_countries` VALUES (164, 'Norfolk Island', 'NF', 'NFK', 574);
INSERT INTO `wp_wsm_countries` VALUES (165, 'Northern Mariana Islands', 'MP', 'MNP', 580);
INSERT INTO `wp_wsm_countries` VALUES (166, 'Norway', 'NO', 'NOR', 578);
INSERT INTO `wp_wsm_countries` VALUES (167, 'Oman', 'OM', 'OMN', 512);
INSERT INTO `wp_wsm_countries` VALUES (168, 'Pakistan', 'PK', 'PAK', 586);
INSERT INTO `wp_wsm_countries` VALUES (169, 'Palau', 'PW', 'PLW', 585);
INSERT INTO `wp_wsm_countries` VALUES (170, 'Palestine, State of', 'PS', 'PSE', 275);
INSERT INTO `wp_wsm_countries` VALUES (171, 'Panama', 'PA', 'PAN', 591);
INSERT INTO `wp_wsm_countries` VALUES (172, 'Papua New Guinea', 'PG', 'PNG', 598);
INSERT INTO `wp_wsm_countries` VALUES (173, 'Paraguay', 'PY', 'PRY', 600);
INSERT INTO `wp_wsm_countries` VALUES (174, 'Peru', 'PE', 'PER', 604);
INSERT INTO `wp_wsm_countries` VALUES (175, 'Philippines', 'PH', 'PHL', 608);
INSERT INTO `wp_wsm_countries` VALUES (176, 'Pitcairn', 'PN', 'PCN', 612);
INSERT INTO `wp_wsm_countries` VALUES (177, 'Poland', 'PL', 'POL', 616);
INSERT INTO `wp_wsm_countries` VALUES (178, 'Portugal', 'PT', 'PRT', 620);
INSERT INTO `wp_wsm_countries` VALUES (179, 'Puerto Rico', 'PR', 'PRI', 630);
INSERT INTO `wp_wsm_countries` VALUES (180, 'Qatar', 'QA', 'QAT', 634);
INSERT INTO `wp_wsm_countries` VALUES (181, 'R&eacute;union', 'RE', 'REU', 638);
INSERT INTO `wp_wsm_countries` VALUES (182, 'Romania', 'RO', 'ROU', 642);
INSERT INTO `wp_wsm_countries` VALUES (183, 'Russian Federation', 'RU', 'RUS', 643);
INSERT INTO `wp_wsm_countries` VALUES (184, 'Rwanda', 'RW', 'RWA', 646);
INSERT INTO `wp_wsm_countries` VALUES (185, 'Saint Barth&eacute;lemy', 'BL', 'BLM', 652);
INSERT INTO `wp_wsm_countries` VALUES (186, 'Saint Helena, Ascension and Tristan da Cunha', 'SH', 'SHN', 654);
INSERT INTO `wp_wsm_countries` VALUES (187, 'Saint Kitts and Nevis', 'KN', 'KNA', 659);
INSERT INTO `wp_wsm_countries` VALUES (188, 'Saint Lucia', 'LC', 'LCA', 662);
INSERT INTO `wp_wsm_countries` VALUES (189, 'Saint Martin (French part)', 'MF', 'MAF', 663);
INSERT INTO `wp_wsm_countries` VALUES (190, 'Saint Pierre and Miquelon', 'PM', 'SPM', 666);
INSERT INTO `wp_wsm_countries` VALUES (191, 'Saint Vincent and the Grenadines', 'VC', 'VCT', 670);
INSERT INTO `wp_wsm_countries` VALUES (192, 'Samoa', 'WS', 'WSM', 882);
INSERT INTO `wp_wsm_countries` VALUES (193, 'San Marino', 'SM', 'SMR', 674);
INSERT INTO `wp_wsm_countries` VALUES (194, 'Sao Tome and Principe', 'ST', 'STP', 678);
INSERT INTO `wp_wsm_countries` VALUES (195, 'Saudi Arabia', 'SA', 'SAU', 682);
INSERT INTO `wp_wsm_countries` VALUES (196, 'Senegal', 'SN', 'SEN', 686);
INSERT INTO `wp_wsm_countries` VALUES (197, 'Serbia', 'RS', 'SRB', 688);
INSERT INTO `wp_wsm_countries` VALUES (198, 'Seychelles', 'SC', 'SYC', 690);
INSERT INTO `wp_wsm_countries` VALUES (199, 'Sierra Leone', 'SL', 'SLE', 694);
INSERT INTO `wp_wsm_countries` VALUES (200, 'Singapore', 'SG', 'SGP', 702);
INSERT INTO `wp_wsm_countries` VALUES (201, 'Sint Maarten (Dutch part)', 'SX', 'SXM', 534);
INSERT INTO `wp_wsm_countries` VALUES (202, 'Slovakia', 'SK', 'SVK', 703);
INSERT INTO `wp_wsm_countries` VALUES (203, 'Slovenia', 'SI', 'SVN', 705);
INSERT INTO `wp_wsm_countries` VALUES (204, 'Solomon Islands', 'SB', 'SLB', 90);
INSERT INTO `wp_wsm_countries` VALUES (205, 'Somalia', 'SO', 'SOM', 706);
INSERT INTO `wp_wsm_countries` VALUES (206, 'South Africa', 'ZA', 'ZAF', 710);
INSERT INTO `wp_wsm_countries` VALUES (207, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', 239);
INSERT INTO `wp_wsm_countries` VALUES (208, 'South Sudan', 'SS', 'SSD', 728);
INSERT INTO `wp_wsm_countries` VALUES (209, 'Spain', 'ES', 'ESP', 724);
INSERT INTO `wp_wsm_countries` VALUES (210, 'Sri Lanka', 'LK', 'LKA', 144);
INSERT INTO `wp_wsm_countries` VALUES (211, 'Sudan', 'SD', 'SDN', 729);
INSERT INTO `wp_wsm_countries` VALUES (212, 'Suriname', 'SR', 'SUR', 740);
INSERT INTO `wp_wsm_countries` VALUES (213, 'Svalbard and Jan Mayen', 'SJ', 'SJM', 744);
INSERT INTO `wp_wsm_countries` VALUES (214, 'Swaziland', 'SZ', 'SWZ', 748);
INSERT INTO `wp_wsm_countries` VALUES (215, 'Sweden', 'SE', 'SWE', 752);
INSERT INTO `wp_wsm_countries` VALUES (216, 'Switzerland', 'CH', 'CHE', 756);
INSERT INTO `wp_wsm_countries` VALUES (217, 'Syrian Arab Republic', 'SY', 'SYR', 760);
INSERT INTO `wp_wsm_countries` VALUES (218, 'Taiwan, Province of China', 'TW', 'TWN', 158);
INSERT INTO `wp_wsm_countries` VALUES (219, 'Tajikistan', 'TJ', 'TJK', 762);
INSERT INTO `wp_wsm_countries` VALUES (220, 'Tanzania, United Republic of', 'TZ', 'TZA', 834);
INSERT INTO `wp_wsm_countries` VALUES (221, 'Thailand', 'TH', 'THA', 764);
INSERT INTO `wp_wsm_countries` VALUES (222, 'Timor-Leste', 'TL', 'TLS', 626);
INSERT INTO `wp_wsm_countries` VALUES (223, 'Togo', 'TG', 'TGO', 768);
INSERT INTO `wp_wsm_countries` VALUES (224, 'Tokelau', 'TK', 'TKL', 772);
INSERT INTO `wp_wsm_countries` VALUES (225, 'Tonga', 'TO', 'TON', 776);
INSERT INTO `wp_wsm_countries` VALUES (226, 'Trinidad and Tobago', 'TT', 'TTO', 780);
INSERT INTO `wp_wsm_countries` VALUES (227, 'Tunisia', 'TN', 'TUN', 788);
INSERT INTO `wp_wsm_countries` VALUES (228, 'Turkey', 'TR', 'TUR', 792);
INSERT INTO `wp_wsm_countries` VALUES (229, 'Turkmenistan', 'TM', 'TKM', 795);
INSERT INTO `wp_wsm_countries` VALUES (230, 'Turks and Caicos Islands', 'TC', 'TCA', 796);
INSERT INTO `wp_wsm_countries` VALUES (231, 'Tuvalu', 'TV', 'TUV', 798);
INSERT INTO `wp_wsm_countries` VALUES (232, 'Uganda', 'UG', 'UGA', 800);
INSERT INTO `wp_wsm_countries` VALUES (233, 'Ukraine', 'UA', 'UKR', 804);
INSERT INTO `wp_wsm_countries` VALUES (234, 'United Arab Emirates', 'AE', 'ARE', 784);
INSERT INTO `wp_wsm_countries` VALUES (235, 'United Kingdom', 'GB', 'GBR', 826);
INSERT INTO `wp_wsm_countries` VALUES (236, 'United States', 'US', 'USA', 840);
INSERT INTO `wp_wsm_countries` VALUES (237, 'United States Minor Outlying Islands', 'UM', 'UMI', 581);
INSERT INTO `wp_wsm_countries` VALUES (238, 'Uruguay', 'UY', 'URY', 858);
INSERT INTO `wp_wsm_countries` VALUES (239, 'Uzbekistan', 'UZ', 'UZB', 860);
INSERT INTO `wp_wsm_countries` VALUES (240, 'Vanuatu', 'VU', 'VUT', 548);
INSERT INTO `wp_wsm_countries` VALUES (241, 'Venezuela, Bolivarian Republic of', 'VE', 'VEN', 862);
INSERT INTO `wp_wsm_countries` VALUES (242, 'Viet Nam', 'VN', 'VNM', 704);
INSERT INTO `wp_wsm_countries` VALUES (243, 'Virgin Islands, British', 'VG', 'VGB', 92);
INSERT INTO `wp_wsm_countries` VALUES (244, 'Virgin Islands, U.S.', 'VI', 'VIR', 850);
INSERT INTO `wp_wsm_countries` VALUES (245, 'Wallis and Futuna', 'WF', 'WLF', 876);
INSERT INTO `wp_wsm_countries` VALUES (246, 'Western Sahara', 'EH', 'ESH', 732);
INSERT INTO `wp_wsm_countries` VALUES (247, 'Yemen', 'YE', 'YEM', 887);
INSERT INTO `wp_wsm_countries` VALUES (248, 'Zambia', 'ZM', 'ZMB', 894);
INSERT INTO `wp_wsm_countries` VALUES (249, 'Zimbabwe', 'ZW', 'ZWE', 716);
COMMIT;

-- ----------------------------
-- Table structure for wp_wsm_dailyHourlyReport
-- ----------------------------
DROP TABLE IF EXISTS `wp_wsm_dailyHourlyReport`;
CREATE TABLE `wp_wsm_dailyHourlyReport` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `reportDate` datetime NOT NULL,
  `content` text NOT NULL,
  `timezone` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_wsm_dailyHourlyReport
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wp_wsm_datewise_report
-- ----------------------------
DROP TABLE IF EXISTS `wp_wsm_datewise_report`;
CREATE TABLE `wp_wsm_datewise_report` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `normal` int(2) NOT NULL DEFAULT '0',
  `hour` int(2) NOT NULL DEFAULT '0',
  `search_engine` varchar(255) NOT NULL DEFAULT '',
  `browser` int(2) NOT NULL DEFAULT '0',
  `screen` int(2) NOT NULL DEFAULT '0',
  `country` int(3) NOT NULL DEFAULT '0',
  `city` varchar(255) NOT NULL DEFAULT '',
  `operating_system` int(2) NOT NULL DEFAULT '0',
  `url_id` int(11) NOT NULL DEFAULT '0',
  `total_page_views` int(11) NOT NULL DEFAULT '0',
  `total_visitors` int(11) NOT NULL DEFAULT '0',
  `total_first_time_visitors` int(11) NOT NULL DEFAULT '0',
  `total_bounce` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_wsm_datewise_report
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wp_wsm_logUniqueVisit
-- ----------------------------
DROP TABLE IF EXISTS `wp_wsm_logUniqueVisit`;
CREATE TABLE `wp_wsm_logUniqueVisit` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteId` int(10) unsigned NOT NULL,
  `visitorId` varchar(20) NOT NULL,
  `visitLastActionTime` datetime NOT NULL,
  `configId` varchar(20) NOT NULL,
  `ipAddress` varchar(16) NOT NULL,
  `userId` varchar(200) DEFAULT NULL,
  `firstActionVisitTime` datetime NOT NULL,
  `daysSinceFirstVisit` smallint(5) unsigned DEFAULT NULL,
  `returningVisitor` tinyint(1) DEFAULT NULL,
  `visitCount` int(11) unsigned NOT NULL,
  `visitEntryURLId` int(11) unsigned DEFAULT NULL,
  `visitExitURLId` int(11) unsigned DEFAULT '0',
  `visitTotalActions` int(11) unsigned DEFAULT NULL,
  `refererUrlId` int(11) DEFAULT NULL,
  `browserLang` varchar(20) DEFAULT NULL,
  `browserId` int(11) unsigned DEFAULT NULL,
  `deviceType` varchar(20) DEFAULT NULL,
  `oSystemId` int(11) unsigned DEFAULT NULL,
  `currentLocalTime` time DEFAULT NULL,
  `daysSinceLastVisit` smallint(5) unsigned DEFAULT NULL,
  `totalTimeVisit` int(11) unsigned NOT NULL,
  `resolutionId` int(11) unsigned DEFAULT NULL,
  `cookie` tinyint(1) DEFAULT NULL,
  `director` tinyint(1) DEFAULT NULL,
  `flash` tinyint(1) DEFAULT NULL,
  `gears` tinyint(1) DEFAULT NULL,
  `java` tinyint(1) DEFAULT NULL,
  `pdf` tinyint(1) DEFAULT NULL,
  `quicktime` tinyint(1) DEFAULT NULL,
  `realplayer` tinyint(1) DEFAULT NULL,
  `silverlight` tinyint(1) DEFAULT NULL,
  `windowsmedia` tinyint(1) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `countryId` int(3) unsigned NOT NULL,
  `latitude` decimal(9,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `regionId` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_config_datetime` (`configId`,`visitLastActionTime`),
  KEY `index_datetime` (`visitLastActionTime`),
  KEY `index_idvisitor` (`visitorId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_wsm_logUniqueVisit
-- ----------------------------
BEGIN;
INSERT INTO `wp_wsm_logUniqueVisit` VALUES (1, 1, '0fb6c89565f04478', '2023-01-06 17:01:21', 'a68f5799ccfe674e', '::1', '0', '2023-01-06 17:01:21', 0, 0, 1, 1, 1, 1, 0, 'en-GB', 2, 'Desktop', 12, '17:01:08', 0, 0, 20, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0.000000, 0.000000, 0);
COMMIT;

-- ----------------------------
-- Table structure for wp_wsm_logVisit
-- ----------------------------
DROP TABLE IF EXISTS `wp_wsm_logVisit`;
CREATE TABLE `wp_wsm_logVisit` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteId` int(10) unsigned NOT NULL,
  `visitorId` varchar(20) NOT NULL,
  `visitId` bigint(10) unsigned NOT NULL,
  `refererUrlId` int(10) unsigned DEFAULT '0',
  `keyword` varchar(200) DEFAULT NULL,
  `serverTime` datetime NOT NULL,
  `timeSpentRef` int(11) unsigned NOT NULL,
  `URLId` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_visitId` (`visitId`),
  KEY `index_siteId_serverTime` (`siteId`,`serverTime`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_wsm_logVisit
-- ----------------------------
BEGIN;
INSERT INTO `wp_wsm_logVisit` VALUES (1, 1, '0fb6c89565f04478', 1, 0, 'http://localhost:82/wpbaru/sample-page/', '2023-01-06 17:01:19', 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for wp_wsm_monthlyDailyReport
-- ----------------------------
DROP TABLE IF EXISTS `wp_wsm_monthlyDailyReport`;
CREATE TABLE `wp_wsm_monthlyDailyReport` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `reportMonthYear` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `timezone` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_wsm_monthlyDailyReport
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wp_wsm_monthwise_report
-- ----------------------------
DROP TABLE IF EXISTS `wp_wsm_monthwise_report`;
CREATE TABLE `wp_wsm_monthwise_report` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `normal` int(2) NOT NULL DEFAULT '0',
  `hour` int(2) NOT NULL DEFAULT '0',
  `search_engine` varchar(255) NOT NULL DEFAULT '',
  `browser` int(2) NOT NULL DEFAULT '0',
  `screen` int(2) NOT NULL DEFAULT '0',
  `country` int(3) NOT NULL DEFAULT '0',
  `city` varchar(255) NOT NULL DEFAULT '',
  `operating_system` int(2) NOT NULL DEFAULT '0',
  `url_id` int(11) NOT NULL DEFAULT '0',
  `total_page_views` int(11) NOT NULL DEFAULT '0',
  `total_visitors` int(11) NOT NULL DEFAULT '0',
  `total_first_time_visitors` int(11) NOT NULL DEFAULT '0',
  `total_bounce` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_wsm_monthwise_report
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wp_wsm_oSystems
-- ----------------------------
DROP TABLE IF EXISTS `wp_wsm_oSystems`;
CREATE TABLE `wp_wsm_oSystems` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_wsm_oSystems
-- ----------------------------
BEGIN;
INSERT INTO `wp_wsm_oSystems` VALUES (1, 'Windows 98');
INSERT INTO `wp_wsm_oSystems` VALUES (2, 'Windows CE');
INSERT INTO `wp_wsm_oSystems` VALUES (3, 'Linux');
INSERT INTO `wp_wsm_oSystems` VALUES (4, 'Unix');
INSERT INTO `wp_wsm_oSystems` VALUES (5, 'Windows 2000');
INSERT INTO `wp_wsm_oSystems` VALUES (6, 'Windows XP');
INSERT INTO `wp_wsm_oSystems` VALUES (7, 'Windows 8');
INSERT INTO `wp_wsm_oSystems` VALUES (8, 'Windows 10');
INSERT INTO `wp_wsm_oSystems` VALUES (9, 'Mac OS');
INSERT INTO `wp_wsm_oSystems` VALUES (10, 'Android');
INSERT INTO `wp_wsm_oSystems` VALUES (11, 'IOS');
INSERT INTO `wp_wsm_oSystems` VALUES (12, 'Mac OS X');
COMMIT;

-- ----------------------------
-- Table structure for wp_wsm_regions
-- ----------------------------
DROP TABLE IF EXISTS `wp_wsm_regions`;
CREATE TABLE `wp_wsm_regions` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(2) NOT NULL COMMENT 'Region code',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_wsm_regions
-- ----------------------------
BEGIN;
INSERT INTO `wp_wsm_regions` VALUES (1, 'AF', 'Africa');
INSERT INTO `wp_wsm_regions` VALUES (2, 'AN', 'Antarctica');
INSERT INTO `wp_wsm_regions` VALUES (3, 'AS', 'Asia');
INSERT INTO `wp_wsm_regions` VALUES (4, 'EU', 'Europe');
INSERT INTO `wp_wsm_regions` VALUES (5, 'NA', 'North America');
INSERT INTO `wp_wsm_regions` VALUES (6, 'OC', 'Oceania');
INSERT INTO `wp_wsm_regions` VALUES (7, 'SA', 'South America');
COMMIT;

-- ----------------------------
-- Table structure for wp_wsm_resolutions
-- ----------------------------
DROP TABLE IF EXISTS `wp_wsm_resolutions`;
CREATE TABLE `wp_wsm_resolutions` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_wsm_resolutions
-- ----------------------------
BEGIN;
INSERT INTO `wp_wsm_resolutions` VALUES (1, '640x480');
INSERT INTO `wp_wsm_resolutions` VALUES (2, '800x600');
INSERT INTO `wp_wsm_resolutions` VALUES (3, '960x720');
INSERT INTO `wp_wsm_resolutions` VALUES (4, '1024x768');
INSERT INTO `wp_wsm_resolutions` VALUES (5, '1280x960');
INSERT INTO `wp_wsm_resolutions` VALUES (6, '1400x1050');
INSERT INTO `wp_wsm_resolutions` VALUES (7, '1440x1080');
INSERT INTO `wp_wsm_resolutions` VALUES (8, '1600x1200');
INSERT INTO `wp_wsm_resolutions` VALUES (9, '1856x1392');
INSERT INTO `wp_wsm_resolutions` VALUES (10, '1920x1440');
INSERT INTO `wp_wsm_resolutions` VALUES (11, '2048x1536');
INSERT INTO `wp_wsm_resolutions` VALUES (12, '1280x800');
INSERT INTO `wp_wsm_resolutions` VALUES (13, '1440x900');
INSERT INTO `wp_wsm_resolutions` VALUES (14, '1680x1050');
INSERT INTO `wp_wsm_resolutions` VALUES (15, '1920x1200');
INSERT INTO `wp_wsm_resolutions` VALUES (16, '2560x1600');
INSERT INTO `wp_wsm_resolutions` VALUES (17, '1024x576');
INSERT INTO `wp_wsm_resolutions` VALUES (18, '1152x648');
INSERT INTO `wp_wsm_resolutions` VALUES (19, '1280x720');
INSERT INTO `wp_wsm_resolutions` VALUES (20, '1366x768');
INSERT INTO `wp_wsm_resolutions` VALUES (21, '1600x900');
INSERT INTO `wp_wsm_resolutions` VALUES (22, '1920x1080');
INSERT INTO `wp_wsm_resolutions` VALUES (23, '2560x1440');
INSERT INTO `wp_wsm_resolutions` VALUES (24, '3840x2160');
COMMIT;

-- ----------------------------
-- Table structure for wp_wsm_searchEngines
-- ----------------------------
DROP TABLE IF EXISTS `wp_wsm_searchEngines`;
CREATE TABLE `wp_wsm_searchEngines` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_wsm_searchEngines
-- ----------------------------
BEGIN;
INSERT INTO `wp_wsm_searchEngines` VALUES (1, 'Google');
INSERT INTO `wp_wsm_searchEngines` VALUES (2, 'Bing');
INSERT INTO `wp_wsm_searchEngines` VALUES (3, 'Yahoo');
INSERT INTO `wp_wsm_searchEngines` VALUES (4, 'Baidu');
INSERT INTO `wp_wsm_searchEngines` VALUES (5, 'AOL');
INSERT INTO `wp_wsm_searchEngines` VALUES (6, 'Ask');
INSERT INTO `wp_wsm_searchEngines` VALUES (7, 'Excite');
INSERT INTO `wp_wsm_searchEngines` VALUES (8, 'Duck Duck Go');
INSERT INTO `wp_wsm_searchEngines` VALUES (9, 'WolframAlpha');
INSERT INTO `wp_wsm_searchEngines` VALUES (10, 'Yandex');
INSERT INTO `wp_wsm_searchEngines` VALUES (11, 'Lycos');
INSERT INTO `wp_wsm_searchEngines` VALUES (12, 'Chacha');
COMMIT;

-- ----------------------------
-- Table structure for wp_wsm_toolBars
-- ----------------------------
DROP TABLE IF EXISTS `wp_wsm_toolBars`;
CREATE TABLE `wp_wsm_toolBars` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_wsm_toolBars
-- ----------------------------
BEGIN;
INSERT INTO `wp_wsm_toolBars` VALUES (1, 'Alexa');
INSERT INTO `wp_wsm_toolBars` VALUES (2, 'AOL');
INSERT INTO `wp_wsm_toolBars` VALUES (3, 'Bing');
INSERT INTO `wp_wsm_toolBars` VALUES (4, 'Data');
INSERT INTO `wp_wsm_toolBars` VALUES (5, 'Google');
INSERT INTO `wp_wsm_toolBars` VALUES (6, 'Kiwee');
INSERT INTO `wp_wsm_toolBars` VALUES (7, 'Mirar');
INSERT INTO `wp_wsm_toolBars` VALUES (8, 'Windows Live');
INSERT INTO `wp_wsm_toolBars` VALUES (9, 'Yahoo');
COMMIT;

-- ----------------------------
-- Table structure for wp_wsm_url_log
-- ----------------------------
DROP TABLE IF EXISTS `wp_wsm_url_log`;
CREATE TABLE `wp_wsm_url_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pageId` int(10) unsigned DEFAULT NULL,
  `title` text,
  `hash` varchar(20) NOT NULL,
  `protocol` varchar(10) NOT NULL,
  `url` text,
  `searchEngine` int(2) unsigned DEFAULT NULL,
  `toolBar` int(2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_hash` (`hash`),
  KEY `index_pageid` (`pageId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_wsm_url_log
-- ----------------------------
BEGIN;
INSERT INTO `wp_wsm_url_log` VALUES (1, 8, 'Home - PT. Transporindo Agung Sejahtera', '5eb87ed9ccc8888a', 'http://', 'localhost:82/wpbaru', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for wp_wsm_yearlyMonthlyReport
-- ----------------------------
DROP TABLE IF EXISTS `wp_wsm_yearlyMonthlyReport`;
CREATE TABLE `wp_wsm_yearlyMonthlyReport` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `reportYear` varchar(10) NOT NULL,
  `content` text NOT NULL,
  `timezone` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_wsm_yearlyMonthlyReport
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wp_wsm_yearwise_report
-- ----------------------------
DROP TABLE IF EXISTS `wp_wsm_yearwise_report`;
CREATE TABLE `wp_wsm_yearwise_report` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `normal` int(2) NOT NULL DEFAULT '0',
  `hour` int(2) NOT NULL DEFAULT '0',
  `search_engine` varchar(255) NOT NULL DEFAULT '',
  `browser` int(2) NOT NULL DEFAULT '0',
  `screen` int(2) NOT NULL DEFAULT '0',
  `country` int(3) NOT NULL DEFAULT '0',
  `city` varchar(255) NOT NULL DEFAULT '',
  `operating_system` int(2) NOT NULL DEFAULT '0',
  `url_id` int(11) NOT NULL DEFAULT '0',
  `total_page_views` int(11) NOT NULL DEFAULT '0',
  `total_visitors` int(11) NOT NULL DEFAULT '0',
  `total_first_time_visitors` int(11) NOT NULL DEFAULT '0',
  `total_bounce` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_wsm_yearwise_report
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- View structure for wp_wsm_bouncevisits
-- ----------------------------
DROP VIEW IF EXISTS `wp_wsm_bouncevisits`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `wp_wsm_bouncevisits` AS select `wp_wsm_pageviews`.`visitId` AS `visitId`,`wp_wsm_pageviews`.`visitLastActionTime` AS `visitLastActionTime` from `wp_wsm_pageviews` group by `wp_wsm_pageviews`.`visitId` having (count(`wp_wsm_pageviews`.`URLId`) = 1);

-- ----------------------------
-- View structure for wp_wsm_datewisebounce
-- ----------------------------
DROP VIEW IF EXISTS `wp_wsm_datewisebounce`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `wp_wsm_datewisebounce` AS select date_format(convert_tz(`wp_wsm_bouncevisits`.`visitLastActionTime`,'+00:00','+07:00'),'%Y-%m-%d') AS `recordDate`,count(0) AS `bounce` from `wp_wsm_bouncevisits` group by date_format(convert_tz(`wp_wsm_bouncevisits`.`visitLastActionTime`,'+00:00','+07:00'),'%Y-%m-%d');

-- ----------------------------
-- View structure for wp_wsm_datewisebouncerate
-- ----------------------------
DROP VIEW IF EXISTS `wp_wsm_datewisebouncerate`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `wp_wsm_datewisebouncerate` AS select `dwb`.`recordDate` AS `recordDate`,`dwb`.`bounce` AS `bounce`,`dwp`.`pageViews` AS `pageViews`,`dwv`.`visitors` AS `visitors`,((`dwb`.`bounce` / `dwp`.`pageViews`) * 100) AS `bRatePageViews`,((`dwb`.`bounce` / `dwv`.`visitors`) * 100) AS `bRateVisitors` from ((`wp_wsm_datewisebounce` `dwb` left join `wp_wsm_datewisepageviews` `dwp` on((`dwb`.`recordDate` = `dwp`.`recordDate`))) left join `wp_wsm_datewisevisitors` `dwv` on((`dwb`.`recordDate` = `dwv`.`recordDate`)));

-- ----------------------------
-- View structure for wp_wsm_datewisefirstvisitors
-- ----------------------------
DROP VIEW IF EXISTS `wp_wsm_datewisefirstvisitors`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `wp_wsm_datewisefirstvisitors` AS select date_format(convert_tz(`wp_wsm_uniquevisitors`.`firstVisitTime`,'+00:00','+07:00'),'%Y-%m-%d') AS `recordDate`,count(`wp_wsm_uniquevisitors`.`visitorId`) AS `visitors` from `wp_wsm_uniquevisitors` group by date_format(convert_tz(`wp_wsm_uniquevisitors`.`firstVisitTime`,'+00:00','+07:00'),'%Y-%m-%d');

-- ----------------------------
-- View structure for wp_wsm_datewisepageviews
-- ----------------------------
DROP VIEW IF EXISTS `wp_wsm_datewisepageviews`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `wp_wsm_datewisepageviews` AS select date_format(convert_tz(`wp_wsm_pageviews`.`visitLastActionTime`,'+00:00','+07:00'),'%Y-%m-%d') AS `recordDate`,sum(`wp_wsm_pageviews`.`totalViews`) AS `pageViews` from `wp_wsm_pageviews` group by date_format(convert_tz(`wp_wsm_pageviews`.`visitLastActionTime`,'+00:00','+07:00'),'%Y-%m-%d');

-- ----------------------------
-- View structure for wp_wsm_datewisevisitors
-- ----------------------------
DROP VIEW IF EXISTS `wp_wsm_datewisevisitors`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `wp_wsm_datewisevisitors` AS select date_format(convert_tz(`wp_wsm_loguniquevisit`.`visitLastActionTime`,'+00:00','+07:00'),'%Y-%m-%d') AS `recordDate`,count(0) AS `visitors` from `wp_wsm_loguniquevisit` group by date_format(convert_tz(`wp_wsm_loguniquevisit`.`visitLastActionTime`,'+00:00','+07:00'),'%Y-%m-%d');

-- ----------------------------
-- View structure for wp_wsm_hourwisebounce
-- ----------------------------
DROP VIEW IF EXISTS `wp_wsm_hourwisebounce`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `wp_wsm_hourwisebounce` AS select hour(convert_tz(`wp_wsm_bouncevisits`.`visitLastActionTime`,'+00:00','+07:00')) AS `hour`,count(0) AS `bounce` from `wp_wsm_bouncevisits` where (convert_tz(`wp_wsm_bouncevisits`.`visitLastActionTime`,'+00:00','+07:00') >= '2023-01-07 00:00:00') group by hour(convert_tz(`wp_wsm_bouncevisits`.`visitLastActionTime`,'+00:00','+07:00'));

-- ----------------------------
-- View structure for wp_wsm_hourwisebouncerate
-- ----------------------------
DROP VIEW IF EXISTS `wp_wsm_hourwisebouncerate`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `wp_wsm_hourwisebouncerate` AS select `hwb`.`hour` AS `hour`,`hwb`.`bounce` AS `bounce`,`hwp`.`pageViews` AS `pageViews`,`hwv`.`visitors` AS `visitors`,((`hwb`.`bounce` / `hwp`.`pageViews`) * 100) AS `bRatePageViews`,((`hwb`.`bounce` / `hwv`.`visitors`) * 100) AS `bRateVisitors` from ((`wp_wsm_hourwisebounce` `hwb` left join `wp_wsm_hourwisepageviews` `hwp` on((`hwb`.`hour` = `hwp`.`hour`))) left join `wp_wsm_hourwisevisitors` `hwv` on((`hwb`.`hour` = `hwv`.`hour`)));

-- ----------------------------
-- View structure for wp_wsm_hourwisefirstvisitors
-- ----------------------------
DROP VIEW IF EXISTS `wp_wsm_hourwisefirstvisitors`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `wp_wsm_hourwisefirstvisitors` AS select hour(convert_tz(`wp_wsm_uniquevisitors`.`firstVisitTime`,'+00:00','+07:00')) AS `hour`,count(0) AS `visitors` from `wp_wsm_uniquevisitors` where (convert_tz(`wp_wsm_uniquevisitors`.`firstVisitTime`,'+00:00','+07:00') >= '2023-01-07 00:00:00') group by hour(convert_tz(`wp_wsm_uniquevisitors`.`firstVisitTime`,'+00:00','+07:00'));

-- ----------------------------
-- View structure for wp_wsm_hourwisepageviews
-- ----------------------------
DROP VIEW IF EXISTS `wp_wsm_hourwisepageviews`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `wp_wsm_hourwisepageviews` AS select hour(convert_tz(`wp_wsm_pageviews`.`visitLastActionTime`,'+00:00','+07:00')) AS `hour`,sum(`wp_wsm_pageviews`.`totalViews`) AS `pageViews` from `wp_wsm_pageviews` where (convert_tz(`wp_wsm_pageviews`.`visitLastActionTime`,'+00:00','+07:00') >= '2023-01-07 00:00:00') group by hour(convert_tz(`wp_wsm_pageviews`.`visitLastActionTime`,'+00:00','+07:00'));

-- ----------------------------
-- View structure for wp_wsm_hourwisevisitors
-- ----------------------------
DROP VIEW IF EXISTS `wp_wsm_hourwisevisitors`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `wp_wsm_hourwisevisitors` AS select hour(convert_tz(`wp_wsm_loguniquevisit`.`firstActionVisitTime`,'+00:00','+07:00')) AS `hour`,count(0) AS `visitors` from `wp_wsm_loguniquevisit` where (convert_tz(`wp_wsm_loguniquevisit`.`firstActionVisitTime`,'+00:00','+07:00') >= '2023-01-07 00:00:00') group by hour(convert_tz(`wp_wsm_loguniquevisit`.`firstActionVisitTime`,'+00:00','+07:00'));

-- ----------------------------
-- View structure for wp_wsm_monthwisebounce
-- ----------------------------
DROP VIEW IF EXISTS `wp_wsm_monthwisebounce`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `wp_wsm_monthwisebounce` AS select date_format(convert_tz(`wp_wsm_bouncevisits`.`visitLastActionTime`,'+00:00','+07:00'),'%Y-%m') AS `recordMonth`,count(0) AS `bounce` from `wp_wsm_bouncevisits` group by date_format(convert_tz(`wp_wsm_bouncevisits`.`visitLastActionTime`,'+00:00','+07:00'),'%Y-%m-');

-- ----------------------------
-- View structure for wp_wsm_monthwisebouncerate
-- ----------------------------
DROP VIEW IF EXISTS `wp_wsm_monthwisebouncerate`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `wp_wsm_monthwisebouncerate` AS select `mwb`.`recordMonth` AS `recordMonth`,`mwb`.`bounce` AS `bounce`,`mwp`.`pageViews` AS `pageViews`,`mwv`.`visitors` AS `visitors`,((`mwb`.`bounce` / `mwp`.`pageViews`) * 100) AS `bRatePageViews`,((`mwb`.`bounce` / `mwv`.`visitors`) * 100) AS `bRateVisitors` from ((`wp_wsm_monthwisebounce` `mwb` left join `wp_wsm_monthwisepageviews` `mwp` on((`mwb`.`recordMonth` = `mwp`.`recordMonth`))) left join `wp_wsm_monthwisevisitors` `mwv` on((`mwb`.`recordMonth` = `mwv`.`recordMonth`)));

-- ----------------------------
-- View structure for wp_wsm_monthwisefirstvisitors
-- ----------------------------
DROP VIEW IF EXISTS `wp_wsm_monthwisefirstvisitors`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `wp_wsm_monthwisefirstvisitors` AS select date_format(convert_tz(`wp_wsm_uniquevisitors`.`firstVisitTime`,'+00:00','+07:00'),'%Y-%m') AS `recordMonth`,count(`wp_wsm_uniquevisitors`.`visitorId`) AS `visitors` from `wp_wsm_uniquevisitors` group by date_format(convert_tz(`wp_wsm_uniquevisitors`.`firstVisitTime`,'+00:00','+07:00'),'%Y-%m');

-- ----------------------------
-- View structure for wp_wsm_monthwisepageviews
-- ----------------------------
DROP VIEW IF EXISTS `wp_wsm_monthwisepageviews`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `wp_wsm_monthwisepageviews` AS select date_format(convert_tz(`wp_wsm_pageviews`.`visitLastActionTime`,'+00:00','+07:00'),'%Y-%m') AS `recordMonth`,sum(`wp_wsm_pageviews`.`totalViews`) AS `pageViews` from `wp_wsm_pageviews` group by date_format(convert_tz(`wp_wsm_pageviews`.`visitLastActionTime`,'+00:00','+07:00'),'%Y-%m');

-- ----------------------------
-- View structure for wp_wsm_monthwisevisitors
-- ----------------------------
DROP VIEW IF EXISTS `wp_wsm_monthwisevisitors`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `wp_wsm_monthwisevisitors` AS select date_format(convert_tz(`wp_wsm_loguniquevisit`.`visitLastActionTime`,'+00:00','+07:00'),'%Y-%m') AS `recordMonth`,count(0) AS `visitors` from `wp_wsm_loguniquevisit` group by date_format(convert_tz(`wp_wsm_loguniquevisit`.`visitLastActionTime`,'+00:00','+07:00'),'%Y-%m');

-- ----------------------------
-- View structure for wp_wsm_pageviews
-- ----------------------------
DROP VIEW IF EXISTS `wp_wsm_pageviews`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `wp_wsm_pageviews` AS select `LV`.`visitId` AS `visitId`,`LV`.`URLId` AS `URLId`,`LV`.`keyword` AS `keyword`,`LV`.`refererUrlId` AS `refererUrlId`,`LU`.`countryId` AS `countryId`,`LU`.`regionId` AS `regionId`,count(0) AS `totalViews`,max(`LV`.`serverTime`) AS `visitLastActionTime` from (`wp_wsm_logvisit` `LV` left join `wp_wsm_loguniquevisit` `LU` on((`LV`.`visitId` = `LU`.`id`))) group by `LV`.`visitId`,`LV`.`URLId`;

-- ----------------------------
-- View structure for wp_wsm_uniquevisitors
-- ----------------------------
DROP VIEW IF EXISTS `wp_wsm_uniquevisitors`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `wp_wsm_uniquevisitors` AS select `LU`.`id` AS `id`,`LU`.`visitorId` AS `visitorId`,sum(`LU`.`totalTimeVisit`) AS `totalTimeVisit`,min(`LV`.`serverTime`) AS `firstVisitTime`,`LU`.`refererUrlId` AS `refererUrlId` from (`wp_wsm_loguniquevisit` `LU` left join `wp_wsm_logvisit` `LV` on((`LV`.`visitId` = `LU`.`id`))) group by `LU`.`visitorId`;

-- ----------------------------
-- View structure for wp_wsm_visitorinfo
-- ----------------------------
DROP VIEW IF EXISTS `wp_wsm_visitorinfo`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `wp_wsm_visitorinfo` AS select `LV`.`visitId` AS `visitId`,`LU`.`userId` AS `userId`,`LV`.`serverTime` AS `serverTime`,`LU`.`visitLastActionTime` AS `visitLastActionTime`,`LV`.`URLId` AS `urlId`,count(`LV`.`URLId`) AS `hits`,`UL`.`title` AS `title`,concat(`UL`.`protocol`,`UL`.`url`) AS `url`,concat(`UL2`.`protocol`,`UL2`.`url`) AS `refUrl`,`LU`.`visitorId` AS `visitorId`,`LU`.`ipAddress` AS `ipAddress`,`LU`.`city` AS `city`,`C`.`alpha2Code` AS `alpha2Code`,`C`.`name` AS `country`,`LU`.`deviceType` AS `deviceType`,`B`.`name` AS `browser`,`OS`.`name` AS `osystem`,`LU`.`latitude` AS `latitude`,`LU`.`longitude` AS `longitude`,`R`.`name` AS `resolution`,`SE`.`name` AS `searchEngine`,`TB`.`name` AS `toolBar` from (((((((((`wp_wsm_logvisit` `LV` left join `wp_wsm_loguniquevisit` `LU` on((`LU`.`id` = `LV`.`visitId`))) left join `wp_wsm_countries` `C` on((`C`.`id` = `LU`.`countryId`))) left join `wp_wsm_browsers` `B` on((`B`.`id` = `LU`.`browserId`))) left join `wp_wsm_resolutions` `R` on((`R`.`id` = `LU`.`resolutionId`))) left join `wp_wsm_url_log` `UL` on((`LV`.`URLId` = `UL`.`id`))) left join `wp_wsm_url_log` `UL2` on((`LV`.`refererUrlId` = `UL2`.`id`))) left join `wp_wsm_searchengines` `SE` on((`SE`.`id` = `UL`.`searchEngine`))) left join `wp_wsm_toolbars` `TB` on((`TB`.`id` = `UL`.`toolBar`))) left join `wp_wsm_osystems` `OS` on((`OS`.`id` = `LU`.`oSystemId`))) group by `LV`.`visitId`,`LV`.`URLId` order by `LV`.`visitId` desc,`LV`.`serverTime` desc;

SET FOREIGN_KEY_CHECKS = 1;

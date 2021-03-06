=== Pay with a tweet ===
Contributors: rolando.caldas
Donate link: 
Tags: social, viral, social marketing, viral marketing, twitter, download, pay with a tweet, tweet to download, tweet and get it, plugin, plugins, shortcode, shortcodes, widget, widgets
Requires at least: 3.3
Tested up to: 4.0
Stable tag: 1.0.5
License: GPLv2 or later
License URI: http://www.gnu.org/licenses/gpl-2.0.html

Allow your visitors to download files after publishing a tweet on his twitter account.

== Description ==

This plugin does not need services of others, unless of course Twitter. 

Create buttons so that your visitors can download files after posting on his twitter the message you choose. You can display different buttons using shortcodes or the widget included.

= Some Features =

* Manage downloads
  * Files for use on "Pay with a Tweet" will be uploaded from the [upload files screen](http://www.example.com/wp-admin/admin.php?page=pay-with-a-tweet/admin/pwt-upload.php).
  * For uploading files using the file upload system WordPress.
  * The uploaded files are not part of the WordPress media manager.
  * Files are not accessible via web.
  * When you delete a file removes all the buttons that use it.
  * Access to the creation of a button from the file upload.
* Manage buttons
  * Each button created is linked to a file. There can be multiple buttons linked to the same file.
  * Each button can set a title, the button image to use as button and the text to publish as tweet.
  * The buttons can be deleted or permanently delete. This second option will delete the image and file.
* Multiple languages support
  *The plugin includes English and Spanish. Furthermore, in pay-with-a-tweet-wp-plugin/tree/master/pay-with-a-tweet/languages ​​directory the .po is available for translation in other languages
* Shortcodes
  * The plugin includes the shortcode `[pwt id ='']` to add the button anywhere in a post or page.
* Widget
  * The plugin includes a widget to place the button on the sidebars. The widget allows you to enter a title, a text to display before the button and a dropdown to select the desired button.

[See all features](http://wordpress.org/plugins/pay-with-a-tweet/other_notes/)

== Installation ==

1. Upload `pay-with-a-tweet` folder to the `/wp-content/plugins/` directory
2. Activate the plugin through the 'Plugins' menu in WordPress
3. Go to pay-with-a-tweet configuration page and fill the fields. Video tutorial:

http://www.youtube.com/watch?v=AO1_-vrLPZ0

== Frequently asked questions ==

= Is the code documented? =

Yes, all the code is documented with phpDoc. 
In the doc folder you can see the HTML version.

= I click in the download button and HTTP error returned =

Make sure you have correctly configured the plugin. See this video:

http://www.youtube.com/watch?v=AO1_-vrLPZ0

== Screenshots ==

1. Configuration screen
2. Manage files
3. Upload files
4. Upload files 2
5. Manage buttons
6. New button
7. Widget

== Changelog ==

= 1.0.5 =

Fix issue "Cannot redeclare class TwitterOAuth in 
(...)/wp-content/plugins/pay-with-a-tweet/lib/twitteroauth.php on line 15"

= 1.0.4 = 

Fix issue "Fatal error: Cannot redeclare class OAuthException" when OAuth PECL
package is installed or another plugin load the same library.

Add a new callback page before publish the tweet and start the download.

= 1.0.3 =

Fix issue with the download when wordpress is installed in a subfolder

= 1.0.2 =

Create a button admin page: hide image and index.html in downloads list
Changed twitter api version to 1.1

= 1.0.1 =

Fix issue with folder name of plugin.
Fix issue $_SESSION, changed to $_COOKIE

= 1.0 =

Initial version

== Upgrade notice ==

Just override the plugin files.
Go to /wp-content/uploads/ and, if exists, rename pay-with-tweet folder to pay-with-a-tweet

== Features ==

= Configuration =

To use the plugin you must create a Twitter application and add the `key consumer` and `consumer secret`.

When creating the Twitter application is necessary to properly set the `callback URL`. This address is in the plugin [Configuration screen](http://www.example.com/wp-admin/admin.php?page=pay-with-a-tweet/admin/pwt-config.php).

= Manage downloads =

* Files for use on "Pay with a Tweet" will be uploaded from the [upload files screen](http://www.example.com/wp-admin/admin.php?page=pay-with-a-tweet/admin/pwt-upload.php).
* For uploading files using the file upload system WordPress.
* The uploaded files are not part of the WordPress media manager.
* Files are not accessible via web.
* When you delete a file removes all the buttons that use it.
* Access to the creation of a button from the file upload.

= Manage buttons =

* Each button created is linked to a file. There can be multiple buttons linked to the same file.
* Each button can set a title, the button image to use as button and the text to publish as tweet.
* The buttons can be deleted or permanently delete. This second option will delete the image and file.

= Multiple languages support =

The plugin includes English and Spanish. Furthermore, in pay-with-a-tweet-wp-plugin/tree/master/pay-with-a-tweet/languages ​​directory the .po is available for translation in other languages

= Shortcodes =

The plugin includes the shortcode `[pwt id ='']` to add the button anywhere in a post or page.

= Widget =

The plugin includes a widget to place the button on the sidebars. The widget allows you to enter a title, a text to display before the button and a dropdown to select the desired button.

= Download process =

When a user click on the button/link to download the file, he must accept to access the website to post the tweet associated with the button, once properly released, the download is automatically launched.

`The plugin does not store the user's access_token so the plugin may not post tweets in the user's account at any time unless the user expressly click on download file.`

= Stats =

* When somebody download a file via a button pay with a tweet, reference is stored (in your WP database) for statistical purposes.

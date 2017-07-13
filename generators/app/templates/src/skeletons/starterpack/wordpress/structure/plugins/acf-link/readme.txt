=== Advanced Custom Fields: Link ===
Contributors: coreyw
Tags: acf, advanced custom fields, link, chooser, selector, picker
Requires at least: 3.5.0
Tested up to: 4.8
Stable tag: 1.1.6
License: GPLv2 or later
License URI: http://www.gnu.org/licenses/gpl-2.0.html

Integrates WordPress' default link picker into Advanced Custom Fields

== Description ==

Allows you to select an existing piece of content or enter a custom URL, set the link title, and choose whether or not the link should open in a new window/tab.

**Only works with ACF version 5 and above.**
**Requires PHP 5.4 or above.**

After saving, you can access your data as an array:

    array(
        [url]    => http://site.com/page/
        [title]  => Page!
        [target] => 0
    )

== Installation ==

1. Upload `acf-link` folder to the `/wp-content/plugins/` directory
1. Activate the plugin through the 'Plugins' menu in WordPress
1. When editing an ACF Field Group, select 'Link' as the field type

== Frequently Asked Questions ==

== Screenshots ==

1. Field when no link has been selected
2. Link selection modal box
3. Field when a link has been selected

== Changelog ==

= 1.1.6 =
2017-05-23

* Fixes bug that broke dashboard in last release

= 1.1.5 =
2017-05-22

* Updating PHP namespace
* Adding basic support for [Admin Columns Pro](https://www.admincolumns.com/advanced-custom-fields-columns/)

= 1.1.4 =
2016-08-12

* If link title is empty, it auto populates based on search selection

= 1.1.3 =
* Added fix for pages that don't have editors

= 1.1.2 =
* Improvement to allow field to work correctly anywhere ACF can be used

= 1.1.1 =
* Fixes usage on pages without an editor

= 1.1.0 =
* Fixes bug where link would be added to WYSIWYG editor also
* Adds new settings to hide the title and target fields

= 1.0.2 =
* Fixes bug where link would be added to editor also

= 1.0.1 =
* Fixes class names for ACF icons

= 1.0.0 =
* First release

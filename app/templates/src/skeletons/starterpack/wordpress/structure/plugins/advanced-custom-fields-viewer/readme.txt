=== Advanced Custom Fields Viewer ===
Contributors: JoeFusco
Tags: ACF, Advanced Custom Fields, custom, field, custom field, advanced, preview, viewer, inspect, more fields, repeater, post, type, text, textarea, file, image, edit, admin
Requires at least: 3.5.0
Tested up to: 4.4.0
License: GPLv2 or later
License URI: http://www.gnu.org/licenses/gpl-2.0.html
Stable Tag: trunk

View Advanced Custom Fields names & data on the front end of your theme while developing.

== Description ==

If you are working with a large number of fields in Elliot Condon’s Advanced Custom Fields, chances are you manually wrap print_r inside of pre tags while building themes. Sometimes you just need all the fields you are working with more accessible and out of the way. You will be able to bounce back and forth between fields on your current page and the options page if available, and quickly close the menu once done.

= Features =

* Viewer button hidden until needed in the top left corner of your theme.
* 3 different color schemes for the front end viewer.
* Supports viewing of non Advanced Custom Fields arrays! Just use `acfv( $array )`.

= Contributing =

Contributions are welcome on GitHub. https://github.com/josephfusco/advanced-custom-fields-viewer/

== Installation ==

1. Upload `advanced-custom-fields-viewer` to the `/wp-content/plugins` directory.
2. Activate the plugin through the `Plugins` menu in WordPress.
3. Click on the new menu item `Viewer` for plugin options.
4. Hover top left of the front of your site to see the toggle button for all available ACF fields for the current page, as well as the options page if available.

== Screenshots ==

1. Plugin Settings

2. Front End Toggle Button

3. Front End Viewer

== Changelog ==

= 1.2.1 =
* Trigger notification for last forgotten commit that prevented plugin activation.
* Clean up unused files.

= 1.2 =
* Fixed CSS conflict with word-break forcing viewer to appear at certain screen widths.
* Added keyboard shortcuts to toggle viewer menu.
* Added link to GitHub repository.
* Minor code improvements.

= 1.1.6 =
* Fix broken link to plugin settings page.
* Minor code improvements.

= 1.1.5 =
* Moved settings menu from top level menu to child of settings.
* Renamed settings menu from `Viewer` to `ACF Viewer`.
* Removed author logo for a cleaner admin UI.
* Fixed minor typos.
* Improved behind the scenes formatting.

= 1.1.4 =
* Fixed php errors with defining constants.
* Increased z-index of viewer to be just underneath admin bar.
* Improved viewer selectors to prevent theme overrides.
* Added slight padding to viewer for improved appearance.

= 1.1.3 =
* Fixed white-space bug within pre element.

= 1.1.2 =
* Edited plugin description.

= 1.1.1 =
* Added admin menu icon.

= 1.1.0 =
* Added support for non Advanced Custom Fields arrays to be seen in viewer.
* Added svg icon to viewer button.
* Cleaned up source code.

= 1.0.0 =
* Advanced Custom Fields Viewer.

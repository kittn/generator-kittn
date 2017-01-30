=== Advanced Custom Fields: Markdown Field ===
Contributors: jensnilsson
Tags: Advanced Custom Fields, acf, acf4, acf5, custom fields, admin, wp-admin, markdown, syntax, syntax highlighting, md, mou
Requires at least: 4.0
Tested up to: 4.6.1
Stable tag: trunk
License: GPLv2 or later
License URI: http://www.gnu.org/licenses/gpl-2.0.html

Adds a markdown-field.

== Description ==

Adds a markdown-field, which is really just a textarea with some extra tools and features that makes writing markdown more visually appealing. Themes for the editor, the preview-mode and for syntax-highlighting is included and configurable in the field-group settings.

= Compatibility =

This ACF field type is compatible with:

* ACF 5
* ACF 4

== Installation ==

1. Copy the `advanced-custom-fields-markdown` folder into your `wp-content/plugins` folder
2. Activate the Markdown plugin via the plugins admin page
3. Create a new field via ACF and select the Markdown type
4. Please refer to the description for more info regarding the field type settings

== GitHub ==

If you want the latest development version of this plugin it is available over at my [github repository](https://github.com/jensjns/acf-markdown-field/). The github repository will always have the latest code and may occasionally be broken and not work at all.

== Screenshots ==

1. Settings for the field.
2. Markdown editor (Editor theme: Dark).
3. Preview mode (Preview theme: GitHub, Syntax highlight theme: Monokai Sublime).

== Changelog ==

= 1.1.4 =
* The field now initializes correctly when used inside a tab that is not the first tab.

= 1.1.3 =
* Fixed a bug that caused the js to initialize EpicEditor on the wrong element when appending a field using flexible content/repeater.

= 1.1.2 =
* Fixed a bug that caused the "Add Media" button to not work properly.

= 1.1.1 =
* Fixed selector for add media button.

= 1.1.0 =
* Added support for "Add Media" button.

= 1.0.0 =
* Initial Release.

== Upgrade Notice ==

= 1.1.4 =
* The field now initializes correctly when used inside a tab that is not the first tab.

= 1.1.3 =
* Fixed a bug that caused the js to initialize EpicEditor on the wrong element when appending a field using flexible content/repeater.

= 1.1.2 =
* Fixed a bug that caused the "Add Media" button to not work properly.

= 1.1.1 =
* Fixed selector for add media button.

= 1.1.0 =
* Added support for "Add Media" button. (Available as an option)

= 1.0.0 =
* Initial Release.
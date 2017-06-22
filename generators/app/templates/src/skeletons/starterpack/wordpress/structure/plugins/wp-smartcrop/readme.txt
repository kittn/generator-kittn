=== WP SmartCrop ===
Contributors: wpsmartcrop
Tags: image, crop, cropping, resize, aspect ratio, fit, size, advanced, simple, media, library, photography, featured image, content, responsive, design, smart, intelligent, live
Requires at least: 3.5.0
Tested up to: 4.7
Stable tag: trunk
License: GPLv2 or later
License URI: http://www.gnu.org/licenses/gpl-2.0.html

WP SmartCrop will crop your images on-the-fly to match your CSS, keeping the main focal point in view.


== Description ==

WP SmartCrop allows you to set the 'focal point' of any image, right from the media library, then crops your images to match your css rules *(no more squished aspect ratios)*, keeping that focal point, not only in view, but as near as possible to a 'rule of thirds' position in the image.  The results are powerful, composed photos at any screen size, with any constraints.

---
Learn More at: **[http://www.wpsmartcrop.com/](http://www.wpsmartcrop.com)**
---

* Visually select your images' focal points with an intuitive click-based interface
* Quickly enable or disable smart-cropping on a per-image basis.
* Easily target only the images you want to style, with the *img.wpsmartcrop-image* selector
* Automatic image preloader, so your users never see partially loaded images again
* Semantic HTML5/CSS3 for modern browsers, with automatic fallback to non-semantic HTML4/CSS2 for older browsers.
* Lightweight and fast processing of images, even inside post content
* Fully compatible with common caching and optimization plugins and solutions, such as W3 Total Cache, Wordfence, WPEngine's EverCache, Better Wordpress Minify, and Google's PageSpeed Module.
* Lets you take full advantage of the new responsive srcset features added in Wordpress 4.4, to make the most of your images.
* **NEW!** Legacy support for existing cropped thumb sizes allows you to see improvements, right out of the box, without changing your CSS!

== Installation ==
You can use the built in installer and upgrader, or you can install the plugin
manually.

= From your WordPress dashboard =

1. Visit 'Plugins > Add New'
1. Search for 'WP SmartCrop'
1. Activate WP SmartCrop from your Plugins page.

= From WordPress.org =

1. Download WP SmartCrop.
1. Upload the 'wp-smartcrop' directory to your '/wp-content/plugins/' directory, using your favorite method (ftp, sftp, scp, etc...)
1. Activate WP SmartCrop from your Plugins page.

= Once Activated =

1. Upload images to your Media Library
1. Select an image in the library, so that image details appear on the right
1. Check the *Enable Smart Cropping* checkbox.
1. Find the preview thumbnail of the image (at the top of the sidebar from the 'insert media' screen, or to the left on the media library details screen)
1. Click the focal point of the image.  This should be the central subject, and the area of the image that we want in view at all times.  For a portrait, I recommend clicking an eye, or other powerful feature. You can change the focus at any time, simply by clicking on a new part of the image.
1. Insert the image into a page or post
1. Style your image, using the *img.wpsmartcrop-image* selector

== Compatibility ==
WP SmartCrop has been fully tested in the following browsers:

* Safari
* Chrome
* Firefox
* Opera
* Microsoft Edge
* Internet Explorer 9-11
* IOS 7+
* Android 4.0+
* Windows Phone 8.1

This is by no means an exhaustive list of supported devices; it just represents our primary target platforms.

== Website ==
[http://www.wpsmartcrop.com/](http://www.wpsmartcrop.com)

= Please Rate/Review and Enjoy =
Your Ratings and Reviews help us to direct our development, and help other users know what to expect.


== Frequently Asked Questions ==

= Q. I installed the plugin, and nothing changed.  What gives? =
A. WP SmartCrop is designed to simplify the process for styling your responsive images, but you need to add some styles for it to use.  Try adding this snippet to your theme's *style.css* file, as a test:

    img.wpsmartcrop-image {
        display: block;
        width: 100%;
        height: 200px;
    }

Once you've verified that the plugin is working, go wild!  Some example css for inspiration can be found at [http://www.wpsmartcrop.com/demos](http://www.wpsmartcrop.com/demos)

= Q. Why can't you choose the focal points for me? =
A. We're currently working on a "pro" version that will do exactly that. If you're interested in the feature, let us know as a feature request.  It always helps to see people interested in further developments.

= Q. Can I integrate WP Smart Crop in my theme? =
A. We love to see theme integrations, but reach out to us first, at admin@wpsmartcrop.com.  We maintain a separate, paid branch for theme developers that has some necessary changes and integrations incorporated, and there are some caveats that should be followed to make sure your theme is fully compatible with our future roadmap.  Otherwise, feel free to list it as a suggested plugin with your theme.

= Q. Your plugin is bad, and you should feel bad! =
A. That's not really a question, but at least our moms like us. Feel free to send your 'constructive criticism' to admin@wpsmartcrop.com, or leave us a review/rating.

== Screenshots ==

1. An example of featured image styling done with WP SmartCrop

2. The additions to the Media Library interface.

3. Same additions shown in the Insert Media pane.


== Changelog ==

= 1.3.1 =
* Fix issue with edge cases and focal positions of with 0 as a coordinate

= 1.3.0 =
* Provide better support for iOS devices
* additional css tweaks for better universality

= 1.2.0 =
* Add initial steps towards add-on friendliness
* Add extensible settings page

= 1.1.0 =
* Recrop existing cropped thumbnail sizes to match focal point

= 1.0.0 =
* Initial Release

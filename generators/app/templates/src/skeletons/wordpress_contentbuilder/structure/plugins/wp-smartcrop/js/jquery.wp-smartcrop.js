/**
 * jQuery WP-SmartCrop v1.4.4
 * Copyright (c) 2017 Greg Schoppe
 * License: http://www.opensource.org/licenses/mit-license.php
 **/
(function($){
	$.fn.extend({ 'wpsmartcrop' : function(options) {
		var options = $.extend({
			 // array of percentages [x, y] denoting the position
			 // of the focal point in the image (example: [16, 78])
			'focal_point'   : null,
			// set to 'new' to force "objectFit" mode or
			// set to 'old' to force "overflow: hidden" mode
			'compatibility' : null,
		}, options);

		// localized version of a request animation frame polyfill by paul irish
		var lastTime = 0;
		var vendors = ['webkit', 'moz'];
		var requestFrame = window.requestAnimationFrame;
		var cancelFrame = window.cancelAnimationFrame;
		for(var x = 0; x < vendors.length && !requestFrame; ++x) {
			requestFrame = window[vendors[x]+'RequestAnimationFrame'];
			cancelFrame = window[vendors[x]+'CancelAnimationFrame'] || window[vendors[x]+'CancelRequestAnimationFrame'];
		}
		if (!requestFrame) {
			requestFrame = function(callback, element) {
				var currTime = new Date().getTime();
				var timeToCall = Math.max(0, 16 - (currTime - lastTime));
				var id = window.setTimeout(function() {
					callback(currTime + timeToCall);
				}, timeToCall);
				lastTime = currTime + timeToCall;
				return id;
			};
		}
		if (!cancelFrame) {
			cancelFrame = function(id) {
				clearTimeout(id);
			};
		}
		// END requestAnimationFrame polyfill

		// check if the browser supports objectfit
		var browser_supports_object_fit = (function() { // immediately invoked
			var div = document.createElement("div");
			if( "objectFit" in div.style && "objectPosition" in div.style ) {
				return true;
			}
			if( "OobjectFit" in div.style && "OobjectPosition" in div.style ) {
				return true;
			}
			return false;
		})();
		// get the closest value in an array to a specific number
		function closest( num, arr ) {
			var curr = arr[0];
			var diff = Math.abs( num - curr );
			for( var val = 0; val < arr.length; val++ ) {
				var newdiff = Math.abs( num - arr[val] );
				if( newdiff < diff ) {
					diff = newdiff;
					curr = arr[val];
				}
			}
			return curr;
		}
		// calculating the dimensions of a proportional image that
		// will cover the target used for overflow:hidden mode
		function get_final_image_dims( natural_dims, target_dims ) {
			var natural_ratio = natural_dims[0]/natural_dims[1];
			var target_ratio  = target_dims[0]/target_dims[1];
			if( natural_ratio > target_ratio ) {
				return [
					Math.round(target_dims[1] * natural_ratio),
					target_dims[1]
				];
			}
			return [
				target_dims[0],
				Math.round(target_dims[0] / natural_ratio)
			];
		}
		// get dimensions to crop element to put the focus as close to a rule of
		// thirds line, or the center, as possible
		function get_crop_data($el) {
			var get_smartcrop_offset = function(dim, orig_dim, focus_pos) {
				var power_lines = [.33333, .5, .66667];
				focus_pos = focus_pos / 100;
				var focus_target = closest(focus_pos, power_lines);
				var offset = Math.round(focus_pos * orig_dim - focus_target * dim);
				var max = orig_dim - dim;
				if(offset > max) {
					offset = max;
				}
				if(offset < 0) {
					offset = 0;
				}
				return -1 * offset;
			}
			var focal_point  = $el.data('smartcrop-focus');
			var natural_dims = [
				( $el[0].naturalWidth  ) ? $el[0].naturalWidth  : $el[0].getAttribute('width'),
				( $el[0].naturalHeight ) ? $el[0].naturalHeight : $el[0].getAttribute('height')
			];
			var target_dims  = [
				$el.width(),
				$el.height()
			];
			if( !focal_point || focal_point.length < 2 ||
				!natural_dims[0] || !natural_dims[1] ||
				!target_dims[0] || !target_dims[1] ) {
				return false;
			}
			var final_dims = get_final_image_dims( natural_dims, target_dims );
			var offsets = [0,0]
			if( target_dims[0]/target_dims[1] < final_dims[0]/final_dims[1] ) {
				offsets[0] = get_smartcrop_offset(target_dims[0], final_dims[0], focal_point[0]);
			} else {
				offsets[1] = get_smartcrop_offset(target_dims[1], final_dims[1], focal_point[1]);
			}
			return {
				final_width  : final_dims[0],
				final_height : final_dims[1],
				offset_x     : offsets[0],
				offset_y     : offsets[1]
			};
		}
		function recrop_images( $el, use_object_fit ) {
			var crop = get_crop_data($el);
			// for browsers that support object-position and object-fit
			if( use_object_fit ) {
				var position_val = '' + crop.offset_x + 'px ' + '' + crop.offset_y + 'px';
				$el.css({
					'-o-object-position' : position_val,
					'object-position'    : position_val
				});
				$el.addClass('wpsmartcrop-rendered');
			} else {
				var img_pos = $el.position();
				var $overlay = $el.next('.wpsmartcrop-overlay');
				var $overlay_img = $overlay.find('img');
				$overlay.css({
					'width'  : $el.width()  + 'px',
					'height' : $el.height() + 'px',
					'top'    : img_pos.top  + 'px',
					'left'   : img_pos.left + 'px',
				});
				$overlay_img.css({
					'width'  : crop.final_width  + 'px',
					'height' : crop.final_height + 'px',
					'top'    : crop.offset_y     + 'px',
					'left'   : crop.offset_x     + 'px',
				});
				$overlay.addClass('wpsmartcrop-overlay-rendered');
			}
		}
		return this.each(function(){
			var $this = $(this);
			// $this needs to be an image
			if( !$this.is('img') ) {
				return;
			}
			// the image needs to have dimensions
			var natural_dims  = [
				( $this[0].naturalWidth  ) ? $this[0].naturalWidth  : $this[0].getAttribute('width'),
				( $this[0].naturalHeight ) ? $this[0].naturalHeight : $this[0].getAttribute('height')
			];
			if( natural_dims[0] == 0 || natural_dims[1] == 0 ) {
				return;
			}
			// we'll need those for cropping
			$this.data( 'wpsmartcrop-natural-dims', natural_dims );
			// kill any existing overlay
			$this.next('wpsmartcrop-overlay').remove();
			// set the focus if we don't have one... if all else fails, make the focus the center
			if( options['focal_point'] ) {
				$this.data('smartcrop-focus', options['focal_point'] );
			} else {
				if( !$this.data('smartcrop-focus') ) {
					$this.data('smartcrop-focus', [50, 50] );
				}
			}
			// decide whether the browser supports objectFit, or just force one mode in options
			var use_object_fit = true;
			if( options['compatibility'] != 'new' ) {
				if( ( options['compatibility'] == 'old' ) || !browser_supports_object_fit ) {
					use_object_fit = false;
					var $clone = $this.clone().removeClass('wpsmartcrop-image').removeAttr('data-smartcrop-focus');
					var $image_overlay = $('<div></div>').addClass('wpsmartcrop-overlay').append($clone);
					$image_overlay.insertAfter($this);
				}
			}
			recrop_images( $this, use_object_fit );
			var resizer_frame_request = false;
			$(window).resize(function() {
				cancelFrame( resizer_frame_request );
				resizer_frame_request = requestFrame(function() {
					recrop_images( $this, use_object_fit );
				});
			});
			$(window).on('load', function() {
				recrop_images( $this, use_object_fit );
			});
			$this.on('wpsmartcrop-redraw', function() {
				recrop_images( $this, use_object_fit );
			});
		});
	}});
}(jQuery));

// initialize for wp-smartcrop wordpress plugin
jQuery(document).ready(function($) {
	$('img.wpsmartcrop-image').wpsmartcrop();
});

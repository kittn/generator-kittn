jQuery(document).ready(function($) {
	var browser_supports_object_fit = (function() { // immediately invoked
		// HACK -- CURRENT iOS SAFARI AND CHROME HAVE RENDERING ISSUES WITH OBJECTFIT
		var iOS = /iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream;
		if( iOS ) {
			return false;
		}
		// END HACK
		var div = document.createElement("div");
		if( "objectFit" in div.style && "objectPosition" in div.style ) {
			return true;
		}
		if( "OobjectFit" in div.style && "OobjectPosition" in div.style ) {
			return true;
		}
		return false;
	})();

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
	function recrop_images( $el ) {
		var crop = get_crop_data($el);
		// for browsers that support object-position and object-fit
		if( browser_supports_object_fit ) {
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
	$('img.wpsmartcrop-image').each(function() {
		var $this = $(this);
		$this.next('wpsmartcrop-overlay').remove();
		var natural_dims  = [
			( $this[0].naturalWidth  ) ? $this[0].naturalWidth  : $this[0].getAttribute('width'),
			( $this[0].naturalHeight ) ? $this[0].naturalHeight : $this[0].getAttribute('height')
		];
		$this.data( 'wpsmartcrop-natural-dims', natural_dims );
		if( !browser_supports_object_fit ) {
			var $clone = $this.clone().removeClass('wpsmartcrop-image').removeAttr('data-smartcrop-focus');
			var $image_overlay = $('<div></div>').addClass('wpsmartcrop-overlay').append($clone);
			$image_overlay.insertAfter($this);
		}
		recrop_images( $this );
		var resizer_timeout = false;
		$(window).resize(function() {
			clearTimeout( resizer_timeout );
			resizer_timeout = setTimeout(function() {
				recrop_images( $this );
			}, 50);
		});
	});
});

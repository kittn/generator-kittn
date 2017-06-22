(function( $ ) {
	var position_image_overlay = function( $image, $overlay ) {
		var image_pos = $image.position();
		$overlay.css({
			position : 'absolute',
			opacity  : '0.4',
			top      : image_pos.top,
			left     : image_pos.left,
			width    : $image.width()+'px',
			height   : $image.height()+'px',
		});

		var gnomon_width  = parseInt( $('.wpsmartcrop_image_focus_left').val() ) + '%';
		var gnomon_height = parseInt( $('.wpsmartcrop_image_focus_top').val() ) + '%';
		$overlay.find('.wpsmartcrop_image_gnomon_left').width( gnomon_width  );
		$overlay.find('.wpsmartcrop_image_gnomon_top' ).height( gnomon_height );

		if( !$('.wpsmartcrop_enabled').is(':checked') ) {
			$overlay.hide();
			$image.parent().removeClass('wpsmartcrop_strip_pseudos');
		} else {
			$overlay.show();
			$image.parent().addClass('wpsmartcrop_strip_pseudos');
		}
	};

	var load_overlay = function( $image ) {
		var $gnomon_left = $('<div></div>').addClass('wpsmartcrop_image_gnomon_left').width(0).height('100%').css({
			'position'      : 'absolute',
			'top'           : 0,
			'left'          : 0,
			'margin'        : 0,
			'padding'       : 0,
			'box-sizing'    : 'border-box',
			'border-right'  : '1px solid #f00',
		});
		var $gnomon_top  = $('<div></div>').addClass('wpsmartcrop_image_gnomon_top').width('100%').height(0).css({
			'position'      : 'absolute',
			'top'           : 0,
			'left'          : 0,
			'margin'        : 0,
			'padding'       : 0,
			'box-sizing'    : 'border-box',
			'border-bottom' : '1px solid #f00',
		});
		$('.wpsmartcrop_image_overlay').remove();
		var $overlay = $('<div></div>').addClass('wpsmartcrop_image_overlay').append( $gnomon_left , $gnomon_top ).insertAfter($image);
		$overlay.css({
			cursor: 'pointer'
		});
		$(window).resize(function() {
			clearTimeout( window.wpsmartcrop_image_overlay_resize_timeout );
			window.wpsmartcrop_image_overlay_resize_timeout = setTimeout( function() {
				position_image_overlay( $image, $overlay );
			}, 50 );
		});
		position_image_overlay( $image, $overlay );

		$('body').on('click', '.wpsmartcrop_image_overlay', function(e) {
			console.log('clicked');
			var $this = $(this);
			var offset = $this.offset();
			var pos_x = e.pageX - offset.left;
			var pos_y = e.pageY - offset.top;
			var left  = pos_x / $this.width() * 100;
			var top   = pos_y / $this.height() * 100;
			$('.wpsmartcrop_image_focus_left').val( left ).change();
			$('.wpsmartcrop_image_focus_top' ).val( top  ).change();
			position_image_overlay( $image, $overlay );
		});

		$('.wpsmartcrop_enabled').change(function() {
			position_image_overlay( $image, $overlay );
		});
	};

	var $image = $('.media-frame-content .attachment-details .thumbnail img');
	if( $image.prop('complete') ) {
		load_overlay( $image );
	} else {
		$image.load(function() {
			load_overlay( $image );
		});
	}

})( jQuery );
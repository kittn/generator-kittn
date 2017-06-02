jQuery(document).ready(function($){
	if(isDebug())
		$(document).trigger('debug-this', debugThis);
});
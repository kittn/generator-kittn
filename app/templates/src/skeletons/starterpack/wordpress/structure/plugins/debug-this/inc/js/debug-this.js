var isDebug = function() {
	return (typeof debugThis !== undefined) ? debugThis.mode : false;
};

var getDebugMode = function(){
	return isDebug() ? debugThis.mode : false;
}
/**
* A normal ColdBox Event Handler
*/
component{

	property name="geoipService" inject="id:geoipService@geoip";
	
	function index(event,rc,prc){
		var o=geoipService.getCountryObject("128.101.101.101");
		writeDump(o);
		abort;
	}

}
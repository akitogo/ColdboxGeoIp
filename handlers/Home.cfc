/**
* A normal ColdBox Event Handler
*/
component{

	property name="geoipService" inject="id:geoipService@geoip";
	
	function index(event,rc,prc){
		var o=geoipService.getCountryNameByCountryId("128.101.101.101","de");

		writeDump(o);
		abort;
		event.setView( "home/index" );
	}

}
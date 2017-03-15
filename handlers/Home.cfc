/**
* A normal ColdBox Event Handler
*/
component{

	property name="geoipCountry" inject="id:geoipCountry@geoip";
	property name="geoipCity" inject="id:geoipCity@geoip";
	
	function index(event,rc,prc){
	    var country=geoipCountry.getCountryIsoCode("128.101.101.101");
	    writeDump(country);
	
	    var country=geoipCountry.getCountryName("128.101.101.101");
	    writeDump(country);
	
	    var country=geoipCountry.getCountryNameByCountryId("128.101.101.101","de");
	    writeDump(country);
	
	    var country=geoipCountry.getCountryAsjson("128.101.101.101");
	    writeDump(country);
	
	    var country=geoipCountry.getCountryObject("128.101.101.101");
	    writeDump(country);

	    var city=geoipCity.getCityName("128.101.101.101");
	    writeDump(city);
	
	    var city=geoipCity.getCityNameByCountryId("128.101.101.101","de");
	    writeDump(city);
	
	    var city=geoipCity.getLatitude("128.101.101.101");
	    writeDump(city);

	    var city=geoipCity.getLongitude("128.101.101.101");
	    writeDump(city);

	    var city=geoipCity.getCityAsjson("128.101.101.101");
	    writeDump(city);

	    var city=geoipCity.getCityObject("128.101.101.101");
	    writeDump(city);
	    
		abort;
	}

}
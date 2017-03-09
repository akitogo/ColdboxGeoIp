# ColdboxGeoIp

Submit the IP and get back the originating country. Works with a local, free database

	property name="geoipService" inject="id:geoipService@geoip";
	
	function index(event,rc,prc){
		var country=geoipService.getCountryIsoCode("128.101.101.101");
		writeDump(country);
    
		var country=geoipService.getCountryName("128.101.101.101");
		writeDump(country);
    
		var country=geoipService.getCountryNameByCountryId("128.101.101.101","de");
		writeDump(country);

		var country=geoipService.getCountryAsjson("128.101.101.101");
		writeDump(country);
    
		var country=geoipService.getCountryObject("128.101.101.101");
		writeDump(country);
    
    abort;
	}

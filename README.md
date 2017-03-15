# ColdboxGeoIp

Submit the IP and get back the originating country. Works with a local, free database

Implements https://github.com/maxmind/GeoIP2-java for Coldfusion as Coldbox module

Get updated database from: http://dev.maxmind.com/geoip/geoip2/geolite2/


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
	
## Todo

- update mechanism for database
- implement city database as well
- error handling and testing

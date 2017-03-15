# ColdboxGeoIp

Submit the IP and get back the originating country. Works with a local, free database

Implements https://github.com/maxmind/GeoIP2-java for Coldfusion as Coldbox module

Get updated database from: http://dev.maxmind.com/geoip/geoip2/geolite2/


	property name="geoipService" inject="id:geoipService@geoip";
	
	function index(event,rc,prc){
		// COUNTRY
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

		// CITY
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
	
## Versions
1.1 added support for city database

1.0 initial commit

## Todo

- update mechanism for database
- error handling and testing

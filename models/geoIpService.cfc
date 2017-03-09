component {
	property name="javaLoader"		inject="loader@cbjavaloader";
	property name="databasefile"	inject="coldbox:setting:databasefile@geoip";

	/**
	 *
	 *
	 */
	variables.DatabaseReader ={};
	
	public geoIpService function init() {
		return this;
	}

	/**
	 *
	 *
	 */
	void function onDiComplete() {
		var myFile = createObject( 'java', 'java.io.File' );
		myFile.init(databasefile);
		
		var CHMCache = javaLoader.create( "com.maxmind.db.CHMCache").init();
		
		//variables.DatabaseReader = javaLoader.create( "com.maxmind.geoip2.DatabaseReader$Builder" ).init(myFile).build();
		variables.DatabaseReader = javaLoader.create( "com.maxmind.geoip2.DatabaseReader$Builder" ).init(myFile).withCache(CHMCache).build();
	}

	
	string function getCountryIsoCode(ipAsString) {
		return getCountryObject(ipAsString).getIsoCode();
	}

	string function getCountryName(ipAsString) {
		return getCountryObject(ipAsString).getName();
	}

	string function getCountryNameByCountryId(ipAsString,countryId) {
		return getCountryObject(ipAsString).getNames()[countryId];
	}	

	string function getCountryAsjson(ipAsString) {
		return getCountryObject(ipAsString).toJson();
	}
			
	any function getCountryObject(ipAsString) {
		return DatabaseReader.country(getInet4Address(ipAsString) ).getCountry();
	}

	any function getInet4Address(ipAsString) {
		var inet_address = CreateObject("java", "java.net.InetAddress");
		return inet_address.getByName(ipAsString);
	}			
}


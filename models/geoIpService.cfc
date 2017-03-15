component accessors="true" singleton {
	property name="javaLoader"		inject="loader@cbjavaloader";


	/**
	 *
	 *
	 */
	
	public geoIpService function init() {
		return this;
	}

	
	/**
	 * returns a database reader
	 * 
	 */	
	any function getDatabaseReader(pathToDb) {
		var myFile = createObject( 'java', 'java.io.File' );
		myFile.init(pathToDb);
		
		// sets up cached reader
		var CHMCache = javaLoader.create( "com.maxmind.db.CHMCache").init();
		return javaLoader.create( "com.maxmind.geoip2.DatabaseReader$Builder" ).init(myFile).withCache(CHMCache).build();

		// for non cached version use this
		//variables.CountryDatabaseReader = javaLoader.create( "com.maxmind.geoip2.DatabaseReader$Builder" ).init(myFile).build();
	}
	
	/**
	 * returns Java Inet4Address
	 * 
	 */	
	any function getInet4Address(ipAsString) {
		var inet_address = CreateObject("java", "java.net.InetAddress");
		return inet_address.getByName(ipAsString);
	}			
}


component accessors="true" singleton {
	property name="javaLoader"		inject="loader@cbjavaloader";
	property name="databasefile"	inject="coldbox:setting:databasefile@geoip";

	property name="DatabaseReader";

	/**
	 *
	 *
	 */
	
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
		
		// sets up cached reader
		var CHMCache = javaLoader.create( "com.maxmind.db.CHMCache").init();
		setDatabaseReader (javaLoader.create( "com.maxmind.geoip2.DatabaseReader$Builder" ).init(myFile).withCache(CHMCache).build());
		
		// for non cached version use this
		//variables.DatabaseReader = javaLoader.create( "com.maxmind.geoip2.DatabaseReader$Builder" ).init(myFile).build();
	}

	/**
	 * returns country as ISO code string
	 * 
	 */	
	string function getCountryIsoCode(ipAsString) {
		return getCountryObject(ipAsString).getIsoCode();
	}

	/**
	 * returns country name as string in english
	 * 
	 */	
	string function getCountryName(ipAsString) {
		return getCountryObject(ipAsString).getName();
	}

	/**
	 * returns country name as string 
	 * supported countryId's are: de,pt-BR,fr,en,ru,zh-CN,es,ja
	 * 
	 */	
	string function getCountryNameByCountryId(ipAsString,countryId) {
		return getCountryObject(ipAsString).getNames()[countryId];
	}	
	
	/**
	 * returns full response as json
	 * 
	 */	
	string function getCountryAsjson(ipAsString) {
		return getCountryObject(ipAsString).toJson();
	}

	/**
	 * returns java object
	 * com.maxmind.geoip2.record.Country
	 * java.lang.String	getIsoCode()	
	 * java.lang.Integer	getConfidence()	
	 * java.lang.String	getName()	
	 * java.util.Map	getNames()	
	 * java.lang.Integer	getGeoNameId()	
	 * java.lang.String	toString()	
	 * java.lang.String	toJson()	java.io.IOException
	 * 
	 */				
	any function getCountryObject(ipAsString) {
		return getDatabaseReader().country(getInet4Address(ipAsString) ).getCountry();
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


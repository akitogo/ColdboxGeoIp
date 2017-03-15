component accessors="true" extends="geoIpService" singleton {
	property name="javaLoader"		inject="loader@cbjavaloader";
	property name="cityDatabase"	inject="coldbox:setting:cityDatabase@geoip";

	property name="CityDatabaseReader";

	/**
	 *
	 *
	 */
	
	public geoIpCity function init() {
		return this;
	}

	/**
	 *
	 *
	 */
	void function onDiComplete() {
		setCityDatabaseReader(getDatabaseReader(cityDatabase));
	}
	
	/**
	 * should return confidence, currently returns NULL
	 * needs more checking
	 */	
/*	 
	any function getConfidence(ipAsString) {
		return getCityObject(ipAsString).getConfidence();
	}
*/

	/**
	 * returns Latitude
	 * 
	 */	
	numeric function getLatitude(ipAsString) {
		return getCityObject(ipAsString).getLocation().getLatitude();
	}

	/**
	 * returns Longitude
	 * 
	 */	
	numeric function getLongitude(ipAsString) {
		return getCityObject(ipAsString).getLocation().getLongitude();
	}


	/**
	 * returns timezone as fulltext string
	 * 
	 */	
	string function getTimeZone(ipAsString) {
		return getCityObject(ipAsString).getLocation().getTimeZone();
	}
		

	/**
	 * returns city name as string in english
	 * 
	 */	
	string function getCityName(ipAsString) {
		return getCityObject(ipAsString).getCity().getName();
	}

	/**
	 * returns city name as string 
	 * supported countryId's are: de,pt-BR,fr,en,ru,zh-CN,es,ja
	 * 
	 */	
	string function getCityNameByCountryId(ipAsString,countryId) {
		return getCityObject(ipAsString).getCity().getNames()[countryId];
	}	
	
	/**
	 * returns full response as json
	 * 
	 */	
	string function getCityAsjson(ipAsString) {
		return getCityObject(ipAsString).getCity().toJson();
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
	any function getCityObject(ipAsString) {
		return getCityDatabaseReader().city(getInet4Address(ipAsString) );
	}
	
}


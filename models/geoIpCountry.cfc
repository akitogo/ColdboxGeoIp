component accessors="true" extends="geoIpService" singleton {
	property name="javaLoader"		inject="loader@cbjavaloader";
	property name="countryDatabase"	inject="coldbox:setting:countryDatabase@geoip";

	property name="CountryDatabaseReader";

	/**
	 *
	 *
	 */
	
	public geoIpCountry function init() {
		return this;
	}

	/**
	 *
	 *
	 */
	void function onDiComplete() {
		setCountryDatabaseReader(getDatabaseReader(countryDatabase));
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
		return getCountryDatabaseReader().country(getInet4Address(ipAsString) ).getCountry();
	}
	
}


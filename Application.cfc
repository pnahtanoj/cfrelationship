component extends="framework.one" {

    THIS.datasource = "xmdlocaldevdb_admin";
    THIS.name = "TESTING";
    THIS.environmentName = "TESTING";
    THIS.di1location = "/xmdtransroot/model";

    THIS.ormenabled = "true";
    THIS.ormsettings.cfclocation = "/xmdtransroot/model/beans";
    THIS.ormsettings.logSQL = true;
    THIS.ormSettings.dbCreate = "none";
    THIS.ormsettings.eventhandling = true;
    THIS.ormsettings.flushAtRequestEnd = false;

    variables.framework.environments = {
        development_local = { 
            reloadApplicationOnEveryRequest = "true",
            trace = "true" }
    };

    function setupApplication() {
        var bf = new framework.ioc( "#THIS.di1location#" );
        setBeanFactory( bf );
	}    

    function setupRequest() {
    }

    public function getEnvironment() {
        return 'development_local';
    }      
}
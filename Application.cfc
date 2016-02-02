component {

    THIS.datasource = "xmdlocaldevdb_admin";
    THIS.name = "TESTING"; // MUST BE SAME AS TOP LEVE APP
    THIS.environmentName = "TESTING";

    THIS.ormenabled = "true";
    THIS.ormsettings.cfclocation = "/xmdtransroot/model/beans";
    THIS.ormsettings.logSQL = "true";
    THIS.ormSettings.dbCreate = "none";
    THIS.ormsettings.eventhandling = true;
    THIS.ormsettings.flushAtRequestEnd = false;
}
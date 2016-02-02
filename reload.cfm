<cfscript>
ormReload();
</cfscript>

<cfquery name='clearEm' datasource="xmdlocaldevdb_admin">
TRUNCATE Parent
</cfquery>
<cfquery name='clearEm' datasource="xmdlocaldevdb_admin">
TRUNCATE Child
</cfquery>
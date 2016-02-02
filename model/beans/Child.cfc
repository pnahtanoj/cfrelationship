component persistent="true" accessors="true" table="Child" {
    property name="id" fieldtype="id" column="ChildID" generator="identity";

    property
        name="Parent" 
        fieldtype="many-to-one" 
        cfc="Parent" 
        fkcolumn="ParentID";

    public function init(){
        return this;
    }
    
    public boolean function isValid() {
        return true;
    }
    public void function save() {
    	entitySave( this );
    }
}
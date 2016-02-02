component persistent="true" accessors="true" table="Parent" {
    property name="id" fieldtype="id" column="ParentID" generator="identity";
    property name="Title" type="string";

    property 
        name="Childs" 
        type="array" 
        fieldtype="one-to-many" 
        cfc="Child" 
        singularname="Child" 
        fkcolumn="ParentID"
        inverse="true";

    public function init(){
        return this;
    }

    public void function removeChildren(){
        var children = this.getChilds();
        var len = ArrayLen( children );
        for ( var i = len; i > 0; i-- ) {
            this.removeChild( children[i] );
        }
    }

    // convenience //
    public void function addChild( child ) {
        if ( !hasChild() ) {
            variables.Childs = [];
        }
        ArrayAppend( variables.Childs, child );
        arguments.child.setParent( this );
    }

    public boolean function isValid() {
        return true;
    }

    public void function saveChildren() {
        if (!this.hasChild())
            return;

        for( child in this.getChilds() ) { 
            child.save();
        }
    }

    public void function save() {
        entitySave(this);
        this.saveChildren();
    }
}


component persistent="true" accessors="true" table="Parent" {
    
    property name="datetimeService";

    property name="id" fieldtype="id" column="ParentID" generator="identity";
    property name="Title" type="string";

    property 
        name="Childs" 
        type="array" 
        fieldtype="one-to-many" 
        cfc="Child" 
        singularname="Child" 
        fkcolumn="ParentID"
        cascade="all-delete-orphan"
        inverse="true";

    public function init(){
        variables.Childs = [];
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
        ArrayAppend( variables.Childs, child );
        arguments.child.setParent( this );
    }

    public void function addChildren( children ) {
        for (child in children) {
            this.addChild(child);
        }
    }

    public void function setChildren( children ) {
        this.removeChildren();
        this.addChildren( children );
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


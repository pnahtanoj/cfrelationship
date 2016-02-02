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
        // if( !IsNull( this.getChilds() ) )
        //     ArrayClear( this.getChilds() );

        var children = this.getChilds();
        var len = ArrayLen( children );
        for ( var i = len; i > 0; i-- ) {
            // children[i].removeParent(this);
            this.removeChild( children[i] );
            // entityDelete( children[i] );
            // ArrayDelete( variables.childs, children[i] );            
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
        // if ( !hasChild() )
        return true;
    }

    public void function saveChildren() {
        if (!this.hasChild())
            return;

        for( child in this.getChilds() ) { 
            // writeDump(child);
            // entitySave(child);
            child.save();
        }
    }

    public void function save() {
        entitySave(this);
        this.saveChildren();
        // if (this.getId() == 0)

    }
}


<cfscript>
ormReload();

create();
showParent();
update();
showParent();

function showParent() {
	var parent = entityLoad('Parent', 1, true);
	writeDump(parent);
}
function create() {

	transaction {
		try {
			var parent = new xmdtransroot.model.beans.Parent();
			parent.setTitle('Title One');
			 
			var child = new xmdtransroot.model.beans.Child();
			var child2 = new xmdtransroot.model.beans.Child();

			// parent.setChilds( [child, child2] );
			parent.addChild(child);
			parent.addChild(child2);

			if ( !parent.isValid() )
				throw(type="validation", message="FAILED PARENT VALIDITY");
			if ( !child.isValid() || !child2.isValid() ) 
				throw(type="validation", message="FAILED CHILD VALIDITY");

			parent.save();
		} 
		catch(any e) {
			transaction action='rollback';
			rethrow;
		}
	} 
}

function update() {
	transaction {
		try {
			var parent = entityLoad('Parent', 1, true);
			parent.setTitle('Title One - MOD');
			parent.removeChildren();
entitySave(parent);
ormFlush();
writeDump(parent);
			var child = new xmdtransroot.model.beans.Child();
			var child2 = new xmdtransroot.model.beans.Child();

			// // parent.setChilds( [child, child2] );
			parent.addChild(child);
			parent.addChild(child2);

			if ( !parent.isValid() )
				throw(type="validation", message="FAILED PARENT VALIDITY");
			if ( !child.isValid() || !child2.isValid() ) 
				throw(type="validation", message="FAILED CHILD VALIDITY");

			parent.save();
		} 
		catch( any e ) {
			transaction action='rollback';
			rethrow;
		}
	}
}

</cfscript>

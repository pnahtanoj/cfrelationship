component accessors="true" {

	property parentService;

    public function init(fw) {
        variables.fw = fw;
    }

    public function default( struct rc ) {
    	rc.test = 'you made it';
	}

	public function create( ) {
		transaction {
			try {
				var parent = variables.parentService.newParent();
				parent.setTitle('Title One');
				 
				// var child = new xmdtransroot.model.beans.Child();
				// var child2 = new xmdtransroot.model.beans.Child();

				// // // parent.setChildren([child, child2]);
				// parent.addChildren([child, child2]);
				// // // parent.addChild(child);
				// // // parent.addChild(child2);

				// if ( !parent.isValid() )
				// 	throw(type="validation", message="FAILED PARENT VALIDITY");
				// if ( !child.isValid() || !child2.isValid() ) 
				// 	throw(type="validation", message="FAILED CHILD VALIDITY");

				parent.save();
				// // rc.parent = parent;
			} 
			catch(any e) {
				transaction action='rollback';
				rethrow;
			}
		} 

		rc.parent = parent;
	}

	function update() {
		transaction {
			try {
				var parent = variables.parentService.getParent( rc.parentId );
				// var parent = entityLoad('Parent', rc.parentId, true);
				parent.setTitle('Title One - MOD');
				// parent.removeChildren();

				var child = new xmdtransroot.model.beans.Child();
				var child2 = new xmdtransroot.model.beans.Child();

				parent.setChildren([child, child2]);
				// parent.addChild(child);
				// parent.addChild(child2);

				if ( !parent.isValid() )
					throw(type="validation", message="FAILED PARENT VALIDITY");
				if ( !child.isValid() || !child2.isValid() ) 
					throw(type="validation", message="FAILED CHILD VALIDITY");

				parent.save();
				// rc.parent = parent;
			} 
			catch( any e ) {
				transaction action='rollback';
				rethrow;
			}
		}

		rc.parent = parent;
	}
}
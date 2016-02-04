component accessors="true" {
    
    property beanFactory;

    public function init( any beanFactory ) {
		variables.beanFactory = beanFactory;
        return this;
    }

    public function newParent() {
    	return variables.beanFactory.getBean('ParentBean');
		// return new xmdtransroot.model.beans.Parent();
		// return entityNew('Parent');
    }

    public function getParent( required numeric id ) {
    	return entityLoad('Parent', id, true);
    }
}
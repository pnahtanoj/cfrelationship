component accessors="true" {

    public function init(fw) {
        variables.fw = fw;
    }

    public function default( struct rc ) {
    	rc.test = 'You made it';
    }
}
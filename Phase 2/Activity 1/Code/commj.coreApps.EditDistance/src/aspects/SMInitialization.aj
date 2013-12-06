package aspects;

import org.apache.log4j.Logger;
import interactive.Server;


public aspect SMInitialization extends baseaspects.communication.Initialization {
	Logger logger = Logger.getLogger(SMInitialization.class);

	@Override
	public void defineMappng() {
		addMapping(Server.class, Server_SM.class);
		
	}
}
 
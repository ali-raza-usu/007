package aspects;

import org.apache.log4j.Logger;
import interactive.Client;

public aspect SMInitialization extends baseaspects.communication.Initialization {
	Logger logger = Logger.getLogger(SMInitialization.class);

	@Override
	public void defineMappng() {
		addMapping(Client.class, Client_SM.class);
	}
}
 
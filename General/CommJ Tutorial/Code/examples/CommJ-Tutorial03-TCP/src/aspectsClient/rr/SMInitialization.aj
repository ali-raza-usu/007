package aspectsClient.rr;
import org.apache.log4j.Logger;

public aspect SMInitialization extends baseaspects.communication.Initialization {
	Logger logger = Logger.getLogger(SMInitialization.class);

	@Override
	public void defineMappng() {
	}
}
 
package aspectsServer.ms;

import universe.Conversation;
import universe.Protocol;
import universe.Role;
import utilities.statemachine.StateMachine;

public class Server_SM extends StateMachine {
	static {
		//register(Server_SM.class, new Protocol("TimeLogger"),new Role("Server"));
		register(Server_SM.class, new Protocol("PerformanaceMeasure"),new Role("Server"));
	}

	public Server_SM(Conversation con) {
		super(con);
	}

	@Override
	public void buildTransitions() {
		addTransition("Initial", 'R', "TranslationRequestMessage","ServerRcvdRequest");
		addTransition("ServerRcvdRequest", 'S', "TranslationResponseMessage","ServerSentResponse");

	}

	public static Protocol getProtocol() {
		return getProtocolRole().getProtocol();
	}

	public static Role getRole() {
		return getProtocolRole().getRole();
	}
}

package aspects;

import universe.Conversation;
import universe.Protocol;
import universe.Role;
import utilities.statemachine.StateMachine;

public class Server_SM extends StateMachine {
	static {
		register(Server_SM.class, new Protocol("Performancer"), new Role("Server"));
	}

	public Server_SM(Conversation con) {
		super(con);
	}

	@Override
	public void buildTransitions() {
		addTransition("Initial", 'R', "TranslationMessage","ServerReceiveRequest");
		addTransition("ServerReceiveRequest", 'S', "TranslationMessage","ServerSendRequest");
		
		
		addTransition("Initial", 'R', "FileTransferRequest","ServerReceiveRequest");
		addTransition("ServerReceiveRequest", 'S', "FileTransferResponse","FileTransferRspSent");
		addTransition("FileTransferRspSent", 'R', "FileTransferAck","FileTransferAckreceived");

		
	}

	public static Protocol getProtocol() {
		return getProtocolRole().getProtocol();
	}

	public static Role getRole() {
		return getProtocolRole().getRole();
	}
}
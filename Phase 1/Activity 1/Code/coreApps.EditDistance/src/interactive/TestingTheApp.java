package interactive;

public class TestingTheApp {
	public static void main(String args[])
	{
	Server serv=new Server();
	serv.start();
	try {
		Thread.sleep(500);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	};
	Client cli=new Client();
	cli.start();
	}
}

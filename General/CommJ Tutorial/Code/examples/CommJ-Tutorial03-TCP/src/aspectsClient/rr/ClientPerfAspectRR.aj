package aspectsClient.rr;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import joinpoints.communication.RequestReplyConversationJP;
import org.apache.log4j.Logger;
import baseaspects.communication.RRConversationAspect;
import utilities.Encoder;
import utilities.Message;

public aspect ClientPerfAspectRR  extends RRConversationAspect{
	String sendTime = null;
	String endTime= null; 
	long startT=0;
	long endT=0;
	long performanceT=0;

	Object around(RequestReplyConversationJP _requestReplyJp): ConversationBegin(_requestReplyJp){
	    startT=System.nanoTime();
     	return proceed(_requestReplyJp);
	}
	
	Object around(RequestReplyConversationJP _requestReplyJp): ConversationEnd(_requestReplyJp){	
		endT=System.nanoTime();
		performanceT=endT-startT;
     	String performanceString = "Start Time: "+startT + ", End Time: "+endT + "\nPerformance for CLIENT is: "+ performanceT + " nano seconds " + "(" + (float)((float)performanceT/(float)1000000000) + " sec)";
		System.out.println(performanceString);
		return proceed(_requestReplyJp);
	}
	
	public static String getTargetClass() {
		StackTraceElement[] elements = Thread.currentThread().getStackTrace();
		String[] classes = elements[elements.length - 1].getClassName().split("\\.");
		return classes[classes.length - 1];
	}
}
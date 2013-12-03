package aspectsServer.ms;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import joinpoints.communication.MultistepConversationJP;
import org.apache.log4j.Logger;
import org.aspectj.lang.annotation.Before;

import utilities.Encoder;
import utilities.Message;
import baseaspects.communication.MultistepConversationAspect;

public aspect ServerPerfAspectMS extends MultistepConversationAspect {

	private Logger logger = Logger.getLogger(ServerPerfAspectMS.class);
	static String timingInfo = "";
	String sendTime = null;
	String endTime= null; 
	long startT=0;
	long endT=0;
	long performanceT=0;

	before(MultistepConversationJP _multiStepJP): ConversationBegin(_multiStepJP){
		startT=System.nanoTime();
		System.out.println("he time from aspect"+startT);
     	Message msg =  (Message)Encoder.decode(_multiStepJP.getBytes());
 	}

	after(MultistepConversationJP _multiStepJP): ConversationEnd(_multiStepJP){
		endT=System.nanoTime();
 		System.out.println(endT-startT);
	}

	private String getCurrentTime(){
		DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		Date date = new Date();
		return dateFormat.format(date);
	}
	
	public static String getTargetClass() {
		StackTraceElement[] elements = Thread.currentThread().getStackTrace();
		String[] classes = elements[elements.length - 1].getClassName().split("\\.");
		return classes[classes.length - 1];
	}

}

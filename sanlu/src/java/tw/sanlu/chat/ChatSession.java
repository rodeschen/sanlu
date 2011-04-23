package tw.sanlu.chat;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.servlet.http.HttpServletRequest;

import org.eclipse.jetty.util.log.Log;
import org.eclipse.jetty.websocket.WebSocket;

public class ChatSession implements WebSocket {

	// 使用 Set 記錄已建立的 chat session
	private final static Set<ChatSession> mSessions = new CopyOnWriteArraySet<ChatSession>();
	private final static SimpleDateFormat FORMAT = new SimpleDateFormat("H:m");

	// Outbound 提供所有與 client 端通訊用的方法，例如 sendMessage, disconnect
	Outbound mOutbound;
	
	private HttpServletRequest request;
	
	

	/**
	 * 當連線建立完成後，Jetty Server 會建立好 Outbound，並呼叫此方法。
	 */
	public void onConnect(Outbound outbound) {
		mOutbound = outbound;
		mSessions.add(this);
	}

	public void onMessage(byte frame, byte[] data, int offset, int length) {
	}

	/**
	 * data 是使用者傳來的訊息，由 [nickname]-@-#-@-[message] 的型式組成。
	 */
	public void onMessage(byte frame, String data) {
//		int sepLen = "-@-#-@-".length();
//		int sep = data.indexOf("-@-#-@-");
//		if (sep == -1) {
//			return;
//		}
//
//		String message = String.format(
//				"@%s %s  <span class=\"time\">%s</span>",
//				data.substring(0, sep), data.substring(sep + sepLen),
//				FORMAT.format(new Date()));

		for (ChatSession session : mSessions) {
			try {
				session.mOutbound.sendMessage(frame, "message");
			} catch (IOException e) {
				Log.warn(e);
			}
		}
	}

	public void onDisconnect() {
		mSessions.remove(this);
	}

	public void onFragment(boolean more, byte opcode, byte[] data, int offset,
			int length) {
		// TODO Auto-generated method stub

	}

}
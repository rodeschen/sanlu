package tw.sanlu.servlet;

import javax.servlet.http.HttpServletRequest;

import org.eclipse.jetty.websocket.WebSocket;
import org.eclipse.jetty.websocket.WebSocketServlet;

import tw.sanlu.chat.ChatSession;

/**
 * Web Socket Servlet
 * 
 * @author rick
 * 
 */
public class WebSocketChatServlet extends WebSocketServlet {
	
	public WebSocket doWebSocketConnect(HttpServletRequest request,
			String protocol) {
		return new ChatSession();
	}
}

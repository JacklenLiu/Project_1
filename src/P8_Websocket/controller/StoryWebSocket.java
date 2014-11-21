package P8_Websocket.controller;


import java.io.*; 
import java.util.*; 

import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;

import P8_Websocket.model.Sticker;
import P8_Websocket.model.StickerDecoder;
import P8_Websocket.model.StickerEncoder;


@ServerEndpoint(
	    value = "/story/notifications", 
	    encoders = {StickerEncoder.class}, 
	    decoders = {StickerDecoder.class}) 
	 


public class StoryWebSocket {
	
	private static final List<Sticker> stickers = Collections.synchronizedList(new LinkedList<Sticker>()); 
	private static final Set<Session> sessions = Collections.synchronizedSet(new HashSet<Session>()); 
	   
	
	@OnMessage
	   public void onMessage(Session session, Sticker sticker) { 
	      stickers.add(sticker); 
	      for (Session openSession : sessions) { 
	         try { 
	            openSession.getBasicRemote().sendObject(sticker); //廣播出去
	         } catch (IOException | EncodeException ex) { 
	            sessions.remove(openSession); 
	         } 
	      } 
	   } 
	   
	
	 @OnOpen
	   public void onOpen(Session session) throws IOException, EncodeException { 
	      sessions.add(session); 
	      for (Sticker sticker : stickers) { 
	         session.getBasicRemote().sendObject(sticker); 
	      } 
	    } 

	   @OnClose
	   public void onClose(Session session) throws IOException, EncodeException { 
	      sessions.remove(session); 
	   } 

}

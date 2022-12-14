package kr.co.tomato.chat.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import kr.co.tomato.chat.model.service.ChatService;
import kr.co.tomato.member.model.vo.Member;
import kr.co.tomato.vo.Chat;


// 서버측

@ServerEndpoint(value="/server", configurator = GetHttpSessionForWebSocket.class)
public class ServerSocket
{
   
    // 연결된 웹소켓 세션과 해당 세션의 회원No도 같이 저장
    private static Map<Session, Integer> sessions = Collections.synchronizedMap(new HashMap<Session, Integer>());
    
    
    
    
    
    // 클라이언트가 웹소켓서버 접속시 (new WebSocket시) 동작
    @OnOpen
    public void onOpen(Session session, EndpointConfig config) {
        
        
        
        System.out.println("추가된 세션 = " + session);
        
        // EndpointConfig를 통해 같이 넘어온 httpSession
        HttpSession hss = (HttpSession)config.getUserProperties().get(HttpSession.class.getName());
        System.out.println("Http세션 ID = " + hss.getAttribute("member"));
        Member m = (Member)hss.getAttribute("member");
        System.out.println("Http세션 memberNo = " + m.getMemberNo());
        
        
      
        // 연결된 세션을 모아둔 Map에 세션과 http세션의 회원No 추가
        sessions.put(session, m.getMemberNo());
        
    }
    
/*    @OnError
    public void onError(Session session) {
        System.out.println("ServerSocket에서 오류 발생");
    }*/
    
    
    
    
    // 클라이언트가 webSocket.send()를 통해 메시지를 보낼시
    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
    	
        System.out.println("입력받은 메시지 = " + message);
        
        String [] inputMsg = message.split("#!@");
        System.out.println(inputMsg[0]);
        
        int receiverNo = Integer.parseInt(inputMsg[0]);
        String senderShopName = inputMsg[1];
        String senderFilePath = inputMsg[2];
        String sendMsg = inputMsg[3];
        String sendTime = inputMsg[4];
        
        
       System.out.println("전송자 MemberNo : " + sessions.get(session) + ",전송자 상점이름 : " + senderShopName + ",전송자 사진경로 : " + senderFilePath +", 받을 사람 No : " + receiverNo + ", 보낼 메시지 : " + sendMsg + ", 보낸 시간 : " + sendTime); 
        
        
        // 내가 나한테보내는거 아닐때만
        if(sessions.get(session)!=receiverNo) {
        
	        synchronized (sessions)
	        {

	            // 받는 사용자에게만 전송(나도 제외)
	            for(Session clientSession : sessions.keySet()) {
	                if(!clientSession.equals(session) && sessions.get(clientSession).equals(receiverNo)) {
	                
	             
	                    // 보낸사람상점명#!@보낸사람사진경로#!@전송할메세지 로 전송
	                    clientSession.getBasicRemote().sendText(senderShopName + "#!@" + senderFilePath + "#!@" + sendMsg + "#!@" + sendTime);  // 여기서 예외처리로 인한 throws 추가
	                }
	            }
	        	
	            // 디비에 저장하기위한 채팅내용 저장
	            // 채팅번호(자동채번), 보낸사람no, 보낸사람 상점이름, 보낸사람 프로필사진, 받는사람no, 채팅내용, 보낸시간(string)
	            Chat c = new Chat(0, sessions.get(session), senderShopName, senderFilePath, receiverNo, sendMsg, sendTime);
	            
	            
	            ChatService service = new ChatService();
	            int result = service.insertChat(c);
	            if(result < 1)
	            {
	            	System.out.println("채팅 디비저장 오류");
	            }
	            
	        }
        }
    }
    
    
    
    
    
    // 클라이언트가 접속 종료시
    @OnClose
    public void onClose(Session session) {
        // 연결된 세션을 모아둔 map에서 입력받은 session을 제거
        System.out.println("삭제할 세션 = " + session);
        System.out.println("삭제할 회원의 MemberNo = " + sessions.get(session));
        
        sessions.remove(session);
    }
    
    
    
}

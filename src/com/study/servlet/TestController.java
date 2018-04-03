package com.study.servlet;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.member.web.MemberListController;
import com.study.member.web.MemberViewController;

public class TestController extends HttpServlet{
	//url, 컨트롤러 정보를 보관할 맵 - study_uri.properties 파일에 대하여
	// <커맨드, 핸들러 인스턴스>
	private Map<String, IController> handlerMap = new HashMap<>(); //init()에서 호출 될것을 handlerMap에 전부다 담긴다.
	
	@Override
	public void init() throws ServletException {
		String configFile = getInitParameter("configFile");   //서블릿 실행할때 넘겨야할 파라미터가 있을때
		//받아오는것
		Properties prop = new Properties();
		String configFilePath = getServletContext().getRealPath(configFile);   //파일처리를 위해서 물리적인 경로를 찍어냄
		
		try(FileInputStream fis = new FileInputStream(configFilePath)) {
			prop.load(fis);
		} catch (Exception e) {
			throw new ServletException(e);
		}
		
		//여기 위까지는 아직 문자열 이니까 , 하나하나씩 읽어야한다.
		Iterator keyIter = prop.keySet().iterator();
		while(keyIter.hasNext()) {
			//키에 맞는 값을 꺼내오는 역할 
			String command = (String) keyIter.next();
			String handlerClassName = prop.getProperty(command);  //매핑할 서블릿 이름(키)을 가져온다.
			try {
				
				/*
				 * new 역할
				 * */
				// 클래스 로더는 handlerClassName는 계속 해서 문자열이지만, handlerMap.put(command, (IController) handlerClass.newInstance()) 
				//여기 Map에 대한 키 값에 대한 객체가 된다. 즉 키에 문자열이 들어가는게 아니라 Class.forname()을 실행하고 완료한 객체가 값으로 들어가는 것이다.
				Class<?> handlerClass = Class.forName(handlerClassName);
				handlerMap.put(command, (IController) handlerClass.newInstance());
			} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
				System.out.println(command + "를 로드하지 못했습니다." + e.getMessage());
			}
		} //  while
	}
	
	private static final long serialVersionUID = 1L;
	@Override
	//	1. service() 메소드에서 사용자의 요청을 받음
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//파라미터를 콜하기 전에 인코딩을 해줘야한다.
		request.setCharacterEncoding("utf-8");
		//Member member = new Member();
		//request , response
		//Request request = new Request();
		//Session session = new Session();
	// 2. 사용자 요청 분석
	// -- 파라미터로 분석하는 방법 : /member?type=list, /member?type=view
	// -- 요청 URI로 분석하는 방법 : /member/list, /member/view
		
	String uri = request.getRequestURI(); //         /study/member/memberList.do
	
	
	//URI LOG
	System.out.println(uri);
	uri = uri.substring(request.getContextPath().length());  // 					/member/memberList.do
	// ContextPath.length
	
	System.out.println(request.getContextPath());
	System.out.println(request.getContextPath().length());
	// URI LOG After substring
	System.out.println(uri);
	//    uri 는 아마도 !!!!!    /study/member/memberList.do 이렇게 되어있을 것이다.
	
	String viewPage = null;
	IController controller = null;
	
	if(handlerMap.containsKey(uri)) {
		controller = handlerMap.get(uri);  //uri(키)를 넣고 반환 시켜주는 반환 값이 IController 형으로 제네릭으로 되어있기 때문에!!! 반환형이 IController이다.
		if(controller != null) {
			viewPage = controller.process(request, response);
			
			if(viewPage != null) {
				System.out.println(uri + ", viewPage" + viewPage);
				//redirect:로 시작하는 경우
				if(viewPage.startsWith("redirect:")) {
					response.sendRedirect(request.getContextPath() + viewPage.substring(9));
				}else {
					//해당 뷰로 포워드(일반적인 경우)
					RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
					dispatcher.forward(request, response);
				}
			}
		}else {
			throw new ServletException(uri + "의 컨트롤러가 널입니다.");
		}
	}else {
	// 요청 uri가 없으므로 404 예외를 던짐
		response.sendError(response.SC_NOT_FOUND,"누구세요....?");  //response.SC_NOT_FOUND : 각 오류에 맞는 숫자가 찍힘 error 404라든지 error 500이라든지
	}
  }
}
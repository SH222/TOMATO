package kr.co.tomato.noitceMTM.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tomato.noitceMTM.model.service.NoticeMTMService;
import kr.co.tomato.noitceMTM.model.vo.NoticeMTM;
import kr.co.tomato.notice.model.service.NoticeService;
import kr.co.tomato.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeMTMAdminNew2Servlet
 */
@WebServlet(name = "NoticeMTMAdminNew2", urlPatterns = { "/noticeMTMAdminNew2" })
public class NoticeMTMAdminNew2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeMTMAdminNew2Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("utf-8");
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		NoticeMTMService service = new  NoticeMTMService();
		NoticeMTM mtm = service.AdminAnswerSearch(no);
		
		request.setAttribute("mtm", mtm);
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/notice/noticeAdmin2.jsp");
		
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

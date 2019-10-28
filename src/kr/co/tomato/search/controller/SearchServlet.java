package kr.co.tomato.search.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tomato.search.model.service.SearchService;
import kr.co.tomato.vo.Item;
import kr.co.tomato.vo.SearchPageData;


/**
 * Servlet implementation class SearchServlet
 */
@WebServlet(name = "Search", urlPatterns = { "/search" })
public class SearchServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet()
    {
        super();
        // TODO Auto-generated constructor stub
    }
    
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException
    {
        
        request.setCharacterEncoding("utf-8");
        
        String itemName = request.getParameter("itemName");
        System.out.println("searchServlet에 넘어온 값 : " + itemName);
        
        int reqPage;
        try
        {
            reqPage = Integer.parseInt(request.getParameter("reqPage"));
        }
        catch (NumberFormatException e)
        {
            reqPage = 1;
        }
        
        SearchService service = new SearchService();
        SearchPageData searchPd = service.getSearchList(reqPage, itemName);
        
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/search/searchList.jsp");
         request.setAttribute("itemName", itemName);
         request.setAttribute("searchPd", searchPd);
         rd.forward(request, response);
    }
    
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException
    {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
    
}

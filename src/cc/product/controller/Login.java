package cc.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cc.product.dao.UserDAO;

import cc.product.dao.impl.UserDAOImpl;

@WebServlet("/Login")
public class Login extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");//请求编码
		response.setContentType("text/html; charset=UTF-8");//相应编码
		
		HttpSession session=request.getSession();
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		boolean T=false;
		UserDAO u=new UserDAOImpl();
		T=u.findUser(username, password);	

		if("1".equals(username)&&T)
		{
			
			session.setAttribute("manager","管理员");
			session.setAttribute("user","管理员");
			response.sendRedirect("/Transaction/usermanage.jsp");
		}
		else if(T)
		{
			session.setAttribute("user",username);
			response.sendRedirect("/Transaction/shop.jsp");
		}
		else {
			request.setAttribute("msg","账号密码错误");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			
		}
	}

}

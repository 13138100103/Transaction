package cc.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cc.product.dao.UserDAO;
import cc.product.dao.domain.Account;
import cc.product.dao.impl.UserDAOImpl;

@WebServlet("/Register")
public class Register extends HttpServlet {

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
		String email=request.getParameter("email");
	
		Account user=new Account(username, password, email);
		boolean T=false;
		UserDAO u=new UserDAOImpl();
		T=u.checkUser(username);
		

		
		if(T)
		{
			u.saveUser(user);
			session.setAttribute("user",user);
			response.sendRedirect("/Transaction/shop.jsp");
		}
		else {
			request.setAttribute("msg","用户名已存在，请重新创建");
			request.getRequestDispatcher("/regist.jsp").forward(request, response);
			
		
		}
		
	}

}

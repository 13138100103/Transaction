package cc.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import cc.product.dao.UserDAO;

import cc.product.dao.impl.UserDAOImpl;

@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id=request.getParameter("id");
		UserDAO use=new UserDAOImpl();
		use.deleteById(id);
		response.sendRedirect("/Transaction/usermanage.jsp");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");//请求编码
		response.setContentType("text/html; charset=UTF-8");//相应编码
	}

}

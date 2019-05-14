package cc.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cc.product.dao.ProductDAO;
import cc.product.dao.impl.ProductDAOImpl;

@WebServlet("/DeleteProduct")
public class DeleteProduct extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String p_id=request.getParameter("id");
		System.out.print(p_id);
		ProductDAO pro=new ProductDAOImpl();
		pro.deletebyid(p_id);
		response.sendRedirect("/Transaction/productmanage.jsp");		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");//请求编码
		response.setContentType("text/html; charset=UTF-8");//相应编码
	}

}

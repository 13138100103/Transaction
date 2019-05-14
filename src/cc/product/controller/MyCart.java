package cc.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cc.product.dao.CartDAO;
import cc.product.dao.ProductDAO;
import cc.product.dao.domain.Product;
import cc.product.dao.impl.CartDAOImpl;
import cc.product.dao.impl.ProductDAOImpl;

@WebServlet("/MyCart")
public class MyCart extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");//请求编码
		response.setContentType("text/html; charset=UTF-8");//相应编码
		String p_id=request.getParameter("p_id");
		HttpSession session=request.getSession();
		String user=(String) session.getAttribute("user");
		CartDAO pro=new CartDAOImpl();
		Product inpro=new Product();
		ProductDAO p=new ProductDAOImpl();
		inpro=p.querybyid(p_id);
		pro.addproduct(inpro,user);
		
		
		List<Product> product=pro.querycart(user);
		
		session.setAttribute("pro",product);
		response.sendRedirect("/Transaction/mycart.jsp");
	}

}

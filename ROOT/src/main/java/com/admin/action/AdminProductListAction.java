package com.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Action;
import com.ActionForward;
import com.product.db.ProductBean;
import com.product.db.ProductDAO;

public class AdminProductListAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ProductDAO dao = new ProductDAO();		
		List<ProductBean> productList = dao.getAllProducts();
		request.setAttribute("productList", productList);
		ActionForward forward = new ActionForward();
		forward.setPath("./admin/adminProducts.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
 
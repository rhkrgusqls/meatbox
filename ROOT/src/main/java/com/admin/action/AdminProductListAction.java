// AdminProductListAction.java

package com.admin.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Action;
import com.ActionForward;
import com.product.db.ProductDAO;
import com.product.db.ProductBean;

public class AdminProductListAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    System.out.println("M: AdminProductListAction - execute() 호출");

	    ProductDAO dao = new ProductDAO();
	    List<ProductBean> productList = dao.getAllProducts();

	    System.out.println("M: DAO에서 가져온 상품 개수: " + productList.size());

	    request.setAttribute("productList", productList);

	    request.setAttribute("contentPage", "/admin/adminProducts.jsp");

	    ActionForward forward = new ActionForward();

	    forward.setPath("/admin/adminHome.jsp");
	    forward.setRedirect(false);

	    return forward;
	}
}
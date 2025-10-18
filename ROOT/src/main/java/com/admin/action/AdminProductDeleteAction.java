package com.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Action;
import com.ActionForward;
import com.product.db.ProductDAO;

public class AdminProductDeleteAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        int productId = Integer.parseInt(request.getParameter("productId"));

        ProductDAO dao = new ProductDAO();
        boolean result = dao.deleteProduct(productId);

        if (result) {
            System.out.println("M: 상품 삭제 성공!");
        } else {
            System.out.println("M: 상품 삭제 실패.");
        }

        // 4. 상품 목록 페이지로 리다이렉트
        ActionForward forward = new ActionForward();
        forward.setPath("/admin/AdminProductList.ac"); 
        forward.setRedirect(true);

        return forward;
    }
}
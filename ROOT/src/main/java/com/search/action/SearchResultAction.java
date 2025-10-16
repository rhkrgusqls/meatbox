package com.search.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Action;
import com.ActionForward;
import com.product.db.ProductBean;
import com.product.db.ProductDAO;

public class SearchResultAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("S: SearchResultAction.execute() 호출");

        String searchText = request.getParameter("searchText");
        String pageStr = request.getParameter("page");

        // page가 null이면 1
        int page = 1;
        if (pageStr != null) {
            try {
                page = Integer.parseInt(pageStr);
                if (page < 1) page = 1;
            } catch (NumberFormatException e) {
                page = 1;
            }
        }

        ProductDAO dao = new ProductDAO();
        List<ProductBean> productList = null;

        try {
            productList = dao.searchProducts(searchText, page); // DAO에서 페이지 기반 검색
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("productList", productList);

        ActionForward forward = new ActionForward();
        forward.setPath("/event/productList.jsp"); 
        forward.setRedirect(false); // Forward 방식

        return forward;
    }
}

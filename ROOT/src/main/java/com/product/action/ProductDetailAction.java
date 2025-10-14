package com.product.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Action;
import com.ActionForward;
import com.product.db.ProductDAO;
import com.product.db.ProductDetailBean;

public class ProductDetailAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        System.out.println("M: ProductDetailAction의 execute() 호출");

        // 1. 전달된 파라미터(productSeq) 저장
        int productId = Integer.parseInt(request.getParameter("productSeq"));

        // 2. DAO 객체 생성 및 메소드 호출
        ProductDAO dao = new ProductDAO();
        ProductDetailBean productDetail = dao.getProductDetail(productId);

        // 3. request 영역에 정보 저장
        request.setAttribute("productDetail", productDetail);

        // 4. 페이지로 이동
        ActionForward forward = new ActionForward();
        forward.setPath("./product/productDetail.jsp"); // 상품 상세 정보를 보여줄 JSP 페이지
        forward.setRedirect(false); // forward 방식으로 데이터 전달

        return forward;
    }
}
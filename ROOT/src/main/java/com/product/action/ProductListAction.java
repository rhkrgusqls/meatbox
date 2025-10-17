package com.product.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Action;
import com.ActionForward;
import com.product.db.CategoryBean;
import com.product.db.ProductBean;
import com.product.db.ProductDAO;

public class ProductListAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        System.out.println("M: ProductListAction의 execute() 호출");

        // 1. URL로부터 전달된 카테고리 ID 파라미터(category)를 가져옵니다.
        String categoryIdStr = request.getParameter("category");
        
        // 카테고리 ID가 없으면 기본값 또는 오류 처리를 할 수 있습니다. 여기서는 0으로 설정.
        int categoryId = 0;
        if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
            categoryId = Integer.parseInt(categoryIdStr);
        }

        // 2. ProductDAO 객체를 생성하고, 카테고리별 상품 목록을 조회하는 메소드를 호출합니다.
        ProductDAO dao = new ProductDAO();
        // 한 페이지에 보여줄 상품 개수, 시작점 등을 설정할 수 있습니다. (페이징)
        int offset = 0; // 시작 위치
        int limit = 20; // 한 번에 가져올 개수
        List<ProductBean> productList = dao.getProductsByCategory(categoryId, offset, limit);
        List<CategoryBean> subCategoryList = dao.getSubCategories(1); 
        // 조회된 카테고리 목록을 request에 저장
        request.setAttribute("subCategoryList", subCategoryList);

        // 3. request 객체에 "productList"라는 이름으로 조회된 상품 목록을 저장합니다.
        request.setAttribute("productList", productList);
        // JSP에서 카테고리 이름을 보여주기 위해 카테고리 ID도 함께 전달할 수 있습니다.
        request.setAttribute("categoryId", categoryId);

        // 4. 포워딩 정보를 담는 ActionForward 객체 생성
        ActionForward forward = new ActionForward();
        // 이동할 JSP 페이지 경로 설정
        forward.setPath("./event/productList.jsp"); 
        // Forward 방식으로 페이지를 이동시켜 request 객체의 데이터를 JSP와 공유
        forward.setRedirect(false); 

        return forward;
    }
}
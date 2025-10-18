package com.product.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Action;
import com.ActionForward;
import com.product.bo.db.CategoryDAO; 
import com.product.bo.db.CategoryDTO; 
import com.product.db.ProductDAO;
import com.product.db.ProductBean; // ProductBean을 사용합니다.


public class ProductListAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        System.out.println("M: ProductListAction.execute() 호출");

        // --- 상단 네비게이션 메뉴 로직 ---
        String categorySeqStr = request.getParameter("displayCategorySeq");
        int currentCategoryId = 0;
        if (categorySeqStr != null && !categorySeqStr.isEmpty()) {
            try {
                currentCategoryId = Integer.parseInt(categorySeqStr);
            } catch (NumberFormatException e) {
                System.out.println("올바르지 않은 카테고리 ID 입니다: " + categorySeqStr);
                // 유효하지 않은 ID일 경우, 오류 페이지로 보내거나 기본 페이지로 리다이렉트 할 수 있습니다.
            }
        }

        if (currentCategoryId > 0) {
            CategoryDAO cdao = new CategoryDAO();
            CategoryDTO topLevelParent = cdao.findTopLevelParent(currentCategoryId);

            if (topLevelParent != null) {
                List<CategoryDTO> subCategoryList = cdao.getCategoriesByParent(topLevelParent.getCategoryId());
                request.setAttribute("topLevelParent", topLevelParent); 
                request.setAttribute("subCategoryList", subCategoryList); 
                request.setAttribute("currentCategoryId", currentCategoryId);
            }
        }
        
        // --- 상품 목록 조회 로직 (getProductsByCategory 호출 방식 수정) ---

        // 페이징 처리를 위한 파라미터 (우선 기본값으로 설정)
        int page = 1; // 현재 페이지 번호
        int limit = 20; // 한 페이지에 보여줄 상품 수
        
        String pageStr = request.getParameter("page");
        if (pageStr != null && !pageStr.isEmpty()) {
            page = Integer.parseInt(pageStr);
        }

        int offset = (page - 1) * limit; // DB 조회 시작 위치 계산

        ProductDAO pdao = new ProductDAO();
        // ProductDAO의 메소드 시그니처에 맞게 3개의 파라미터(categoryId, offset, limit)를 전달합니다.
        List<ProductBean> productList = pdao.getProductsByCategory(currentCategoryId, offset, limit); 
        
        request.setAttribute("productList", productList);
        
        // --- 페이지 이동 설정 ---

        ActionForward forward = new ActionForward();
        forward.setPath("./product/productList.jsp"); 
        forward.setRedirect(false); 
        
        return forward;
    }
}
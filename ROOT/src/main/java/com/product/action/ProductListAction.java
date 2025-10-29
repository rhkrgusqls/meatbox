package com.product.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Action;
import com.ActionForward;
import com.product.bo.db.CategoryDAO;
import com.product.bo.db.CategoryDTO;
import com.product.db.ProductDAO;
import com.product.db.ProductBean;

public class ProductListAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        System.out.println("M: ProductListAction.execute() 호출");

        // URL 파라미터에서 카테고리 ID 가져오기 (category 파라미터 우선, displayCategorySeq는 fallback)
        String categorySeqStr = request.getParameter("category");
        if (categorySeqStr == null || categorySeqStr.isEmpty()) {
            categorySeqStr = request.getParameter("displayCategorySeq");
        }
        
        int currentCategoryId = 0;
        if (categorySeqStr != null && !categorySeqStr.isEmpty()) {
            try {
                currentCategoryId = Integer.parseInt(categorySeqStr);
                System.out.println("M: 선택된 카테고리 ID: " + currentCategoryId);
            } catch (NumberFormatException e) {
                System.out.println("올바르지 않은 카테고리 ID 입니다: " + categorySeqStr);
                currentCategoryId = 0;
            }
        } else {
            System.out.println("M: 카테고리 파라미터가 없어 전체 상품을 조회합니다.");
        }

        // ✅ currentCategoryId가 0보다 클 때만 카테고리 네비게이션 정보를 조회합니다.
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
        
        // --- 상품 목록 조회 로직 ---
        ProductDAO pdao = new ProductDAO();
        
        int page = 1;
        int limit = 20;
        String pageStr = request.getParameter("page");
        if (pageStr != null && !pageStr.isEmpty()) {
            page = Integer.parseInt(pageStr);
        }
        int offset = (page - 1) * limit;

        // ProductDAO의 getProductsByCategory는 categoryId가 0일 때 전체 상품을 가져오도록 수정되어 있어야 합니다.
        List<ProductBean> productList = pdao.getProductsByCategory(currentCategoryId, offset, limit); 
        
        System.out.println("M: 조회된 상품 수: " + (productList != null ? productList.size() : 0));
        if (productList != null && !productList.isEmpty()) {
            System.out.println("M: 첫 번째 상품: " + productList.get(0).getProductName());
        }
        
        request.setAttribute("productList", productList);
        
        // --- 페이지 이동 설정 ---
        ActionForward forward = new ActionForward();
        forward.setPath("./event/productList.jsp"); 
        forward.setRedirect(false); 
        
        return forward;
    }
}
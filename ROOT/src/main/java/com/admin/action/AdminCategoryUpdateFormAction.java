package com.admin.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Action;
import com.ActionForward;
import com.product.bo.db.CategoryDAO;
import com.product.bo.db.CategoryDTO;

public class AdminCategoryUpdateFormAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        int categoryId = Integer.parseInt(request.getParameter("id"));
        
        CategoryDAO dao = new CategoryDAO();
        
        // 1. 수정할 부모 카테고리 정보 조회
        CategoryDTO category = dao.getCategoryById(categoryId);
        
        // 2. 해당 부모의 자식 카테고리 목록 조회 (추가된 로직)
        List<CategoryDTO> childList = dao.getCategoriesByParent(categoryId);
        
        // 3. request에 부모와 자식 목록 모두 저장
        request.setAttribute("category", category);
        request.setAttribute("childList", childList); // 자식 목록 추가
        
        // 4. 수정 폼 페이지로 포워딩
        ActionForward forward = new ActionForward();
        forward.setPath("./admin/adminCategoryUpdate.jsp");
        forward.setRedirect(false);
        
        return forward;
    }
}
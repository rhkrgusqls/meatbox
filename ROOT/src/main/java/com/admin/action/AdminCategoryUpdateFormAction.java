// com/admin/action/AdminCategoryUpdateFormAction.java
package com.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Action;
import com.ActionForward;
import com.product.bo.db.CategoryDAO;
import com.product.bo.db.CategoryDTO;

public class AdminCategoryUpdateFormAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        // 1. 전달된 카테고리 ID를 가져옵니다.
        int categoryId = Integer.parseInt(request.getParameter("id"));
        
        // 2. DAO를 이용해 해당 카테고리 정보를 조회합니다.
        CategoryDAO dao = new CategoryDAO();
        CategoryDTO category = dao.getCategoryById(categoryId); // 이전에 만든 getCategoryById 활용
        
        // 3. request에 카테고리 정보를 저장합니다.
        request.setAttribute("category", category);
        
        // 4. 수정 폼 페이지로 포워딩합니다.
        ActionForward forward = new ActionForward();
        forward.setPath("./admin/adminCategoryUpdate.jsp");
        forward.setRedirect(false); // request 정보를 전달해야 하므로 false
        
        return forward;
    }
}
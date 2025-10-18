// com/admin/action/AdminCategoryUpdateAction.java
package com.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Action;
import com.ActionForward;
import com.product.bo.db.CategoryDAO;

public class AdminCategoryUpdateAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        request.setCharacterEncoding("UTF-8");
        
        // 1. 수정 폼에서 전달된 ID와 새 이름을 가져옵니다.
        int categoryId = Integer.parseInt(request.getParameter("id"));
        String newName = request.getParameter("categoryName");
        
        // 2. DAO를 이용해 DB 정보를 업데이트합니다.
        CategoryDAO dao = new CategoryDAO();
        dao.updateCategory(categoryId, newName);
        
        // 3. 작업 완료 후, 카테고리 목록 페이지로 리다이렉트합니다.
        ActionForward forward = new ActionForward();
        forward.setPath("./AdminHome.ac?page=categories");
        forward.setRedirect(true);
        
        return forward;
    }
}
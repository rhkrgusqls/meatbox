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
        
        CategoryDAO dao = new CategoryDAO();

        // 1. 부모 카테고리 정보 업데이트
        int parentId = Integer.parseInt(request.getParameter("id"));
        String parentName = request.getParameter("categoryName");
        dao.updateCategory(parentId, parentName);
        
        // 2. 자식 카테고리 정보들 업데이트 (여러 개일 수 있음)
        String[] childIds = request.getParameterValues("childId");
        String[] childNames = request.getParameterValues("childName");
        
        if (childIds != null && childNames != null) {
            for (int i = 0; i < childIds.length; i++) {
                int childId = Integer.parseInt(childIds[i]);
                String childName = childNames[i];
                dao.updateCategory(childId, childName);
            }
        }
        
        // 3. 작업 완료 후, 카테고리 목록 페이지로 리다이렉트
        ActionForward forward = new ActionForward();
        forward.setPath("/admin/AdminCategories.ac");
        forward.setRedirect(true);
        
        return forward;
    }
}
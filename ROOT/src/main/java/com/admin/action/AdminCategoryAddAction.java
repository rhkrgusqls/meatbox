// src/main/java/com/admin/action/AdminCategoryAddAction.java

package com.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Action;
import com.ActionForward;
import com.product.bo.db.CategoryDAO;

public class AdminCategoryAddAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        String categoryName = request.getParameter("categoryName");

        CategoryDAO dao = new CategoryDAO();
        dao.insertCategory(categoryName);

        // 완료 후 카테고리 목록으로 이동
        ActionForward forward = new ActionForward();
        forward.setPath("/admin/AdminCategories.ac");
        forward.setRedirect(true);
        return forward;
    }
}
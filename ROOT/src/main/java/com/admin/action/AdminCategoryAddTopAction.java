// com/admin/action/AdminCategoryAddTopAction.java

package com.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Action;
import com.ActionForward;
import com.product.bo.db.CategoryDAO;

public class AdminCategoryAddTopAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        String categoryName = request.getParameter("categoryName");

        CategoryDAO dao = new CategoryDAO();
        dao.addTopLevelCategory(categoryName);

        // 작업 완료 후, 목록을 다시 불러오는 Action으로 리다이렉트
        ActionForward forward = new ActionForward();
        forward.setPath("/admin/AdminCategories.ac");
        forward.setRedirect(true);
        return forward;
    }
}
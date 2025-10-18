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

        // AJAX 호출 후 클라이언트가 새로고침할 수 있도록, 최종 목록 페이지로 리다이렉트합니다.
        // 현재 구조상 AdminHome.ac?page=categories가 최종 목록 페이지입니다.
        ActionForward forward = new ActionForward();
        forward.setPath("./AdminHome.ac?page=categories");
        forward.setRedirect(true);
        return forward;
    }
}
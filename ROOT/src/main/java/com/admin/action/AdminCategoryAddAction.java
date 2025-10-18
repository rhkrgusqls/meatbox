package com.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Action;
import com.ActionForward;
import com.product.bo.db.CategoryDAO;
import com.product.bo.db.CategoryDTO;

public class AdminCategoryAddAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        String categoryName = request.getParameter("categoryName");

        CategoryDTO newCategory = new CategoryDTO();
        newCategory.setCategoryName(categoryName);

        CategoryDAO dao = new CategoryDAO();
        dao.addCategory(newCategory);

        ActionForward forward = new ActionForward();
        forward.setPath("./AdminCategoryList.ac");
        forward.setRedirect(true);
        return forward;
    }
}
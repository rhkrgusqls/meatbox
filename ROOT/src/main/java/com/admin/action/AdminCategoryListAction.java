package com.admin.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Action;
import com.ActionForward;
import com.product.bo.db.CategoryDAO;
import com.product.bo.db.CategoryDTO;

public class AdminCategoryListAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        CategoryDAO dao = new CategoryDAO();
        List<CategoryDTO> categoryList = dao.getAllCategoriesHierarchical();
        request.setAttribute("categoryList", categoryList);

        ActionForward forward = new ActionForward();
        forward.setPath("./admin/adminCategories.jsp");
        forward.setRedirect(false);
        return forward;
    }
}
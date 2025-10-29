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

        // 하위 카테고리 추가용 상위 카테고리 목록
        List<CategoryDTO> topLevelCategories = dao.getTopLevelCategories();
        request.setAttribute("topLevelCategories", topLevelCategories);

        // 사이드바 활성화용
        request.setAttribute("currentPage", "categories");
        // 레이아웃에서 포함할 컨텐츠 지정
        request.setAttribute("contentPage", "/admin/adminCategories.jsp");

        ActionForward forward = new ActionForward();
        forward.setPath("/admin/adminHome.jsp");
        forward.setRedirect(false);
        return forward;
    }
}
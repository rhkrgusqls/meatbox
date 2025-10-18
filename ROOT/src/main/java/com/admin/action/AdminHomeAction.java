// src/main/java/com/admin/action/AdminHomeAction.java

package com.admin.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Action;
import com.ActionForward;
import com.product.bo.db.CategoryDAO;
import com.product.bo.db.CategoryDTO;

public class AdminHomeAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        String page = request.getParameter("page");
        
        if ("categories".equals(page)) {
            CategoryDAO dao = new CategoryDAO();
            // 1. 전체 계층형 목록 가져오기
            List<CategoryDTO> categoryList = dao.getAllCategoriesHierarchical();
            request.setAttribute("categoryList", categoryList);
            
            // 2. 자식 추가 폼의 <select>를 채울 최상위 목록 가져오기
            List<CategoryDTO> topLevelCategories = dao.getTopLevelCategories();
            request.setAttribute("topLevelCategories", topLevelCategories);
        }
        
        ActionForward forward = new ActionForward();
        forward.setPath("./admin/adminHome.jsp");
        forward.setRedirect(false);
        
        return forward;
    }
}
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
        
        // "page" 파라미터 값을 가져옵니다.
        String page = request.getParameter("page");
        
        // 만약 page 파라미터가 "categories" 라면, DB에서 목록을 조회합니다.
        if ("categories".equals(page)) {
            CategoryDAO dao = new CategoryDAO();
            List<CategoryDTO> categoryList = dao.getAllCategories();
            request.setAttribute("categoryList", categoryList);
        }
        
        // 다른 페이지 파라미터에 대한 처리가 필요하다면 여기에 else if 추가
        // 예: else if ("users".equals(page)) { ... }
        
        // 항상 adminHome.jsp로 포워딩합니다.
        ActionForward forward = new ActionForward();
        forward.setPath("./admin/adminHome.jsp");
        forward.setRedirect(false); // request에 담은 정보를 전달해야 하므로 false
        
        return forward;
    }
}
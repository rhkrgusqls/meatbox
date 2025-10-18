// com/admin/action/AdminCategoryDeleteAction.java
package com.admin.action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Action;
import com.ActionForward;
import com.product.bo.db.CategoryDAO;

public class AdminCategoryDeleteAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        // 1. 삭제할 카테고리 ID를 가져옵니다.
        int categoryId = Integer.parseInt(request.getParameter("id"));
        
        CategoryDAO dao = new CategoryDAO();
        ActionForward forward = new ActionForward();
        
        try {
            // 2. DAO를 이용해 DB에서 카테고리를 삭제합니다.
            dao.deleteCategory(categoryId);
            
            // 3. 성공 시 목록 페이지로 리다이렉트합니다.
            forward.setPath("./AdminHome.ac?page=categories");
            forward.setRedirect(true);
            
        } catch (Exception e) {
            // DAO에서 자식 카테고리가 있어 예외가 발생한 경우 처리
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('자식 카테고리가 존재하여 삭제할 수 없습니다.');");
            out.println("history.back();");
            out.println("</script>");
            out.close();
            return null; // forward가 null이면 Controller에서 페이지 이동을 하지 않습니다.
        }

        return forward;
    }
}
// com/admin/action/AdminChildCategoryDeleteAction.java

package com.admin.action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Action;
import com.ActionForward;
import com.product.bo.db.CategoryDAO;

public class AdminChildCategoryDeleteAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        // 1. 삭제할 자식 카테고리 ID와, 돌아갈 부모 카테고리 ID를 가져옵니다.
        int childId = Integer.parseInt(request.getParameter("id"));
        String parentId = request.getParameter("parentId");
        
        CategoryDAO dao = new CategoryDAO();
        ActionForward forward = new ActionForward();
        
        try {
            // 2. DAO를 이용해 DB에서 카테고리를 삭제합니다.
            dao.deleteCategory(childId);
            
            // 3. 성공 시, 원래의 '수정 폼 페이지'로 리다이렉트합니다.
            forward.setPath("./AdminCategoryUpdate.ac?id=" + parentId);
            forward.setRedirect(true);
            
        } catch (Exception e) {
            // DAO에서 자식의 자식이 있어 예외가 발생한 경우 처리
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('해당 카테고리에 속한 하위 카테고리가 있어 삭제할 수 없습니다.');");
            out.println("history.back();");
            out.println("</script>");
            out.close();
            return null;
        }

        return forward;
    }
}
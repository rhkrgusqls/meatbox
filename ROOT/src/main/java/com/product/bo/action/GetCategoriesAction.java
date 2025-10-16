package com.product.bo.action;

import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;
import com.Action;
import com.ActionForward;
import com.product.bo.db.CategoryDAO;
import com.product.bo.db.CategoryDTO; // DTO 사용

public class GetCategoriesAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("M: GetCategoriesAction_execute() 호출");

        String parentIdStr = request.getParameter("parentId");
        Integer parentId = null;
        if (parentIdStr != null && !parentIdStr.isEmpty() && !"null".equals(parentIdStr)) {
            try {
                parentId = Integer.parseInt(parentIdStr);
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid parentId format");
                return null;
            }
        }

        CategoryDAO dao = new CategoryDAO();
        List<CategoryDTO> categories = dao.getCategoriesByParent(parentId);

        JSONArray jsonArray = new JSONArray();
        for (CategoryDTO category : categories) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("id", category.getCategoryId());
            jsonObject.put("name", category.getCategoryName());
            jsonObject.put("level", category.getLevel());
            jsonObject.put("isLeaf", category.isLeaf()); // isLeaf 필드로 변경
            jsonArray.put(jsonObject);
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(jsonArray.toString());
        out.flush();

        return null;
    }
}
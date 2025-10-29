package com.product.seller.controller;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import org.json.JSONArray;
import org.json.JSONObject;

import com.product.bo.db.CategoryDAO;

@WebServlet("/getCategories.do")
public class GetCategoriesController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();

        JSONArray arr = new JSONArray();

        try {
            CategoryDAO dao = new CategoryDAO();
            List<CategoryBean> categories = dao.getLeafCategories();

            for (CategoryBean cat : categories) {
                JSONObject obj = new JSONObject();
                obj.put("categoryId", cat.getCategoryId());
                obj.put("categoryName", cat.getCategoryName());
                arr.put(obj);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        out.print(arr.toString());
        out.flush();
    }
}

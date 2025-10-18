package com.product.bo.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class ApproveProductRequestServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            new ApproveProductRequestAction().execute(request, response);
            response.getWriter().write("{\"result\":\"success\"}");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("{\"result\":\"fail\"}");
        }
    }
}

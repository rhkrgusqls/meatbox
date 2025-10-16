package com.product.bo.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Action;
import com.ActionForward;
import com.product.bo.action.GetCategoriesAction;

@WebServlet("*.cbo")
public class CategoryController extends HttpServlet {

    protected void doProcess(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("C: CategoryController-doProcess() 호출");

        // 1. 가상주소 계산
        String requestURI = request.getRequestURI();
        String ctxPath = request.getContextPath();
        String command = requestURI.substring(ctxPath.length());
        System.out.println("C: command : " + command);

        Action action = null;
        ActionForward forward = null;

        // 2. 가상주소 매핑 (GetCategories.cbo 요청을 처리)
        if (command.equals("/GetCategories.cbo")) {
            System.out.println("C: /GetCategories.cbo 호출 -> GetCategoriesAction 실행");
            action = new GetCategoriesAction();
            try {
                // action의 execute() 메소드는 AJAX 응답을 직접 처리하므로 forward는 null을 반환합니다.
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // 3. 페이지 이동 (GetCategoriesAction은 AJAX 요청이라 forward가 항상 null이므로 이 부분은 실행되지 않습니다)
        if (forward != null) {
            if (forward.isRedirect()) {
                response.sendRedirect(forward.getPath());
            } else {
                RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
                dis.forward(request, response);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doProcess(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doProcess(request, response);
    }
}
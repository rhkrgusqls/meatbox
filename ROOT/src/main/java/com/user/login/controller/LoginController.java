package com.user.login.controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

import com.Action;
import com.ActionForward;
import com.user.login.action.*; // Action 인터페이스/구현체들

public class LoginController extends HttpServlet {

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

    private void doProcess(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String command = request.getServletPath(); // 예: /loginAction.do
        ActionForward forward = null;
        Action action = null;

        try {
            // 요청별로 Action 분기
            if (command.equals("/loginAction.do")) {
                action = new LoginAction();
                forward = action.execute(request, response);
            }

            // 이동 처리
            if (forward != null) {
                if (forward.isRedirect()) {
                    response.sendRedirect(forward.getPath());
                } else {
                    RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
                    dispatcher.forward(request, response);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
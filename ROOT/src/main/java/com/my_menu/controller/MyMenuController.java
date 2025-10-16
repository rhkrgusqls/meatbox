package com.my_menu.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
// import javax.servlet.annotation.WebServlet; // 어노테이션을 사용하지 않으므로 이 import 문은 제거합니다.
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Action;
import com.ActionForward;
import com.my_menu.action.MyMenuAction;

// @WebServlet("/myMenu/*") // web.xml에서 매핑을 처리하기 위해 어노테이션을 제거합니다.
public class MyMenuController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String command = request.getRequestURI();
        Action action = null;
        ActionForward forward = null;

        // 요청된 URL에 따라 적절한 Action을 생성
        if (command.endsWith("/myMenu/myMenuMainPage.do")) {
            action = new MyMenuAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        // 다른 /myMenu/ 관련 요청이 있다면 여기에 추가 (예: else if ...)

        // 포워딩 처리
        if (forward != null) {
            if (forward.isRedirect()) {
                response.sendRedirect(forward.getPath());
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
                dispatcher.forward(request, response);
            }
        }
    }
}
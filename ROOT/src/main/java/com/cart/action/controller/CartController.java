package com.cart.action.controller;

import java.io.IOException; 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
// import javax.servlet.annotation.WebServlet; // 어노테이션을 사용하지 않으므로 이 import 문은 제거합니다.
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Action;
import com.ActionForward;
import com.cart.action.CartAddAction;
import com.cart.action.CartPageAction;

// @WebServlet("/myMenu/*") // web.xml에서 매핑을 처리하기 위해 어노테이션을 제거합니다.
public class CartController extends HttpServlet {
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

        try {
            // 요청별로 Action 분기
            if (command.equals("/cart/cartPage.do")) {
            	action = new CartPageAction();
                forward = action.execute(request, response);
            } else if (command.equals("/cart/cartAddAction.do")) {
            	action = new CartAddAction();
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
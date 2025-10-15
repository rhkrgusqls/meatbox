package com.cart.action.controller;
 
import java.io.IOException;  
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Action;
import com.ActionForward;
import com.cart.action.CartAddAction;
import com.cart.action.CartPageAction;

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
        // response.setCharacterEncoding("UTF-8"); // Action 클래스에서 직접 처리하는 경우가 많으므로 생략 가능

        // [수정] 1. ProductController와 동일하게 가상주소 계산
        String requestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String command = requestURI.substring(contextPath.length());
        
        System.out.println("C: CartController가 받은 command: " + command); // 디버깅용 로그

        Action action = null;
        ActionForward forward = null;

        try {
            // 요청별로 Action 분기
            // [수정] 2. 올바른 URL 경로로 조건문 변경
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
            } else {
                 System.out.println("C: 이동할 페이지 정보(ActionForward)가 없습니다."); // 디버깅용 로그
            }

        } catch (Exception e) {
            e.printStackTrace();
            // 필요하다면 이곳에 에러 페이지로 이동하는 로직을 추가할 수 있습니다.
        }
    }
}
package com.order.controller; 

import com.ActionForward;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class OrderController extends HttpServlet {
    
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String command = request.getServletPath(); 
        ActionForward forward = null;

        System.out.println("OrderController - 요청된 Command: " + command); 
        
        // "productId" 라는 이름으로 넘어온 모든 값을 배열로 받습니다.
        String[] productIds = request.getParameterValues("productId");
        String[] op = request.getParameterValues("optionId");
        // 배열이 null이 아니고 비어있지 않은지 확인 후 콘솔에 출력합니다.
        if (productIds != null && productIds.length > 0) {
            System.out.println("✅ 체크박스 값 받음: " + java.util.Arrays.toString(productIds));
        } else {
            System.out.println("❌ 체크박스 값 없음");
        }
        if (op != null && op.length > 0) {
            System.out.println("✅ 체크박스 값 받음: " + java.util.Arrays.toString(op));
        } else {
            System.out.println("❌ 체크박스 값 없음");
        }

        try {
            if (command.equals("/order.do")) {
                forward = new ActionForward();
                forward.setPath("/order/orderPage.jsp"); 
                forward.setRedirect(false);
            }
            
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }
}
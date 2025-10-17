package com.product.seller.controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Action;
import com.ActionForward;
import com.product.seller.action.SellerProductRegisterAction;

public class SellerProductController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("C: SellerProductController.doProcess() 호출");

        // 1. 가상주소 계산
        String requestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String command = requestURI.substring(contextPath.length());

        System.out.println("C: 계산된 가상주소: " + command);

        Action action = null;
        ActionForward forward = null;

        // 2. 가상주소에 따른 처리
        if (command.equals("/sellerProductRegister.do")) {
            System.out.println("C: /sellerProductRegister.do 주소 호출됨");

            action = new SellerProductRegisterAction();

            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // 3. 페이지 이동
        if (forward != null) {
            if (forward.isRedirect()) {
                System.out.println("C: Redirect 방식으로 페이지 이동: " + forward.getPath());
                response.sendRedirect(forward.getPath());
            } else {
                System.out.println("C: Forward 방식으로 페이지 이동: " + forward.getPath());
                RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
                dis.forward(request, response);
            }
        } else {
            System.out.println("C: 이동할 페이지 정보(ActionForward)가 없습니다.");
        }
    }
}

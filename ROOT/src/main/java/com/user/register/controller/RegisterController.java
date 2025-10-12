package com.user.register.controller;

import com.Action;
import com.ActionForward;
import com.user.register.action.BusinessInfoAction;
import com.user.register.action.RegisterNormalAction;
import com.user.register.action.RegisterSellerAction;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RegisterController extends HttpServlet {
    
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String command = request.getServletPath(); 
        ActionForward forward = null;
        Action action = null;

        System.out.println("RegisterController - 요청된 Command: " + command); 

        try {
            // --- 일반 회원가입 ---
            if (command.equals("/registerNormal.do")) {
                forward = new ActionForward();
                forward.setPath("./register/registerNormalForm.jsp"); 
                forward.setRedirect(false);
            }
            else if (command.equals("/registerNormalAction.do")) {
                action = new RegisterNormalAction();
                forward = action.execute(request, response);
            }
            
            // --- 사업자 회원가입 ---
            // 1단계: 사업자 정보 입력 폼으로 이동
            else if (command.equals("/registerSeller.do")) {
                forward = new ActionForward();
                forward.setPath("./register/registerSellerForm.jsp");
                forward.setRedirect(false);
            }
            // 1단계: 사업자 정보 처리 후 2단계 폼으로 이동
            else if (command.equals("/businessInfoAction.do")) {
                action = new BusinessInfoAction();
                forward = action.execute(request, response);
            }
            // 2단계: 최종 사업자 회원가입 처리
            else if (command.equals("/registerSellerAction.do")) {
                action = new RegisterSellerAction();
                forward = action.execute(request, response);
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


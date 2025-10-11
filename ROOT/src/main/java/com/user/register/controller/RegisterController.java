package com.user.register.controller;

import com.Action;
import com.ActionForward;
import com.user.login.action.LoginAction;
import com.user.register.action.RegisterNormalAction; 

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

        System.out.println("요청된 Command: " + command); 

        try {
            // 일반 회원가입 폼으로 이동
            if (command.equals("/registerNormal.do")) {
                forward = new ActionForward();
                forward.setPath("./register/registerNormalForm.jsp");
                forward.setRedirect(false);
            }
            // 일반 회원가입 처리
            else if (command.equals("/registerNormalAction.do")) {
                action = new RegisterNormalAction();
                forward = action.execute(request, response);
            }
            // 판매자 회원가입 폼으로 이동
//            else if (command.equals("/registerSeller.do")) {
//                forward = new ActionForward();
//                forward.setPath("./register/registerSellerForm.jsp");
//                forward.setRedirect(false);
//            }
//            // 판매자 회원가입 처리
//            else if (command.equals("/registerSellerAction.do")) {
//                action = new RegisterSellerAction();
//                forward = action.execute(request, response);
//            }
            

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
//package com.admin.controller;
//
//import java.io.IOException;
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.Action;
//import com.ActionForward;
//import com.product.bo.action.GetCategoriesAction;
//
//@WebServlet("*.cbo")
//public class AdminController extends HttpServlet {
//
//    protected void doProcess(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        System.out.println("C: CategoryController-doProcess() 호출");
//
//        // 1. 가상주소 계산
//        String requestURI = request.getRequestURI();
//        String ctxPath = request.getContextPath();
//        String command = requestURI.substring(ctxPath.length());
//        System.out.println("C: command : " + command);
//
//        Action action = null;
//        ActionForward forward = null;
//
//        // 2. 가상주소 매핑 (GetCategories.cbo 요청을 처리)
//        if (command.equals("/dashboard.do")) {
//            System.out.println("C: /dashboard.do 호출 -> DashboardAction 실행");
//            action = new DashboardAction();
//            try {
//                // action의 execute() 메소드는 AJAX 응답을 직접 처리하므로 forward는 null을 반환합니다.
//                forward = action.execute(request, response);
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//
//        // 3. 페이지 이동
//        if (forward != null) {
//            if (forward.isRedirect()) {
//                response.sendRedirect(forward.getPath());
//            } else {
//                RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
//                dis.forward(request, response);
//            }
//        }
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        doProcess(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        doProcess(request, response);
//    }
//}
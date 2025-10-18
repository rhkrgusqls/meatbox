package com.admin.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Action;
import com.ActionForward;
import com.admin.action.AdminHomeAction;
import com.admin.action.AdminProductDeleteAction;
import com.admin.action.AdminCategoryListAction;
import com.admin.action.AdminCategoryAddAction;
import com.admin.action.AdminCategoryAddChildAction;
import com.admin.action.AdminCategoryAddTopAction;
import com.admin.action.AdminProductListAction;
import com.admin.action.AdminProductUpdateAction;
import com.admin.action.order.AdminOrderAddAction;
import com.admin.action.order.AdminOrderDeleteAction;
import com.admin.action.order.AdminOrderDetailAction;
import com.admin.action.order.AdminOrderModifyAction;
import com.admin.action.order.AdminOrderViewAction;

@WebServlet("*.ac") // URL 패턴을 *.ac로 변경
public class AdminController extends HttpServlet {

    protected void doProcess(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("C: AdminController-doProcess() 호출");

        // 1. 가상주소 계산
        String requestURI = request.getRequestURI();
        String ctxPath = request.getContextPath();
        String command = requestURI.substring(ctxPath.length());
        System.out.println("C: command : " + command);

        Action action = null;
        ActionForward forward = null;

        // 2. 가상주소 매핑
        if (command.equals("/AdminHome.ac")) { 
            System.out.println("C: /AdminHome.ac 호출");
            action = new AdminHomeAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else  if (command.equals("/AdminCategoryAddTop.ac")) { // 최상위 추가 Action
            System.out.println("C: /AdminCategoryAddTop.ac 호출");
            action = new AdminCategoryAddTopAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) { e.printStackTrace(); }
        } else if (command.equals("/AdminCategoryAddChild.ac")) { // 자식 추가 Action
            System.out.println("C: /AdminCategoryAddChild.ac 호출");
            action = new AdminCategoryAddChildAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) { e.printStackTrace(); }
        } else if (command.equals("/AdminCategoryList.ac")) {
            System.out.println("C: /AdminCategoryList.ac 호출");
            action = new AdminCategoryListAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/admin/AdminProductList.ac")) { // "/admin" 경로 추가
            System.out.println("C: /admin/AdminProductList.ac 호출");
            action = new AdminProductListAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
         // AdminController.java
         // ...
         } else if (command.equals("/admin/AdminProductUpdate.ac")) {
             System.out.println("C: /admin/AdminProductUpdate.ac 호출");
             action = new AdminProductUpdateAction();
             try {
                 forward = action.execute(request, response);
             } catch (Exception e) {
                 e.printStackTrace();
             }
        } else if (command.equals("/admin/AdminOrderViewAction.ac")) { // ⬅️ 이 문자열이 로그와 정확히 같은지 확인!
             System.out.println("C: /admin/AdminOrderViewAction.ac 호출"); // ⬅️ 로그 추가
             action = new AdminOrderViewAction();
             try {
                 forward = action.execute(request, response);
             } catch (Exception e) {
                 e.printStackTrace();
             }
        } else if (command.equals("/admin/AdminProductDelete.ac")) {
            System.out.println("C: /admin/AdminProductDelete.ac 호출");
            action = new AdminProductDeleteAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
       } else if (command.equals("/AdminOrderView.ac")) {   // 전체페이지 조회
            System.out.println("C: /AdminOrderView.ac 호출");
            action = new AdminOrderViewAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }

        } else if (command.equals("/AdminOrderDetail.ac")) {   // 페이지 상세조회
            System.out.println("C: /AdminOrderDetail.ac 호출");
            action = new AdminOrderDetailAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/AdminOrderAdd.ac")) { // 주문추가
            System.out.println("C: /AdminOrderAdd.ac 호출");
            action = new AdminOrderAddAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/AdminOrderModify.ac")) {  // 페이지 상세조회에서 주문 수정
            System.out.println("C: /AdminOrderModify.ac 호출");
            action = new AdminOrderModifyAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        
        } else if (command.equals("/AdminOrderDelete.ac")) { // 주문 삭제
            System.out.println("C: /AdminOrderDelete.ac 호출");
            action = new AdminOrderDeleteAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        // 다른 관리자 기능이 추가될 경우, 여기에 else if 문을 추가합니다.


        // 3. 페이지 이동
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
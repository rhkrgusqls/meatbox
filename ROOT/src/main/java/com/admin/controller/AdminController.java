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
import com.admin.action.order.AdminOrderStatusUpdateAction;
import com.admin.action.AdminCategoryUpdateFormAction;
import com.admin.action.AdminChildCategoryDeleteAction;
import com.admin.action.AdminCategoryUpdateAction;
import com.admin.action.AdminCategoryDeleteAction;

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

        // 2. 가상주소 매핑 (모든 관리자 URL을 /admin/ 하위로 통일)
        if (command.equals("/admin/AdminHome.ac")) { 
            System.out.println("C: /admin/AdminHome.ac 호출");
            action = new AdminHomeAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/admin/AdminCategories.ac")) { // 카테고리 메인(깨끗한 URL)
            System.out.println("C: /admin/AdminCategories.ac 호출");
            action = new AdminCategoryListAction();
            try { forward = action.execute(request, response); } catch (Exception e) { e.printStackTrace(); }
        } else if (command.equals("/admin/AdminOrders.ac")) { // 주문 메인(깨끗한 URL)
            System.out.println("C: /admin/AdminOrders.ac 호출");
            action = new AdminOrderViewAction();
            try { forward = action.execute(request, response); } catch (Exception e) { e.printStackTrace(); }
        } else if (command.equals("/admin/AdminRequests.ac")) { // 요청 관리(깨끗한 URL)
            System.out.println("C: /admin/AdminRequests.ac 호출");
            action = new AdminHomeAction();
            try { forward = action.execute(request, response); } catch (Exception e) { e.printStackTrace(); }
        } else  if (command.equals("/admin/AdminCategoryAddTop.ac")) { // 최상위 추가 Action
            System.out.println("C: /admin/AdminCategoryAddTop.ac 호출");
            action = new AdminCategoryAddTopAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) { e.printStackTrace(); }
        } else if (command.equals("/admin/AdminCategoryAddChild.ac")) { // 자식 추가 Action
            System.out.println("C: /admin/AdminCategoryAddChild.ac 호출");
            action = new AdminCategoryAddChildAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) { e.printStackTrace(); }
        } else if (command.equals("/admin/AdminCategoryList.ac")) {
            System.out.println("C: /admin/AdminCategoryList.ac 호출");
            action = new AdminCategoryListAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/admin/AdminCategoryUpdate.ac")) {
            System.out.println("C: /admin/AdminCategoryUpdate.ac 호출 (수정 폼)");
            action = new AdminCategoryUpdateFormAction();
            try { forward = action.execute(request, response); } catch (Exception e) { e.printStackTrace(); }
        } else if (command.equals("/admin/AdminCategoryUpdatePro.ac")) {
            System.out.println("C: /admin/AdminCategoryUpdatePro.ac 호출 (수정 처리)");
            action = new AdminCategoryUpdateAction();
            try { forward = action.execute(request, response); } catch (Exception e) { e.printStackTrace(); }
        } else if (command.equals("/admin/AdminCategoryDelete.ac")) {
            System.out.println("C: /admin/AdminCategoryDelete.ac 호출 (삭제 처리)");
            action = new AdminCategoryDeleteAction();
            try { forward = action.execute(request, response); } catch (Exception e) { e.printStackTrace(); }
        } else if (command.equals("/admin/AdminChildCategoryDelete.ac")) {
            System.out.println("C: /admin/AdminChildCategoryDelete.ac 호출 (수정 폼 내 자식 삭제)");
            action = new AdminChildCategoryDeleteAction();
            try { forward = action.execute(request, response); } catch (Exception e) { e.printStackTrace(); }
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
        } else if (command.equals("/admin/AdminOrderView.ac")) {
             System.out.println("C: /admin/AdminOrderView.ac 호출");
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
       } else if (command.equals("/admin/AdminOrderDetail.ac")) {   // 페이지 상세조회
            System.out.println("C: /admin/AdminOrderDetail.ac 호출");
            action = new AdminOrderDetailAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/admin/AdminOrderAdd.ac")) { // 주문추가
            System.out.println("C: /admin/AdminOrderAdd.ac 호출");
            action = new AdminOrderAddAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/admin/AdminOrderModify.ac")) {  // 페이지 상세조회에서 주문 수정
            System.out.println("C: /admin/AdminOrderModify.ac 호출");
            action = new AdminOrderModifyAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        
        } else if (command.equals("/admin/AdminOrderDelete.ac")) { // 주문 삭제
            System.out.println("C: /admin/AdminOrderDelete.ac 호출");
            action = new AdminOrderDeleteAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/admin/AdminOrderStatusUpdate.ac")) { // 주문 상태 변경
            System.out.println("C: /admin/AdminOrderStatusUpdate.ac 호출");
            action = new AdminOrderStatusUpdateAction();
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
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
import com.admin.action.AdminCategoryListAction;
import com.admin.action.AdminProductDeleteAction;
import com.admin.action.AdminCategoryAddAction;
import com.admin.action.AdminProductListAction;
import com.admin.action.AdminProductUpdateAction;

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
        if (command.equals("/AdminCategoryList.ac")) {
            System.out.println("C: /AdminCategoryList.ac 호출");
            action = new AdminCategoryListAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/AdminCategoryAdd.ac")) {
            System.out.println("C: /AdminCategoryAdd.ac 호출");
            action = new AdminCategoryAddAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/AdminProductList.ac")) { 
            System.out.println("C: /AdminProductList.ac 호출");
            action = new AdminProductListAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/AdminProductUpdate.ac")) {
            System.out.println("C: /AdminProductUpdate.ac 호출");
             action = new AdminProductUpdateAction(); 
             try {
                 forward = action.execute(request, response);
             } catch (Exception e) {
                 e.printStackTrace();
             }
        } else if (command.equals("/AdminProductDelete.ac")) {
            System.out.println("C: /AdminProductDelete.ac 호출");
             action = new AdminProductDeleteAction(); 
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
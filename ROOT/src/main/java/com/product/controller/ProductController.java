package com.product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Action;
import com.ActionForward;
import com.product.action.ProductDetailAction;

// URL 패턴이 *.do 로 끝나는 모든 요청을 이 서블릿이 처리하도록 설정합니다.
@WebServlet("*.do")
public class ProductController extends HttpServlet {

    // GET, POST 방식 어떤 요청이든 doProcess() 메소드에서 한 번에 처리합니다.
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("C: ProductController.doProcess() 호출");
        
        // 1. 가상주소 계산
        String requestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String command = requestURI.substring(contextPath.length());
        
        System.out.println("C: 계산된 가상주소: " + command);
        
        Action action = null;
        ActionForward forward = null;
        
        // 2. 가상주소에 따른 처리
        if (command.equals("/productViewPage.do")) {
            System.out.println("C: /productViewPage.do 주소 호출됨");
            
            // ProductDetailAction 객체 생성
            action = new ProductDetailAction();
            
            try {
                // execute() 메소드 실행 후 포워딩 정보 반환
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } 
        /*
        else if (command.equals("/productList.do")) {
            System.out.println("C: /productList.do 주소 호출됨");
            // 나중에 상품 목록을 보여주는 Action을 만들 경우
            // action = new ProductListAction();
            // try {
            //     forward = action.execute(request, response);
            // } catch (Exception e) {
            //     e.printStackTrace();
            // }
        }
        */
        
        // ... 여기에 다른 상품 관련 .do 주소를 추가할 수 있습니다 ...
        
        
        // 3. 페이지 이동
        if (forward != null) {
            if (forward.isRedirect()) { // true: Redirect 방식
                System.out.println("C: Redirect 방식으로 페이지 이동: " + forward.getPath());
                response.sendRedirect(forward.getPath());
            } else { // false: Forward 방식
                System.out.println("C: Forward 방식으로 페이지 이동: " + forward.getPath());
                RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
                dis.forward(request, response);
            }
        } else {
             System.out.println("C: 이동할 페이지 정보(ActionForward)가 없습니다.");
        }
    }
}
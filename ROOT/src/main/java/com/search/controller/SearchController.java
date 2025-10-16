package com.search.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Action;
import com.ActionForward;
import com.search.action.SearchResultAction;

public class SearchController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("C: SearchController.doProcess() 호출");

        String requestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String command = requestURI.substring(contextPath.length());

        System.out.println("C: 계산된 가상주소: " + command);

        Action action = null;
        ActionForward forward = null;

        if (command.equals("/search/searchResultPage.do")) {
            System.out.println("C: /search/searchResultPage.do 주소 호출됨");
            action = new SearchResultAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

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

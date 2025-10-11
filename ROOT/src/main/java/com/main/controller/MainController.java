package com.main.controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet; // WebServlet 어노테이션 추가
import javax.servlet.http.*;

import com.Action; // com.util 패키지로 경로 수정
import com.ActionForward; // com.util 패키지로 경로 수정
import com.main.action.*; // MainAction 등이 위치할 패키지

@WebServlet("/*") // .ma로 끝나는 모든 요청을 이 컨트롤러가 처리
public class MainController extends HttpServlet {

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

    private void doProcess(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. 가상주소 계산 (안정적인 방식으로 변경)
        request.setCharacterEncoding("UTF-8");
        String command = request.getRequestURI().substring(request.getContextPath().length());
        System.out.println("Main Command: " + command);

        ActionForward forward = null;
        Action action = null;

        // 2. 가상주소 매핑
        // 루트 경로('/') 요청은 web.xml의 <welcome-file>로 처리하거나,
        // 별도의 인덱스 페이지에서 메인 액션 URL로 redirect 시키는 것이 일반적입니다.
        // 여기서는 /main.ma 요청이 메인 페이지를 보여준다고 가정합니다.
        if (command.equals("/")) {
            System.out.println("메인페이지 호출");
            action = new MainAction(); // MainAction 객체 생성
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        // ... 여기에 다른 main 관련 기능(예: 검색)을 추가할 수 있습니다.


        // 3. 페이지 이동
        if (forward != null) {
            if (forward.isRedirect()) {
                response.sendRedirect(forward.getPath());
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
                dispatcher.forward(request, response);
            }
        }
    }
}
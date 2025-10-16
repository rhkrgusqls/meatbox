package com.user.logout.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Action;
import com.ActionForward;

public class LogoutAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        // 현재 세션을 가져와서 무효화합니다.
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        // (이전과 동일하게 alert 후 메인 페이지로 이동)
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>");
        out.println("alert('로그아웃 되었습니다.');");
        out.println("location.href='/';"); // 로그인 페이지 경로
        out.println("</script>");
        out.close(); // out 객체를 닫아줍니다.

        return null;
    }
}
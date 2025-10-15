package com.user.logout.action;

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
        
        // ActionForward 객체를 생성하여 홈페이지로 리다이렉트합니다.
        ActionForward forward = new ActionForward();
        forward.setRedirect(true);
        forward.setPath("/"); // 메인 페이지 경로
        
        return forward;
    }
}
package com.user.login.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Action;
import com.ActionForward;
import com.user.login.db.LoginDAO;
import com.user.login.db.LoginException;
import com.user.login.db.LoginResultBean;

public class LoginAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        // 1️⃣ 파라미터 받기
        String memberId = request.getParameter("memberId");
        String passwd = request.getParameter("passwd");

        ActionForward forward = new ActionForward();
        LoginDAO dao = new LoginDAO();

        try {
            // 2️⃣ DAO 호출
            LoginResultBean result = dao.login(memberId, passwd);

            // 3️⃣ 세션에 로그인 정보 저장
            request.getSession().setAttribute("userIndex", result.getUserIndex());
            request.getSession().setAttribute("role", result.getRole());

            // 4️⃣ 성공 시 메인 페이지로 이동
            forward.setRedirect(true);
            forward.setPath("./");

        } catch (LoginException e) {
            // 5️⃣ 실패 시 로그인 페이지로 포워딩
            request.setAttribute("errorMessage", "로그인 실패: " + e.getMessage());
            forward.setRedirect(false);
            forward.setPath("/WEB-INF/views/login.jsp");
        }

        return forward;
    }
}
package com.user.login.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Action;
import com.ActionForward;
import com.user.login.db.LoginDAO;
import com.user.login.db.LoginException;
import com.user.login.db.LoginResultBean;

import org.json.JSONObject;
import java.io.PrintWriter;



public class LoginAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        // 1️⃣ 요청 파라미터 받기
        String memberId = request.getParameter("memberId");
        String passwd = request.getParameter("passwd");

        // 2️⃣ 응답 타입 설정
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();
        JSONObject json = new JSONObject();

        // 3️⃣ forward 객체 생성
        ActionForward forward = new ActionForward();

        try {
            // 로그인 처리
            LoginDAO dao = new LoginDAO();
            LoginResultBean result = dao.login(memberId, passwd);

            // 세션 저장
            HttpSession session = request.getSession();
            session.setAttribute("userIndex", result.getUserIndex());
            session.setAttribute("role", result.getRole());

            // JSON 응답
            json.put("success", true);
            json.put("message", "로그인 성공!");
            json.put("userIndex", result.getUserIndex());
            json.put("role", result.getRole());

            // 로그인 성공 시 페이지 이동 (원하면 주석 해제)
            forward.setRedirect(false);
            forward.setPath("/fo/main/main.jsp");

        } catch (LoginException e) {
            json.put("success", false);
            json.put("message", "로그인 실패: " + e.getMessage());

            forward.setRedirect(false);
            forward.setPath("/fo/main/login.jsp"); // 실패 시 다시 로그인 페이지로

        } catch (Exception e) {
            json.put("success", false);
            json.put("message", "서버 오류가 발생했습니다: " + e.getMessage());

            forward.setRedirect(false);
            forward.setPath("/error.jsp"); // 에러 페이지로
        }

        // JSON 출력
        out.print(json.toString());
        out.flush();

        // ActionForward 리턴
        return forward;
    }
}
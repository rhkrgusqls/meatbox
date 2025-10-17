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

            // 사용자 이름 가져오기
            String userName = dao.getUserName(result.getUserIndex());

            // 세션 저장
            HttpSession session = request.getSession();
            session.setAttribute("userIndex", result.getUserIndex());
            session.setAttribute("role", result.getRole());
            session.setAttribute("userName", userName); // 세션에 userName 추가

            // JSON 응답
            json.put("success", true);
            json.put("message", "로그인 성공!");
            json.put("userIndex", result.getUserIndex());
            json.put("role", result.getRole());
            json.put("userName", userName); // JSON에 userName 추가
            json.put("redirectUrl", "/"); // 리다이렉트 URL 추가

        } catch (LoginException e) {
            json.put("success", false);
            json.put("message", "로그인 실패: " + e.getMessage());

        } catch (Exception e) {
            json.put("success", false);
            json.put("message", "서버 오류가 발생했습니다: " + e.getMessage());
        }

        // JSON 출력
        out.print(json.toString());
        out.flush();

        // ActionForward 리턴 대신 null 리턴
        return null;
    }
}
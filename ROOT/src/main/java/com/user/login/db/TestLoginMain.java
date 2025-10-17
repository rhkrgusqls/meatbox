package com.user.login.db;

public class TestLoginMain {

    public static void main(String[] args) {
        try {
            LoginDAO dao = new LoginDAO();

            // ✅ 테스트 계정 입력 (DB에 실제 존재해야 함)
            String testId = "admin";
            String testPw = "admin";

            // 로그인 시도
            LoginResultBean result = dao.login(testId, testPw);

            System.out.println("✅ 로그인 성공!");
            System.out.println("User Index : " + result.getUserIndex());
            System.out.println("Role Code  : " + result.getRole());
        } catch (LoginException e) {

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

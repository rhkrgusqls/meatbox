package com.user.login.db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import jdbc.db.connection.DBConnectionManager;

public class LoginDAO {

    public LoginResultBean login(String id, String password) throws LoginException {
        try (Connection conn = DBConnectionManager.getConnection();
             CallableStatement stmt = conn.prepareCall("{CALL sp_login_user(?, ?, ?, ?, ?)}")) {

            stmt.setString(1, id);
            stmt.setString(2, password);
            stmt.registerOutParameter(3, java.sql.Types.INTEGER); // user_index
            stmt.registerOutParameter(4, java.sql.Types.INTEGER); // role
            stmt.registerOutParameter(5, java.sql.Types.INTEGER); // result_code

            stmt.execute();

            int resultCode = stmt.getInt(5);

            if (resultCode != 1) { // 실패
                throw new LoginException(resultCode);
            }

            int userIndex = stmt.getInt(3);
            int role = stmt.getInt(4);

            return new LoginResultBean(userIndex, role);

        } catch (SQLException e) {
            e.printStackTrace();
            throw new LoginException(-99); // 알 수 없는 오류
        }
    }
}


/*
        LoginDAO dao = new LoginDAO();

        // 1️ 정상 로그인 테스트
        try {
            LoginResultBean result1 = dao.login("testuser2", "1234");
            System.out.println("로그인 성공, user_index: " + result1.getUserIndex() 
                + ", role: " + result1.getRole());
        } catch (LoginException e) {
            System.out.println("로그인 실패: " + e.getMessage());
        }
*/
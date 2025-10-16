package com.user.login.db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

    /**
     * userIndex를 사용하여 사용자 이름을 조회합니다.
     * @param userIndex 조회할 사용자의 인덱스
     * @return 사용자 이름 (조회 실패 시 null)
     */
    public String getUserName(int userIndex) {
        String userName = null;
        String sql = "SELECT name FROM meatbox.users WHERE user_index = ?"; // 'users' 테이블과 'user_name', 'user_index' 컬럼을 가정합니다.

        try (Connection conn = DBConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, userIndex);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    userName = rs.getString("name");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // 실제 프로덕션 코드에서는 로깅 라이브러리를 사용하는 것이 좋습니다.
            // 예: log.error("Error getting user name for userIndex: " + userIndex, e);
        }
        return userName;
    }
}


/*
    // getUserName 메소드 테스트 예시
    public static void main(String[] args) {
        LoginDAO dao = new LoginDAO();

        // 1️ 정상 로그인 테스트
        try {
            LoginResultBean result1 = dao.login("testuser2", "1234");
            System.out.println("로그인 성공, user_index: " + result1.getUserIndex()
                + ", role: " + result1.getRole());

            // userIndex로 userName 조회 테스트
            String userName = dao.getUserName(result1.getUserIndex());
            if (userName != null) {
                System.out.println("조회된 사용자 이름: " + userName);
            } else {
                System.out.println("사용자 이름을 찾을 수 없습니다.");
            }

        } catch (LoginException e) {
            System.out.println("로그인 실패: " + e.getMessage());
        }
    }
*/
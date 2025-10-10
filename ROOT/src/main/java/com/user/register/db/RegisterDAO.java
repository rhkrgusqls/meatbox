package com.user.register.db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import jdbc.db.connection.DBConnectionManager;

public class RegisterDAO implements RegisterInterface {

	@Override
	public int register_normaluser(String id, String password, String name) throws RegisterException {
	    Connection conn = null;
	    CallableStatement stmt = null;

	    try {
	        conn = DBConnectionManager.getConnection();

	        stmt = conn.prepareCall("{CALL create_default_user(?, ?, ?, ?, ?)}");
	        stmt.setString(1, id);
	        stmt.setString(2, password);
	        stmt.setString(3, name);
	        stmt.setString(4, "NORMAL");
	        stmt.registerOutParameter(5, java.sql.Types.INTEGER);

	        stmt.execute();

	        int result = stmt.getInt(5);

	        if (result <= 0) { // 에러 코드 발생 시
	            throw new RegisterException(result);
	        }

	        return result; // 정상 user_index 반환

	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw new RegisterException(-1);
	    } finally {
	        try { if (stmt != null) stmt.close(); } catch (SQLException e) {}
	    }
	}

    @Override
    public int register_selleruser() {
        // 미구현
        return -1;
    }

    @Override
    public int register_adminuser() {
        // 미구현
        return -1;
    }
}
/*
        RegisterDAO dao = new RegisterDAO();

        // 정상 회원가입 테스트
        try {
            int result1 = dao.register_normaluser("testuser2", "1234", "홍길동");
            System.out.println("회원가입 성공, user_index: " + result1);
        } catch (RegisterException e) {
            System.out.println("회원가입 실패: " + e.getMessage());
        }
*/
package com.user.register.db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import jdbc.db.connection.DBConnectionManager;
import org.json.JSONObject;

public class RegisterDAO implements RegisterInterface {

	// NORMAL USER 등록
	@Override
	public int register_normaluser(String id, String password, String name) throws RegisterException {
	    try (Connection conn = DBConnectionManager.getConnection();
	         CallableStatement stmt = conn.prepareCall("{CALL create_default_user(?, ?, ?, ?, ?, ?, ?)}")) {
	        // 파라미터 순서: p_id, p_password, p_name, p_role, p_result(OUT), p_seller_json(NULL), p_admin_json(NULL)
	        stmt.setString(1, id);        // p_id
	        stmt.setString(2, password);  // p_password
	        stmt.setString(3, name);      // p_name
	        stmt.setString(4, "NORMAL");  // p_role
	        stmt.registerOutParameter(5, java.sql.Types.INTEGER); // OUT p_result
	        stmt.setString(6, null); // p_seller_json
	        stmt.setString(7, null); // p_admin_json

	        stmt.execute();

	        int result = stmt.getInt(5); // OUT p_result
	        if (result <= 0) {
	            throw new RegisterException(result);
	        }
	        return result;

	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw new RegisterException(-99);
	    }
	}


    // SELLER USER 등록
    @Override
    public int register_selleruser(String id, String password, String name,
                                   String businessNumber, String companyName,
                                   String ceoName, String businessType,
                                   String businessItem, String phoneNumber,
                                   String storeType) throws RegisterException {

        try (Connection conn = DBConnectionManager.getConnection();
             CallableStatement stmt = conn.prepareCall("{CALL create_default_user(?, ?, ?, ?, ?, ?, ?)}")) {

            // SELLER JSON 생성
            JSONObject sellerJson = new JSONObject();
            sellerJson.put("businessNumber", businessNumber);
            sellerJson.put("companyName", companyName);
            sellerJson.put("ceoName", ceoName);
            sellerJson.put("businessType", businessType);
            sellerJson.put("businessItem", businessItem);
            sellerJson.put("phoneNumber", phoneNumber);
            sellerJson.put("storeType", storeType);

            // 파라미터 순서: p_id, p_password, p_name, p_role, p_result(OUT), p_seller_json, p_admin_json
            stmt.setString(1, id);
            stmt.setString(2, password);
            stmt.setString(3, name);
            stmt.setString(4, "SELLER");
            stmt.registerOutParameter(5, java.sql.Types.INTEGER); // OUT p_result
            stmt.setString(6, sellerJson.toString());
            stmt.setString(7, null); // ADMIN JSON은 null

            stmt.execute();

            int result = stmt.getInt(5);
            if (result <= 0) {
                throw new RegisterException(result);
            }

            return result;

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RegisterException(-99);
        }
    }

    @Override
    public int register_adminuser() {
        return -1; // ADMIN은 아직 구현하지 않음
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
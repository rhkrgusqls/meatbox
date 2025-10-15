package com.order.db;

import java.sql.*;
import jdbc.db.connection.DBConnectionManager;

public class PurchaseDAO implements PurchaseInterface {

    @Override
    public int purchase_product(
            int userIndex,
            int[] product_id,
            int[] product_option_id,
            int payment_method_id,
            int discount_amount,
            int shipping_fee,
            int used_points
    ) {
        Connection conn = null;
        CallableStatement cstmt = null;
        int result = -1;

        try {
            // ✅ 1. JSON 배열로 변환
            String productJson = buildJsonArray(product_id);
            String optionJson = buildJsonArray(product_option_id);

            // ✅ 2. DB 커넥션
            conn = DBConnectionManager.getConnection();

            // ✅ 3. 프로시저 호출
            cstmt = conn.prepareCall("{CALL purchase_product(?, ?, ?, ?, ?, ?, ?, ?)}");

            // IN 파라미터
            cstmt.setInt(1, userIndex);
            cstmt.setString(2, productJson);
            cstmt.setString(3, optionJson);
            cstmt.setInt(4, payment_method_id);
            cstmt.setInt(5, discount_amount);
            cstmt.setInt(6, shipping_fee);
            cstmt.setInt(7, used_points);

            // OUT 파라미터
            cstmt.registerOutParameter(8, Types.INTEGER);

            // ✅ 4. 실행
            cstmt.execute();

            // ✅ 5. 결과 반환
            result = cstmt.getInt(8);

        } catch (SQLException e) {
            e.printStackTrace();
            result = -1; // 실패
        } finally {
            try {
                if (cstmt != null) cstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ignored) {}
        }

        return result;
    }

    /** Converts int[] → JSON string */
    private String buildJsonArray(int[] arr) {
        if (arr == null || arr.length == 0) return "[]";
        StringBuilder sb = new StringBuilder("[");
        for (int i = 0; i < arr.length; i++) {
            sb.append(arr[i]);
            if (i < arr.length - 1) sb.append(",");
        }
        sb.append("]");
        return sb.toString();
    }
}

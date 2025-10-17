package com.order.db;

import jdbc.db.connection.DBConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PaymentMethodDAO {

    public List<PaymentMethodDTO> getPaymentMethodsByUserIndex(int userIndex) {
        List<PaymentMethodDTO> paymentMethods = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM payment_methods WHERE user_index = ?";

        try {
            conn = DBConnectionManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userIndex);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                PaymentMethodDTO paymentMethod = new PaymentMethodDTO();
                paymentMethod.setPayment_method_id(rs.getInt("payment_method_id"));
                paymentMethod.setUser_index(rs.getInt("user_index"));
                paymentMethod.setProvider(rs.getString("provider"));
                paymentMethods.add(paymentMethod);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return paymentMethods;
    }

    public boolean addPaymentMethod(int userIndex, String provider) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean success = false;

        String sql = "INSERT INTO payment_methods (user_index, provider) VALUES (?, ?)";

        try {
            conn = DBConnectionManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userIndex);
            pstmt.setString(2, provider);
            int result = pstmt.executeUpdate();

            if (result > 0) {
                System.out.println("Payment method added successfully.");
                success = true;
            } else {
                System.out.println("Failed to add payment method.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return success;
    }
}

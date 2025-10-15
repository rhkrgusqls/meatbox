package com.cart.db;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import jdbc.db.connection.DBConnectionManager;

public class CartDAO {

    // 1. 장바구니에 추가
    public void addCart(int userIndex, int productId, int optionId, int quantity) throws SQLException {
        String sql = "INSERT INTO cart(user_index, product_id, option_id, quantity) " +
                     "VALUES (?, ?, ?, ?) " +
                     "ON DUPLICATE KEY UPDATE quantity = quantity + ?";
        try (Connection conn = DBConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, userIndex);
            pstmt.setInt(2, productId);
            pstmt.setInt(3, optionId);
            pstmt.setInt(4, quantity);
            pstmt.setInt(5, quantity);

            pstmt.executeUpdate();
        }
    }

    // 2. 장바구니 조회 (전체)
    public List<CartItem> getCartList(int userIndex) throws SQLException {
        List<CartItem> cartList = new ArrayList<>();
        String sql = "SELECT product_id, option_id, quantity FROM cart WHERE user_index = ?";
        try (Connection conn = DBConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, userIndex);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    int productId = rs.getInt("product_id");
                    int optionId = rs.getInt("option_id");
                    int quantity = rs.getInt("quantity");
                    cartList.add(new CartItem(userIndex, productId, optionId, quantity));
                }
            }
        }
        return cartList;
    }

    // 3. 장바구니에서 특정 상품 삭제
    public void deleteCartItem(int userIndex, int productId, int optionId) throws SQLException {
        String sql = "DELETE FROM cart WHERE user_index = ? AND product_id = ? AND option_id = ?";
        try (Connection conn = DBConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, userIndex);
            pstmt.setInt(2, productId);
            pstmt.setInt(3, optionId);

            pstmt.executeUpdate();
        }
    }

    // 4. 장바구니 전체 삭제
    public void deleteAllCart(int userIndex) throws SQLException {
        String sql = "DELETE FROM cart WHERE user_index = ?";
        try (Connection conn = DBConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, userIndex);
            pstmt.executeUpdate();
        }
    }
}

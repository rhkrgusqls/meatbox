package com.product.seller.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import jdbc.db.connection.DBConnectionManager;

public class ProductRegisterRequestDAO {

    private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;

    /**
     * 상품 등록 요청 생성
     */
    public int insertRequest(ProductRegisterRequestBean bean) throws SQLException {
        String sql = "INSERT INTO product_register_request ("
                   + "user_index, product_name, received_date, expire_date, storage_type, "
                   + "sale_tag, product_form, delivery_fee, allowed_member_lv, price, unit_price, "
                   + "seller_note, review_preview_1_id, review_preview_2_id, review_preview_3_id, "
                   + "product_options_json, product_images_json, product_details_json, request_status"
                   + ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            pstmt.setInt(1, bean.getUserIndex());
            pstmt.setString(2, bean.getProductName());
            pstmt.setTimestamp(3, bean.getReceivedDate());
            pstmt.setTimestamp(4, bean.getExpireDate());
            pstmt.setString(5, bean.getStorageType());
            pstmt.setString(6, bean.getSaleTag());
            pstmt.setString(7, bean.getProductForm());
            pstmt.setInt(8, bean.getDeliveryFee());
            pstmt.setInt(9, bean.getAllowedMemberLv());
            pstmt.setInt(10, bean.getPrice());
            pstmt.setInt(11, bean.getUnitPrice());
            pstmt.setString(12, bean.getSellerNote());
            pstmt.setObject(13, bean.getReviewPreview1Id());
            pstmt.setObject(14, bean.getReviewPreview2Id());
            pstmt.setObject(15, bean.getReviewPreview3Id());
            pstmt.setString(16, bean.getProductOptionsJson());
            pstmt.setString(17, bean.getProductImagesJson());
            pstmt.setString(18, bean.getProductDetailsJson());
            pstmt.setString(19, "PENDING"); // 기본 상태

            pstmt.executeUpdate();

            try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1); // 생성된 요청 ID 반환
                } else {
                    throw new SQLException("상품 등록 요청 생성 실패, ID를 가져올 수 없습니다.");
                }
            }
        }
    }
}

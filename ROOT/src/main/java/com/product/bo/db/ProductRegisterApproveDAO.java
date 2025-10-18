package com.product.bo.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import com.product.seller.db.ProductRegisterRequestBean;

import jdbc.db.connection.DBConnectionManager;

public class ProductRegisterApproveDAO {

    /**
     * 요청 승인 및 product 생성
     * @param requestId 승인할 요청 ID
     * @return 생성된 product_id
     * @throws SQLException
     */
    public int approveProductRequest(int requestId) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int productId = -1;

        try {
            con = DBConnectionManager.getConnection();
            con.setAutoCommit(false); // 트랜잭션 시작

            // 1. 요청 조회 (PENDING)
            String selectSql = "SELECT * FROM product_register_request WHERE request_id = ? AND request_status = 'PENDING' FOR UPDATE";
            pstmt = con.prepareStatement(selectSql);
            pstmt.setInt(1, requestId);
            rs = pstmt.executeQuery();

            if (!rs.next()) {
                throw new SQLException("승인할 요청이 없거나 이미 처리된 요청입니다.");
            }

            // 요청 데이터 가져오기
            int userIndex = rs.getInt("user_index");
            String productName = rs.getString("product_name");
            java.sql.Timestamp receivedDate = rs.getTimestamp("received_date");
            java.sql.Timestamp expireDate = rs.getTimestamp("expire_date");
            String storageType = rs.getString("storage_type");
            String saleTag = rs.getString("sale_tag");
            String productForm = rs.getString("product_form");
            int deliveryFee = rs.getInt("delivery_fee");
            int allowedMemberLv = rs.getInt("allowed_member_lv");
            int price = rs.getInt("price");
            String unitPrice = rs.getString("unit_price");
            String sellerNote = rs.getString("seller_note");
            Integer reviewPreview1Id = (Integer) rs.getObject("review_preview_1_id");
            Integer reviewPreview2Id = (Integer) rs.getObject("review_preview_2_id");
            Integer reviewPreview3Id = (Integer) rs.getObject("review_preview_3_id");
            String productOptionsJson = rs.getString("product_options_json");
            String productImagesJson = rs.getString("product_images_json");
            String productDetailsJson = rs.getString("product_details_json");

            rs.close();
            pstmt.close();

            // 2. product 테이블 삽입
            String insertProductSql = "INSERT INTO product (user_index, product_name, received_date, expire_date, storage_type, "
                                    + "sale_tag, product_form, delivery_fee, allowed_member_lv, price, unit_price, seller_note, "
                                    + "review_preview_1_id, review_preview_2_id, review_preview_3_id) "
                                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(insertProductSql, PreparedStatement.RETURN_GENERATED_KEYS);
            pstmt.setInt(1, userIndex);
            pstmt.setString(2, productName);
            pstmt.setTimestamp(3, receivedDate);
            pstmt.setTimestamp(4, expireDate);
            pstmt.setString(5, storageType);
            pstmt.setString(6, saleTag);
            pstmt.setString(7, productForm);
            pstmt.setInt(8, deliveryFee);
            pstmt.setInt(9, allowedMemberLv);
            pstmt.setInt(10, price);
            pstmt.setString(11, unitPrice);
            pstmt.setString(12, sellerNote);
            pstmt.setObject(13, reviewPreview1Id);
            pstmt.setObject(14, reviewPreview2Id);
            pstmt.setObject(15, reviewPreview3Id);

            pstmt.executeUpdate();
            rs = pstmt.getGeneratedKeys();
            if (rs.next()) {
                productId = rs.getInt(1);
            } else {
                throw new SQLException("상품 생성 실패, product_id를 가져올 수 없음");
            }
            rs.close();
            pstmt.close();

            // 3. product_options_json 처리
            if (productOptionsJson != null && !productOptionsJson.isEmpty()) {
                JSONArray options = new JSONArray(productOptionsJson);
                String optionSql = "INSERT INTO product_option (product_id, option_name, option_detail, price_of_option, quantity) "
                                 + "VALUES (?, ?, ?, ?, ?)";
                try (PreparedStatement optionPstmt = con.prepareStatement(optionSql)) {
                    for (int i = 0; i < options.length(); i++) {
                        JSONObject opt = options.getJSONObject(i);
                        optionPstmt.setInt(1, productId);
                        optionPstmt.setString(2, opt.getString("option_name"));
                        optionPstmt.setString(3, opt.optString("option_detail", null));
                        optionPstmt.setInt(4, opt.optInt("price_of_option", 0));
                        optionPstmt.setInt(5, opt.optInt("quantity", 1));
                        optionPstmt.addBatch();
                    }
                    optionPstmt.executeBatch();
                }
            }

            // 4. product_images_json 처리
            if (productImagesJson != null && !productImagesJson.isEmpty()) {
                JSONArray images = new JSONArray(productImagesJson);
                String imageSql = "INSERT INTO product_image (product_id, dir) VALUES (?, ?)";
                try (PreparedStatement imagePstmt = con.prepareStatement(imageSql)) {
                    for (int i = 0; i < images.length(); i++) {
                        JSONObject img = images.getJSONObject(i);
                        imagePstmt.setInt(1, productId);
                        imagePstmt.setString(2, img.getString("dir"));
                        imagePstmt.addBatch();
                    }
                    imagePstmt.executeBatch();
                }
            }

            // 5. product_details_json 처리
            if (productDetailsJson != null && !productDetailsJson.isEmpty()) {
                JSONArray details = new JSONArray(productDetailsJson);
                String detailSql = "INSERT INTO product_detail (product_id, dir) VALUES (?, ?)";
                try (PreparedStatement detailPstmt = con.prepareStatement(detailSql)) {
                    for (int i = 0; i < details.length(); i++) {
                        JSONObject dtl = details.getJSONObject(i);
                        detailPstmt.setInt(1, productId);
                        detailPstmt.setString(2, dtl.getString("dir"));
                        detailPstmt.addBatch();
                    }
                    detailPstmt.executeBatch();
                }
            }

            // 6. 요청 상태 APPROVED로 변경
            String updateRequestSql = "UPDATE product_register_request SET request_status = 'APPROVED' WHERE request_id = ?";
            pstmt = con.prepareStatement(updateRequestSql);
            pstmt.setInt(1, requestId);
            pstmt.executeUpdate();
            pstmt.close();

            // 7. 필요 시 요청 삭제 (삭제하고 싶으면 아래 사용)
            // String deleteRequestSql = "DELETE FROM product_register_request WHERE request_id = ?";
            // pstmt = con.prepareStatement(deleteRequestSql);
            // pstmt.setInt(1, requestId);
            // pstmt.executeUpdate();
            // pstmt.close();

            con.commit(); // 트랜잭션 커밋

        } catch (SQLException e) {
            if (con != null) con.rollback();
            throw e;
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
            try { if (con != null) con.setAutoCommit(true); con.close(); } catch (Exception e) {}
        }

        return productId;
    }

    /**
     * 특정 요청 조회
     */
    public ProductRegisterRequestBean getRequestById(int requestId) throws SQLException {
        String sql = "SELECT * FROM product_register_request WHERE request_id = ?";
        ProductRegisterRequestBean bean = null;

        try (Connection conn = DBConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, requestId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    bean = new ProductRegisterRequestBean();
                    bean.setUserIndex(rs.getInt("user_index"));
                    bean.setProductName(rs.getString("product_name"));
                    bean.setReceivedDate(rs.getTimestamp("received_date"));
                    bean.setExpireDate(rs.getTimestamp("expire_date"));
                    bean.setStorageType(rs.getString("storage_type"));
                    bean.setSaleTag(rs.getString("sale_tag"));
                    bean.setProductForm(rs.getString("product_form"));
                    bean.setDeliveryFee(rs.getInt("delivery_fee"));
                    bean.setAllowedMemberLv(rs.getInt("allowed_member_lv"));
                    bean.setPrice(rs.getInt("price"));
                    bean.setUnitPrice(rs.getString("unit_price"));
                    bean.setSellerNote(rs.getString("seller_note"));
                    bean.setReviewPreview1Id((Integer) rs.getObject("review_preview_1_id"));
                    bean.setReviewPreview2Id((Integer) rs.getObject("review_preview_2_id"));
                    bean.setReviewPreview3Id((Integer) rs.getObject("review_preview_3_id"));
                    bean.setProductOptionsJson(rs.getString("product_options_json"));
                    bean.setProductImagesJson(rs.getString("product_images_json"));
                    bean.setProductDetailsJson(rs.getString("product_details_json"));
                }
            }
        }

        return bean;
    }

    /**
     * 전체 요청 조회
     */
    public List<ProductRegisterRequestBean> getAllRequests() throws SQLException {
        String sql = "SELECT * FROM product_register_request WHERE request_status = 'PENDING' ORDER BY request_id DESC";
        List<ProductRegisterRequestBean> list = new ArrayList<>();

        try (Connection conn = DBConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                ProductRegisterRequestBean bean = new ProductRegisterRequestBean();
                
                // request_id 추가
                bean.setRequestId(rs.getInt("request_id"));
                
                bean.setUserIndex(rs.getInt("user_index"));
                bean.setProductName(rs.getString("product_name"));
                bean.setReceivedDate(rs.getTimestamp("received_date"));
                bean.setExpireDate(rs.getTimestamp("expire_date"));
                bean.setStorageType(rs.getString("storage_type"));
                bean.setSaleTag(rs.getString("sale_tag"));
                bean.setProductForm(rs.getString("product_form"));
                bean.setDeliveryFee(rs.getInt("delivery_fee"));
                bean.setAllowedMemberLv(rs.getInt("allowed_member_lv"));
                bean.setPrice(rs.getInt("price"));
                bean.setUnitPrice(rs.getString("unit_price"));
                bean.setSellerNote(rs.getString("seller_note"));
                bean.setReviewPreview1Id((Integer) rs.getObject("review_preview_1_id"));
                bean.setReviewPreview2Id((Integer) rs.getObject("review_preview_2_id"));
                bean.setReviewPreview3Id((Integer) rs.getObject("review_preview_3_id"));
                bean.setProductOptionsJson(rs.getString("product_options_json"));
                bean.setProductImagesJson(rs.getString("product_images_json"));
                bean.setProductDetailsJson(rs.getString("product_details_json"));

                list.add(bean);
            }
        }

        return list;
    }

}


package com.product.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.db.connection.DBConnectionManager;

public class ProductDAO implements ProductInterface {

    @Override
    public ProductBean product_detail(int productID) {
        ProductBean product = null;
        String sql = "SELECT * FROM product WHERE product_id = ?";

        try (
            Connection conn = DBConnectionManager.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)
        ) {
            pstmt.setInt(1, productID);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                product = new ProductBean();
                product.set_product_id(rs.getInt("product_id"));
                product.set_user_index(rs.getInt("user_index"));
                product.set_quantity(rs.getInt("quantity"));
                product.set_received_date(rs.getTimestamp("received_date"));
                product.set_expire_date(rs.getTimestamp("expire_date"));

                product.set_storage_type(StorageType.valueOf(rs.getString("storage_type")));
                product.set_sale_tag(rs.getString("sale_tag"));
                product.set_product_form(ProductForm.valueOf(rs.getString("product_form")));

                product.set_delivery_fee(rs.getInt("delivery_fee"));
                product.set_allowed_member_lv(rs.getInt("allowed_member_lv"));
                product.set_price(rs.getInt("price"));
                product.set_unit_price(rs.getInt("unit_price"));
                product.set_seller_note(rs.getString("seller_note"));
                product.set_review_preview_1_id(rs.getInt("review_preview_1_id"));
                product.set_review_preview_2_id(rs.getInt("review_preview_2_id"));
                product.set_review_preview_3_id(rs.getInt("review_preview_3_id"));
            }

            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return product;
    }
}

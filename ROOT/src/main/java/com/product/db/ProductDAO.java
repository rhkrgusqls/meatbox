package com.product.db;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import jdbc.db.connection.DBConnectionManager;

public class ProductDAO implements ProductInterface {

    @Override
    public List<ProductBean> selectProducts(String brandNumber, String storageType, String saleTag,
                                            String productForm, Integer allowedMemberLv,
                                            String categoryName, String detailCategoryName,
                                            int offset, int limit) throws ProductException {
        List<ProductBean> resultList = new ArrayList<>();

        String sql = "SELECT * FROM view_product_full_info WHERE 1=1"
                + " AND (? IS NULL OR brand_number = ?)"
                + " AND (? IS NULL OR storage_type = ?)"
                + " AND (? IS NULL OR sale_tag = ?)"
                + " AND (? IS NULL OR product_form = ?)"
                + " AND (? IS NULL OR allowed_member_lv = ?)"
                + " AND (? IS NULL OR category_name = ?)"
                + " AND (? IS NULL OR detail_category_name = ?)"
                + " LIMIT ? OFFSET ?";

        try (Connection conn = DBConnectionManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, brandNumber);
            stmt.setString(2, brandNumber);

            stmt.setString(3, storageType);
            stmt.setString(4, storageType);

            stmt.setString(5, saleTag);
            stmt.setString(6, saleTag);

            stmt.setString(7, productForm);
            stmt.setString(8, productForm);

            if (allowedMemberLv != null) {
                stmt.setInt(9, allowedMemberLv);
                stmt.setInt(10, allowedMemberLv);
            } else {
                stmt.setNull(9, Types.INTEGER);
                stmt.setNull(10, Types.INTEGER);
            }

            stmt.setString(11, categoryName);
            stmt.setString(12, categoryName);

            stmt.setString(13, detailCategoryName);
            stmt.setString(14, detailCategoryName);

            stmt.setInt(15, limit);
            stmt.setInt(16, offset);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    ProductBean p = new ProductBean();
                    p.setProductId(rs.getInt("product_id"));
                    p.setBrandNumber(rs.getString("brand_number"));
                    p.setBrandName(rs.getString("brand_name"));
                    p.setStorageType(rs.getString("storage_type"));
                    p.setSaleTag(rs.getString("sale_tag"));
                    p.setProductForm(rs.getString("product_form"));
                    p.setAllowedMemberLv(rs.getInt("allowed_member_lv"));
                    p.setQuantity(rs.getInt("quantity"));
                    p.setExpireDate(rs.getString("expire_date"));
                    p.setDeliveryFee(rs.getInt("delivery_fee"));
                    p.setPrice(rs.getInt("price"));
                    p.setUnitPrice(rs.getInt("unit_price"));
                    p.setSellerNote(rs.getString("seller_note"));
                    p.setCategoryName(rs.getString("category_name"));
                    p.setDetailCategoryName(rs.getString("detail_category_name"));
                    p.setProductImage(rs.getString("product_image"));
                    p.setProductDetail(rs.getString("product_detail"));
                    p.setCautionsText(rs.getString("cautions_text"));

                    resultList.add(p);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new ProductException("");
        }

        return resultList;
    }
    
    public List<CategoryBean> getCategoriesByParent(Integer parentId) throws SQLException {
        List<CategoryBean> list = new ArrayList<>();

        String sql;
        if (parentId == null)
            sql = "SELECT category_id, category_name, level FROM v_category WHERE parent_category_id IS NULL ORDER BY category_id";
        else
            sql = "SELECT category_id, category_name, level FROM v_category WHERE parent_category_id = ? ORDER BY category_id";

        try (Connection conn = DBConnectionManager.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (parentId != null)
                ps.setInt(1, parentId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    CategoryBean bean = new CategoryBean();
                    bean.setCategoryId(rs.getInt("category_id"));
                    bean.setCategoryName(rs.getString("category_name"));
                    bean.setLevel(rs.getInt("level"));
                    list.add(bean);
                }
            }
        }
        return list;
    }


}

